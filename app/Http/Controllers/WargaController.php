<?php

namespace App\Http\Controllers;

use App\Pesan;
use App\User;
use App\Warga;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class WargaController extends Controller
{
    public function add(Request $request)
    {
        $user = new User;
        $user->status = 'warga';
        $user->name = $request->nama_warga;
        $user->username = $request->username;
        $user->password = bcrypt($request->password);
        $user->remember_token = Str::random(60);
        $user->save();

        $request->request->add(['user_id' => $user->id]);
        $warga = Warga::create($request->all());

        return redirect('/daftarWarga');
    }

    public function listWarga()
    {
        $warga = Warga::all();
        return view('admin.listWarga', ['warga' => $warga]);
    }

    public function isiBiodata()
    {
        return view('warga.isiBiodata');
    }

    public function delete(Warga $id)
    {
        // $id_user = $id->user_id;
        // $user = User::find($id_user);
        // $user->delete($user);

        $id->pesan()->forceDelete();
        $id->biodata_warga()->forceDelete();
        $id->user()->forceDelete();
        $id->delete($id);
        return back()->with('sukses', 'Data Warga Berhasil Dihapus');
    }
}

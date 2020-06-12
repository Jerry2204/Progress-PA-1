<?php

namespace App\Http\Controllers;

use App\Biodata_warga;
use App\Warga;
use Illuminate\Http\Request;

class Biodata_wargaController extends Controller
{
    public function add(Request $request, $id)
    {
        $this->validate($request, [
            'agama' => 'required',
            'jenis_kelamin' => 'required',
            'tanggal_lahir' => 'required',
            'foto' => 'required'
        ]);

        $biodata_warga = new Biodata_warga;
        $biodata_warga->warga_id = $id;
        $biodata_warga->agama = $request->agama;
        $biodata_warga->jenis_kelamin = $request->jenis_kelamin;
        $biodata_warga->tanggal_lahir = $request->tanggal_lahir;
        if($request->hasFile('foto')){
            $request->file('foto')->move('asset/images/',$request->file('foto')->getClientOriginalName());
            $biodata_warga->foto = $request->file('foto')->getClientOriginalName();
        }
        $biodata_warga->save();
        return back()->with('sukses', 'Biodata berhasil disimpan');
    }
}

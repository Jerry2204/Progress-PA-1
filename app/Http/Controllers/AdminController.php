<?php

namespace App\Http\Controllers;

use App\Admin;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AdminController extends Controller
{
    public function add(Request $request)
    {
        $this->validate($request, [
            'nama_admin' => 'required',
            'jenis_kelamin' => 'required',
            'alamat' => 'required',
            'username' => 'required',
            'password' => 'required',
            'tanggal_lahir' => 'required',
            'foto' => 'required'
        ]);

        $user = new User;
        $user->status = 'admin';
        $user->name = $request->nama_admin;
        $user->username = $request->username;
        $user->password = bcrypt($request->password);
        $user->remember_token = Str::random(60);
        $user->save();

        $admin = new Admin;
        $admin->user_id = $user->id;
        $admin->nama_admin = $request->nama_admin;
        $admin->jenis_kelamin = $request->jenis_kelamin;
        $admin->alamat = $request->alamat;
        $admin->tanggal_lahir = $request->tanggal_lahir;
        if($request->hasFile('foto')){
            $request->file('foto')->move('asset/images/',$request->file('foto')->getClientOriginalName());
            $admin->foto = $request->file('foto')->getClientOriginalName();
        }
        $admin->save();
        return back()->with('sukses', 'Admin Berhasil Ditambahkan');
    }

    public function index()
    {
        $admin = Admin::all();
        return view('admin.listAdmin', ['admin' => $admin]);
    }

    public function profile(User $id)
    {
        return view('admin.profile', ['user' => $id]);
    }

    public function create()
    {
        return view('admin.daftarAdmin');
    }

    public function destroy(Admin $id)
    {
        $id->user()->forceDelete();
        $id->delete($id);

        return back()->with('sukses', 'Data Berhasil Dihapus');

    }

    public function edit(Admin $id)
    {
        return view('admin.editProfile', ['admin' => $id]);
    }

    public function update(Request $request, Admin $id)
    {
        $this->validate($request, [
            'nama_admin' => 'required',
            'jenis_kelamin' => 'required',
            'alamat' => 'required',
            'tanggal_lahir' => 'required',
        ]);

        $id_user = $id->user_id;
        User::where('id', $id_user)
        ->update(['name' => $request->nama_admin]);

        $admin = $id;
        $admin->update($request->all());
        if($request->hasFile('foto')){
            $request->file('foto')->move('asset/images/',$request->file('foto')->getClientOriginalName());
            $admin->foto = $request->file('foto')->getClientOriginalName();
            $admin->save();
        }
        return back()->with('sukses', 'Data berhasil diubah');

    }
}

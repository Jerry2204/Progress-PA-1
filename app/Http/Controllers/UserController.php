<?php

namespace App\Http\Controllers;

use App\User;
use App\Warga;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $warga = Warga::find($id);
        if(!$warga->biodata_warga){
            return redirect ('/isiBiodata')->with('gagal', 'Isi Biodata Terlebih Dahulu');
        }
        return view('warga.profile', ['warga' => $warga]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function editAkun(User $id)
    {
        return view('admin.editAkun', ['user' => $id]);
    }

    public function editAkun_process(Request $request, User $id)
    {
        $password = $id->password;
        $id_user = $id->id;

        $user = User::find($id_user);
        $user->update(['username' => $request->username]);
        if($request->password == ""){
            $user->password = $password;
        }
        else{
            $user->update(['password' => bcrypt($request->password)]);
        }
        $user->save();
        return back()->with('sukses', 'Data Berhasil diubah');
    }
}

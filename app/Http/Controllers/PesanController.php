<?php

namespace App\Http\Controllers;

use App\Balasan;
use App\Pesan;
use Illuminate\Http\Request;

class PesanController extends Controller
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

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
        $pesan = Pesan::find($id);
        $pesan->delete($pesan);
        return back()->with('sukses', 'Pesan berhasil dihapus');
    }

    public function balas(Pesan $id)
    {
        return view('admin.balasPesan', ['pesan' => $id]);
    }

    public function balasPesan(Request $request, $id)
    {
        $balasan = new Balasan;
        $balasan->isi_balasan = $request->balasan;
        $balasan->pesan_id = $id;
        $balasan->save();
        return back()->with('sukses', 'Balasan berhasil dikirimkan');
    }

    public function lihatBalasan(Pesan $id)
    {
        return view('warga.lihatBalasan', ['pesan' => $id]);
    }
}

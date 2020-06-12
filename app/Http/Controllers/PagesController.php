<?php

namespace App\Http\Controllers;

use App\Balasan;
use App\Informasi;
use App\Pengunjung;
use App\Pesan;
use App\User;
use App\Warga;
use App\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use function Ramsey\Uuid\v1;

class PagesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('public.home');
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

    }

    public function admin()
    {
        $jlh_warga = Warga::count();
        $jlh_admin = Admin::count();
        $jlh_wisata = Informasi::where('kategori', 'wisata')->count();
        $jlh_berita = Informasi::where('kategori', 'berita')->count();
        $jlh_penginapan = Informasi::where('kategori', 'penginapan')->count();
        return view('admin.home', compact('jlh_warga', 'jlh_wisata', 'jlh_admin', 'jlh_penginapan', 'jlh_berita'));
    }

    public function about()
    {
        return view('public.about');
    }

    public function daftarWarga(){
        return view('admin.daftarWarga');
    }

    public function informasi()
    {
        $info = Informasi::all();
        return view('admin.informasi', ['info' => $info]);
    }

    public function listKomentar()
    {
        $komentar = Pengunjung::orderBy('id', 'desc')
                    ->limit(10)
                    ->get();
        // $komentar = DB::table('pengunjung')
        //             ->orderBy('id', 'desc')
        //             ->limit(10)
        //             ->get();
        return view('admin.listKomentar', ['komentar' => $komentar]);
    }

    public function pesanWarga($id)
    {
        $warga = Warga::find($id);
        $pesan = $warga->pesan;
        return view('warga.pesanWarga', ['pesan' => $pesan,]);
    }

    public function daftarPesanWarga()
    {
        $pesan = Pesan::all();
        return view('admin.daftarPesanWarga', ['pesan' => $pesan]);
    }

    public function kirimPesan(Request $request, $id)
    {
        $pesan = new Pesan;
        $pesan->isi_pesan = $request->pesan;
        $pesan->warga_id = $id;
        $pesan->save();
        return back()->with('sukses', 'Pesan Berhasil dikirimkan');
    }

    public function registrasi()
    {
        return view('public.registrasi');
    }
}


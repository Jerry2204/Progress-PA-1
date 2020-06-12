<?php

namespace App\Http\Controllers;

use App\BalasKomentar;
use App\Informasi;
use App\Pengunjung;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class InformasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->has("cari")){
            $informasi = Informasi::where('judul_info', 'LIKE', '%' . $request->cari .  '%')->get();
        }else{
        $wisata = Informasi::where('kategori', 'wisata')->get();
        }
        $komentar = Pengunjung::orderBy('id', 'desc')
                    ->limit(10)
                    ->get();

        $berita = Informasi::where('kategori', 'berita')->get();
        // $komentar = DB::table('pengunjung')
        //             ->orderBy('id', 'desc')
        //             ->limit(10)
        //             ->get();
        $pengunjung = Pengunjung::all();
        return view('public.home', ['wisata' => $wisata, 'komentar' => $komentar, 'pengunjung' => $pengunjung, 'berita' => $berita]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            'judul_info' => 'required',
            'kategori' => 'required',
            'isi_info' => 'required',
            'gambar_info' => 'required'
        ]);

        $informasi = new Informasi;
        $informasi->judul_info = $request->judul_info;
        $informasi->kategori = $request->kategori;
        $informasi->isi_info = $request->isi_info;
        if($request->hasFile('gambar_info')){
            $request->file('gambar_info')->move('asset/images/',$request->file('gambar_info')->getClientOriginalName());
            $informasi->gambar_info = $request->file('gambar_info')->getClientOriginalName();
            $informasi->save();
        }

        return back()->with('sukses', 'Informasi Berhasil Ditambahkan');

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
    public function penginapan_show()
    {
        $penginapan = Informasi::where('kategori', 'penginapan')->get();

        return view('public.penginapan', ['penginapan' => $penginapan]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $informasi = Informasi::find($id);
        return view('admin.editInformasi', ['informasi' => $informasi]);
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
        $this->validate($request, [
            'judul_info' => 'required',
            'isi_info' => 'required',
            'kategori' => 'required',
        ]);

        $informasi = Informasi::find($id);
        $informasi->update($request->all());
        if($request->hasFile('gambar_info')){
            $request->file('gambar_info')->move('asset/images/',$request->file('gambar_info')->getClientOriginalName());
            $informasi->gambar_info = $request->file('gambar_info')->getClientOriginalName();
            $informasi->save();
        }
        return redirect('/informasi')->with('sukses', 'Data berhasil diubah');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $informasi = Informasi::find($id);
        $informasi->delete($informasi);
        return back()->with('sukses', 'Data Berhasil dihapus');
    }

    public function gallery_show()
    {
        $informasi = Informasi::all();
        return view('public.gallery', ['informasi' => $informasi]);
    }

    public function single_berita(Informasi $id)
    {
        return view('public.single_berita', ['berita' => $id]);
    }
}

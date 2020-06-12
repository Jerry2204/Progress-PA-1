<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Informasi extends Model
{
    protected $table = 'informasi';
    protected $fillable = ['judul_info', 'isi_info', 'gambar_info', 'kategori'];
    protected $primaryKey = 'id_informasi';
}

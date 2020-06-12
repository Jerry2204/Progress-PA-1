<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalasKomentar extends Model
{
    protected $table = 'balasan_komentar';
    protected $fillable = ['isi_balasan', 'pengunjung_id'];

        public function pengunjung()
        {
            return $this->belongsTo(Pengunjung::class);
        }
}

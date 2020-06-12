<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pesan extends Model
{
    protected $table = 'pesan';
    protected $fillable = ['isi_pesan', 'warga_id'];

    public function warga()
    {
        return $this->belongsTo(Warga::class);
    }

    public function balasan()
    {
        return $this->hasMany(Balasan::class);
    }
}


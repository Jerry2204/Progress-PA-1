<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Balasan extends Model
{
    protected $table = 'balasan';
    protected $fillable = ['isi_balasan', 'pesan_id'];

    public function pesan()
    {
        return $this->belongsTo(Pesan::class);
    }
}

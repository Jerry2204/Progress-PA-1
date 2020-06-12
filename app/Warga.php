<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Warga extends Model
{
    protected $table = 'warga';
    protected $fillable = ['nama_warga', 'NIK', 'alamat', 'user_id'];

    public function pesan()
    {
        return $this->hasMany(Pesan::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function biodata_warga()
    {
        return $this->hasOne(Biodata_warga::class);
    }
}

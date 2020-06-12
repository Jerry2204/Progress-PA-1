<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    protected $table = 'admin';
    protected $fillable = ['nama_admin', 'jenis_kelamin', 'alamat', 'tanggal_lahir', 'foto', 'user_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}

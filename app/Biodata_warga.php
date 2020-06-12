<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Biodata_warga extends Model
{
    protected $table = 'biodata_warga';
    protected $fillable = ['agama', 'jenis_kelamin', 'umur', 'foto', 'warga_id'];

    public function warga()
    {
        return $this->belongsTo(Warga::class);
    }

}

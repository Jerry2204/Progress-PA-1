<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        return view('login');
    }

    public function loginProcess(Request $request)
    {
        if(Auth::attempt($request->only('username', 'password'))){
            return  redirect('/dashboard');
        }
        return redirect('/login')->with('gagal', 'Username/Password Salah');
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/login');
    }
}

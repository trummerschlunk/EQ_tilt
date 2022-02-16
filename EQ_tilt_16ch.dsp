/* simple tilt EQ based on lowshelf and highshelf*/
/*  */
/*
 *  Copyright (C) 2021 Klaus Scheuermann, klaus@4ohm.de
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; version 2 of the License.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 */


declare name      "EQ_tilt";
declare author    "Klaus Scheuermann";
declare version   "0.1";
declare copyright "(C) 2022 Klaus Scheuermann";



import("stdfaust.lib");

Nch = 16;

N=1;
gain = hslider("[1]gain [unit:db]",0,-6,6,0.5);
freq = hslider("[2]freq [unit:Hz] [scale:log]", 630, 200, 2000,1);

noise = par(i, Nch, no.no.noise *0.5);

process = par(i,Nch,_) : par(i, Nch, fi.lowshelf(N, -gain, freq) : fi.highshelf(N, gain, freq));





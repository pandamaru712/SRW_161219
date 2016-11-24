FILE_OUTPUT = @ARG1

set terminal aqua

reset

set dashtype 1 (1,4)
set dashtype 2 (5,5)

set size 1,0.8
set ytics nomirror
set xlabel "Average transmission standby time of each STA (ms)" font "Helvetica, 27"
set ylabel "CDF" font "Helvetica, 30"
set xrange [0:50]
set yrange [0:1]

set key at 50, 0.4
set key font "Helvetica, 20"

set tics font "Helvetica,25"
plot "cdf_half.dat" using ($1/1000):2 title "Half-duplex" w l lt 1 lw 4
replot "cdf_ufd.dat" using ($1/1000):2 title "Conventional scheme" w l dt 1 lw 4
replot "cdf_uo.dat" using ($1/1000):2 title "Proposed scheme\n /w calculation time reduction" w l dt 2 lw 4
replot


if(FILE_OUTPUT){
set terminal postscript enhanced monochrome
set output ARG2.".eps"
replot
}

set terminal aqua
FILE_OUTPUT = @ARG1

set terminal aqua

reset

set dashtype 1 (1,4)
set dashtype 2 (5,5)

set size 1,0.8
set ytics nomirror
set xlabel "{/Symbol-Oblique a}" font "Helvetica, 30"
set ylabel "Average system throughput (Mbit/s)" font "Helvetica, 22"
set xrange [0:1]
set yrange [0:40]

set key at 1, 40
set key font "Helvetica, 20"

set tics font "Helvetica,25"
plot "thr_time.dat" using 1:2 title "w/ time shortening scheme" w lp lt 1 lw 4 pt 2 ps 2
replot "thr_time.dat" using 1:3 title "w/o time shortening scheme" w lp dt 1 lw 4 pt 6 ps 2
replot


if(FILE_OUTPUT){
set terminal postscript enhanced monochrome
set output ARG2.".eps"
replot
}

set terminal aqua
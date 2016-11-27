FILE_OUTPUT = @ARG1

set terminal aqua

reset

set dashtype 1 (1,4)
set dashtype 2 (5,5)

set size 1,0.8
set ytics nomirror
set xlabel "{/Symbol-Oblique a}" font "Helvetica, 30"
set ylabel "Average transmission delay (ms)" font "Helvetica, 22"
set xrange [0:1]
set yrange [0:30]

set key at 1, 20
set key font "Helvetica, 20"

set tics font "Helvetica,25"
plot "delay.dat" using 1:2 title "Half-duplex" w lp lt 1 lw 4 pt 2 ps 2
replot "delay.dat" using 1:3 title "Conventional scheme" w lp dt 1 lw 4 pt 6 ps 2
replot "delay.dat" using 1:4 title "Proposed scheme" w lp dt 2 lw 4 pt 8 ps 2
replot


if(FILE_OUTPUT){
set terminal postscript enhanced monochrome
set output ARG2.".eps"
replot
}

set terminal aqua
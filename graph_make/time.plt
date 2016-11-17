FILE_OUTPUT = @ARG1

set terminal aqua

reset

set size 0.8,0.8
set style fill solid border lc rgb "black"
set boxwidth 0.5 relative
set ytics nomirror
#set xlabel "" font "Helvetica, 30"
set ylabel "Average solving time (ms)" font "Helvetica, 22"
#set xrange [0:1]
set yrange [0:1000]

#set key at 1, 20
#set key font "Helvetica, 20"

set tics font "Helvetica,25"
plot "time.dat" using 1:2 with boxes notitle lc rgb "light-cyan"
replot


if(FILE_OUTPUT){
set terminal postscript enhanced monochrome
set output ARG2.".eps"
replot
}

set terminal aqua
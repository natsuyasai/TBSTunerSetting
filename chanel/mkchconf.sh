#!/bin/sh
for ch in `seq 1 3`; do
	fr=`expr \( $ch - 1 \) \* 6 + 93`
	echo "[${ch}]"
	echo "\\tFREQUENCY = ${fr}000000"
	echo "\\tSYMBOL_RATE = 5274000"
	echo "\\tDELIVERY_SYSTEM = DVBC/ANNEX_A"
	echo ""
done
for ch in `seq 4 12`; do
	if [ $ch -lt 8 ]; then
		fr=`expr \( $ch - 4 \) \* 6 + 173`
	else
		fr=`expr \( $ch - 8 \) \* 6 + 195`
	fi
	echo "[${ch}]"
	echo "\\tFREQUENCY = ${fr}000000"
	echo "\\tSYMBOL_RATE = 5274000"
	echo "\\tDELIVERY_SYSTEM = DVBC/ANNEX_A"
	echo ""
done
for ch in `seq 13 62`; do
	fr=`expr \( $ch - 13 \) \* 6 + 473`
	echo "[${ch}]"
	echo "\\tFREQUENCY = ${fr}000000"
	echo "\\tSYMBOL_RATE = 5274000"
	echo "\\tDELIVERY_SYSTEM = DVBC/ANNEX_A"
	echo ""
done
for ch in `seq 13 22`; do
	if [ $ch -lt 22 ]; then
		fr=`expr \( $ch - 13 \) \* 6 + 111`
	else
		fr=`expr \( $ch - 22 \) \* 6 + 167`
	fi
	echo "[C${ch}]"
	echo "\\tFREQUENCY = ${fr}000000"
	echo "\\tSYMBOL_RATE = 5274000"
	echo "\\tDELIVERY_SYSTEM = DVBC/ANNEX_A"
	echo ""
done
for ch in `seq 23 63`; do
	if [ -n "$1" -a $ch -gt 23 -a $ch -lt 28 ]; then
		fr=`expr \( $ch - 24 \) \* 6 + 233`
	else
		fr=`expr \( $ch - 23 \) \* 6 + 225`
	fi
	echo "[C${ch}]"
	echo "\\tFREQUENCY = ${fr}000000"
	echo "\\tSYMBOL_RATE = 5274000"
	echo "\\tDELIVERY_SYSTEM = DVBC/ANNEX_A"
	echo ""
done

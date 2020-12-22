@echo off
echo Assembling OderOS...
"nasm-2.15.05/nasm.exe" -f bin "src/import.asm" -o "os.bin"
echo Done!
pause >nul
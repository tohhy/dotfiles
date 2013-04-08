" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" viminfo location
set viminfo+=n~/.vim/.viminfo

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" スワップファイルの作成は行わない
set noswapfile
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
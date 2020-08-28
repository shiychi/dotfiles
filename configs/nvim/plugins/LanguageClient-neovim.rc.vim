set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'c': ['clangd'],
  \ 'cpp': ['clangd'],
  \ 'rust': ['rust-analyzer'],
  \ 'python': ['pyls'],
  \ 'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
  \       using LanguageServer;
  \       using Pkg;
  \       import StaticLint;
  \       import SymbolServer;
  \       env_path = dirname(Pkg.Types.Context().env.project_file);
  \       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path);
  \       server.runlinter = true;
  \       run(server);
  \ '],
\ }

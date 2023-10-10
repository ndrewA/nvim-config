local clang_format_path = vim.fn.stdpath('config') .. "/config/clang-format"

vim.g.neoformat_enabled_cpp = { 'clangformat' }

vim.g.neoformat_cpp_clangformat = {
    exe = 'clang-format',
    args = {'-style=file:' .. clang_format_path},
    stdin = true,
}

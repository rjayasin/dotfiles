-- Cmd+K clears the screen and scrollback, then sends Ctrl+L so the shell
-- redraws its whole prompt at the top (the built-in clear keeps only the
-- prompt's last line)
rex.action{
  name  = "clear_all",
  title = "Clear Screen and Scrollback",
  run   = function(ctx, args)
    local terminal = "com.superlogical.terminal"
    rex.block.call(terminal, "clear", { block_id = ctx.block_id })
    rex.block.call(terminal, "write", { block_id = ctx.block_id, data = "\012" })
  end,
}
rex.bind("cmd+k", "clear_all")
-- Cmd+P opens the session picker (the default on Cmd+K)
rex.bind("cmd+p", "session.switch")

-- Cmd+K clears the terminal
rex.bind("cmd+k", "pane.send_key", { key = "ctrl+l" })
-- Cmd+P opens the session picker (the default on Cmd+K)
rex.bind("cmd+p", "session.switch")

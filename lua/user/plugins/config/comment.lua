local Comment = { "numToStr/Comment.nvim" }

Comment.keys = { "gc", "gcc", "gbc" }

function Comment.config()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  comment.setup()
end

return Comment

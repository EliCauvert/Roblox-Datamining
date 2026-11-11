local ExpChatVisibleARButtonPadding = game:DefineFastInt("ExpChatVisibleARButtonPadding", 42)
local ExpChatVisibleARButtonPaddingInset = game:DefineFastInt("ExpChatVisibleARButtonPaddingInset", 34)

return if require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatScrollbarInset) then ExpChatVisibleARButtonPaddingInset else ExpChatVisibleARButtonPadding
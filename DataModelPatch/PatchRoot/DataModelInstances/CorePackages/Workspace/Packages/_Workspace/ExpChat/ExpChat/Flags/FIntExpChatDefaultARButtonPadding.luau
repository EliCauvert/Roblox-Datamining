local ExpChatDefaultARButtonPadding = game:DefineFastInt("ExpChatDefaultARButtonPadding", 9)
local ExpChatDefaultARButtonPaddingInset = game:DefineFastInt("ExpChatDefaultARButtonPaddingInset", 1)

return if require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatScrollbarInset) then ExpChatDefaultARButtonPaddingInset else ExpChatDefaultARButtonPadding
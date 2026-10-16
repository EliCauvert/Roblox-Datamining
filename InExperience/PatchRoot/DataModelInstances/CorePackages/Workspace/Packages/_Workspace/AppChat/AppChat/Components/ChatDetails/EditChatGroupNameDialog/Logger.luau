local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":EditChatGroupNameDialogScreen")
NewResult:setContext({ screen = "EditChatGroupNameDialogScreen" })

return NewResult
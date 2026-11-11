local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":ChatConversationPartialModal")
NewResult:setContext({ screen = "ChatConversationPartialModal" })

return NewResult
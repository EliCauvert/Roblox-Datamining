local var1 = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":ChatConversationPartialModal")
var1:setContext({ screen = "ChatConversationPartialModal" })

return var1
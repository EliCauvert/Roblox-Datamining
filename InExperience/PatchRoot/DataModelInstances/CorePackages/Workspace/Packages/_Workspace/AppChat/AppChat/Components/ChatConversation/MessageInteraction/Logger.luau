local var1 = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":MessageInteraction")
var1:setContext({ screen = "MessageContextMenuScreen" })

return var1
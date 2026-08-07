local var0 = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":MessageInteraction")
var0:setContext({ screen = "MessageContextMenuScreen" })

return var0
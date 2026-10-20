local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":MessageInteraction")
NewResult:setContext({ screen = "MessageContextMenuScreen" })

return NewResult
local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":RemoveUserDialogScreen")
NewResult:setContext({ screen = "RemoveUserDialogScreen" })

return NewResult
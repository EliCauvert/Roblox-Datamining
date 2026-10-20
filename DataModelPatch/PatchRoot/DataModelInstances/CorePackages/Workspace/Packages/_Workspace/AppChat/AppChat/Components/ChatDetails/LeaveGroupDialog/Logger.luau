local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":LeaveGroupDialogScreen")
NewResult:setContext({ screen = "LeaveGroupDialogScreen" })

return NewResult
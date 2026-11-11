local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script:GetFullName() .. ":ParticipantDialogScreen")
NewResult:setContext({ screen = "ParticipantDialogScreen" })

return NewResult
local runService = game:GetService("RunService")

return function() --[[ line: 4 | named "isStudio" ]]
	-- upvalues: runService (ref)
	return runService:IsStudio()
end
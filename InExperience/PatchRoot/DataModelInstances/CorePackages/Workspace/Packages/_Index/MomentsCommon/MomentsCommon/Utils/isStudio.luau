local RunService = game:GetService("RunService")

return function() --[[ Line: 4 | Named "isStudio" ]]
	-- upvalues: RunService (copy)
	return RunService:IsStudio()
end
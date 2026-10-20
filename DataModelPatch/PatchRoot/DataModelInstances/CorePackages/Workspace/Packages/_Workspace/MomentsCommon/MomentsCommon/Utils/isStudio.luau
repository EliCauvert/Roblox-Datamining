local RunService = game:GetService("RunService")

return function()
	-- upvalues: RunService (copy)
	return RunService:IsStudio()
end
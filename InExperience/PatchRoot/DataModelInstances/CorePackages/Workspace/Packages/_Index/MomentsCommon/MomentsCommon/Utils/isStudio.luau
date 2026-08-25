local runService = game:GetService("RunService")

return function()
	-- upvalues: runService (ref)
	return runService:IsStudio()
end
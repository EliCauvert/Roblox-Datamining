local RunService = game:GetService("RunService")

return {
	once = function(Callback)
		-- upvalues: RunService (copy)
		return RunService.PreRender:Once(Callback)
	end
}
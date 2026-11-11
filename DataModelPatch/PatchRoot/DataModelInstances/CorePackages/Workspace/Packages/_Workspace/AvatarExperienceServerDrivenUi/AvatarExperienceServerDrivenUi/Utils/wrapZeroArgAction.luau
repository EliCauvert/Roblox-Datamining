local MutedErrorFunction = require(script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent.Loggers).mutedError

return function(Callback)
	-- upvalues: MutedErrorFunction (copy)
	if typeof(Callback) == "function" then
		return function()
			-- upvalues: Callback (copy)
			Callback(nil, nil, nil)
		end
	end
	if Callback ~= nil then
		MutedErrorFunction(`Expected function, got {typeof(Callback)}`)
	end
	return nil
end
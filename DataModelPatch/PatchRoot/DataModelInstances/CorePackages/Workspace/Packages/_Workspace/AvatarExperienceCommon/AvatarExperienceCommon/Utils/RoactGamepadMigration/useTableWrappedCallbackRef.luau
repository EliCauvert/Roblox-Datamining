local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p1, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end)
	
	return UseRefResult
end
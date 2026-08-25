local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(value, function()
		-- upvalues: var1 (ref)
		return var1.current
	end)
	
	return var1
end
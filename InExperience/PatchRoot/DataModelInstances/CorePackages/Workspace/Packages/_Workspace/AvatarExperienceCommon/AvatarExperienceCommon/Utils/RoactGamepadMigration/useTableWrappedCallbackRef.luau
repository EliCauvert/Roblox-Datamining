local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)

return function(value) --[[ line: 11 | named "useTableWrappedCallbackRef" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(value, function() --[[ line: 19 ]]
		-- upvalues: var1 (ref)
		return var1.current
	end)
	
	return var1
end
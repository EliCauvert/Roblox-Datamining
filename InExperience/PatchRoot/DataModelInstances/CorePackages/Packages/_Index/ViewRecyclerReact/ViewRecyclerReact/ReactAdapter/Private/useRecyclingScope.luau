local ReactModule = require(script:FindFirstAncestor("ViewRecyclerReact").Parent.React)
local RecyclingScopeContextModule = require(script.Parent.RecyclingScopeContext)

return function(p1)
	-- upvalues: ReactModule (copy), RecyclingScopeContextModule (copy)
	local UseContextResult = ReactModule.useContext(RecyclingScopeContextModule)
	assert(UseContextResult ~= nil, `{p1} requires a RecyclingScope`)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: UseContextResult (copy)
		return UseContextResult.getScope()
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy)
		return UseContextResult.registerConsumer()
	end, { UseContextResult })
	
	return UseStateResult
end
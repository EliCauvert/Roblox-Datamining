local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)

return function()
	-- upvalues: reactModule (ref), viewRecyclerModule (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: viewRecyclerModule (copy)
		return viewRecyclerModule.Layout.measured({ estimatedItemLength = 48 })
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.destroy()
		end
	end, { var1 })
	
	return var1
end
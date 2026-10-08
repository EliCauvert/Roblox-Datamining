local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local layout = require(viewRecyclerReact.Parent.ViewRecycler).Layout
local reactModule = require(viewRecyclerReact.Parent.React)

local function useManagedLayout(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(p1, p2)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.destroy()
		end
	end, { var1 })
	
	return var1
end

return {
	useMeasuredLayout = function(p1)
		-- upvalues: reactModule (ref), layout (ref)
		local var1 = reactModule.useMemo(function()
			-- upvalues: layout (copy), p1 (ref)
			return layout.measured(p1)
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var1 (ref)
			return function()
				-- upvalues: var1 (copy)
				var1.destroy()
			end
		end, { var1 })
		
		return var1
	end,
	useUniformLayout = function(p1)
		-- upvalues: useManagedLayout (ref), layout (ref)
		return useManagedLayout(function()
			-- upvalues: layout (copy), p1 (ref)
			return layout.uniform(p1)
		end, {
			p1.itemLength,
			p1.spacing,
			p1.paddingBefore,
			p1.paddingAfter
		})
	end
}
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local Layout = require(ViewRecyclerReact.Parent.ViewRecycler).Layout
local ReactModule = require(ViewRecyclerReact.Parent.React)

local function useManagedLayout(p1, p2)
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(p1, p2)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end

return {
	useMeasuredLayout = function(p1)
		-- upvalues: ReactModule (copy), Layout (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Layout (upval), p1 (copy)
			return Layout.measured(p1)
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy)
			return function()
				-- upvalues: UseMemoResult (upval)
				UseMemoResult.destroy()
			end
		end, { UseMemoResult })
		
		return UseMemoResult
	end,
	useUniformLayout = function(p1)
		-- upvalues: useManagedLayout (copy), Layout (copy)
		return (useManagedLayout(function()
			-- upvalues: Layout (upval), p1 (copy)
			return Layout.uniform(p1)
		end, {
			p1.itemLength,
			p1.spacing,
			p1.paddingBefore,
			p1.paddingAfter
		}))
	end
}
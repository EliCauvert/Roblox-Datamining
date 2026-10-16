local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local Layout = require(ViewRecyclerReact.Parent.ViewRecycler).Layout
local ReactModule = require(ViewRecyclerReact.Parent.React)

local function useManagedLayout(p1, p2) --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(p1, p2)
	ReactModule.useEffect(function() --[[ Line: 8 ]]
		-- upvalues: UseMemoResult (copy)
		return function() --[[ Line: 9 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end

return {
	useMeasuredLayout = function(p1) --[[ Line: 27 ]]
		-- upvalues: ReactModule (copy), Layout (copy)
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
			-- upvalues: Layout (upval), p1 (copy)
			return Layout.measured(p1)
		end, {})
		ReactModule.useEffect(function() --[[ Line: 31 ]]
			-- upvalues: UseMemoResult (copy)
			return function() --[[ Line: 32 ]]
				-- upvalues: UseMemoResult (upval)
				UseMemoResult.destroy()
			end
		end, { UseMemoResult })
		
		return UseMemoResult
	end,
	useUniformLayout = function(p1) --[[ Line: 16 ]]
		-- upvalues: useManagedLayout (copy), Layout (copy)
		return (useManagedLayout(function() --[[ Line: 17 ]]
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
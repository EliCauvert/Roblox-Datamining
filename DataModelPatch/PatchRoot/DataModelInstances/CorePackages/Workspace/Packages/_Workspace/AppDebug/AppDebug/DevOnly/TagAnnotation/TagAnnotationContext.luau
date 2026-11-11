local ReactModule = require(script:FindFirstAncestor("AppDebug").Parent.React)
local config = {
	displayMode = "hidden",
	showClassName = true,
	showPosition = false,
	filterPattern = nil,
	tooltipOpacity = 0.9,
	highlightOnHover = true
}
local Context = ReactModule.createContext(nil)

return {
	TagAnnotationContext = Context,
	TagAnnotationProvider = function(p1)
		-- upvalues: ReactModule (copy), config (copy), Context (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(config)
		local UseResult = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl)
				-- upvalues: p2 (copy), p3 (copy)
				local Copy = table.clone(Tbl)
				Copy[p2] = p3
				
				return Copy
			end)
		end, {})
		
		return ReactModule.createElement(Context.Provider, {
			value = {
				config = UseStateResult,
				setDisplayMode = ReactModule.useCallback(function(p2)
					-- upvalues: UseResult (copy)
					UseResult("displayMode", p2)
				end, { UseResult }),
				setFilterPattern = ReactModule.useCallback(function(p2)
					-- upvalues: UseResult (copy)
					UseResult("filterPattern", p2)
				end, { UseResult })
			}
		}, p1.children)
	end,
	useTagAnnotationContext = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("useTagAnnotationContext must be used within a TagAnnotationProvider")
		end
		return UseContextResult
	end
}
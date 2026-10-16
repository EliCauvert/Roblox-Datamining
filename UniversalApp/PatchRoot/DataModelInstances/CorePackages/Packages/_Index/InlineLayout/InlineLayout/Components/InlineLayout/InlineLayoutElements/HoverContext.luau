local ReactModule = require(script:FindFirstAncestor("Components").Parent.Parent.React)

local function OnHover() --[[ Line: 39 ]]
	warn("Wrap the component using HoverContext with a HoverContext.Provider element")
end

local Context = ReactModule.createContext({ registerOnHoverCallback = OnHover, onHover = OnHover })

function useHoverContext(p1) --[[ Line: 54 ]]
	-- upvalues: ReactModule (copy), Context (copy)
	local UseContextResult = ReactModule.useContext(Context)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: UseContextResult (copy), p1 (copy), UseStateResult2 (copy)
		UseContextResult.registerOnHoverCallback(p1, UseStateResult2)
	end, {})
	
	return UseStateResult, (ReactModule.useCallback(function(p2) --[[ Line: 62 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		UseContextResult.onHover(p1, p2)
	end, { p1 }))
end

function Provider(p1) --[[ Line: 69 ]]
	-- upvalues: ReactModule (copy), Context (copy)
	local UseRefResult = ReactModule.useRef({})
	
	return ReactModule.createElement(Context.Provider, {
		value = {
			onHover = ReactModule.useCallback(function(p2, p3) --[[ Line: 71 ]]
				-- upvalues: UseRefResult (copy)
				if not UseRefResult.current[p2] then return end
				for _, value in UseRefResult.current[p2] do
					value(p3)
				end
			end, {}),
			registerOnHoverCallback = ReactModule.useCallback(function(p4, p5) --[[ Line: 80 ]]
				-- upvalues: UseRefResult (copy)
				local CurrentEntry = UseRefResult.current[p4]
				
				if CurrentEntry then
					table.insert(CurrentEntry, p5)
					
					return
				else
					UseRefResult.current[p4] = { p5 }
				end
			end, {})
		}
	}, p1.children)
end

return { useHoverContext = useHoverContext, Provider = Provider }
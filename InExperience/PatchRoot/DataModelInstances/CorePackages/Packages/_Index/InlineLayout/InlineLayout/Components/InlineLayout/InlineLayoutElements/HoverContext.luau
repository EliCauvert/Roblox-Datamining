local reactModule = require(script:FindFirstAncestor("Components").Parent.Parent.React)

local var1 = function()
	warn("Wrap the component using HoverContext with a HoverContext.Provider element")
end

local var2 = reactModule.createContext({ registerOnHoverCallback = var1, onHover = var1 })

function useHoverContext(p1)
	-- upvalues: reactModule (ref), var2 (ref)
	local var3 = reactModule.useContext(var2)
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), var5 (ref)
		var3.registerOnHoverCallback(p1, var5)
	end, {})
	
	return var4, reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), p1 (ref)
		var3.onHover(p1, p2)
	end, { p1 })
end

function Provider(p1)
	-- upvalues: reactModule (ref), var2 (ref)
	local var3 = reactModule.useRef({})
	
	return reactModule.createElement(var2.Provider, {
		value = {
			onHover = reactModule.useCallback(function(p2, p3)
				-- upvalues: var3 (ref)
				if not var3.current[p2] then return end
				for i, v in var3.current[p2] do
					v(p3)
				end
			end, {}),
			registerOnHoverCallback = reactModule.useCallback(function(p4, p5)
				-- upvalues: var3 (ref)
				local var4 = var3.current[p4]
				
				if var4 then
					table.insert(var4, p5)
					
					return
				end
				var3.current[p4] = { p5 }
			end, {})
		}
	}, p1.children)
end

return { useHoverContext = useHoverContext, Provider = Provider }
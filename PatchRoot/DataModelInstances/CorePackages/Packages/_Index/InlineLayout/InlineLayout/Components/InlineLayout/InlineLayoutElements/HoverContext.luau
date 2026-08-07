-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Components").Parent.Parent.React)

local var1 = function() --[[ line: 39 ]]
	warn("Wrap the component using HoverContext with a HoverContext.Provider element")
end

local var2 = reactModule.createContext({ registerOnHoverCallback = var1, onHover = var1 })

function useHoverContext(p0) --[[ line: 54 ]]
	-- upvalues: reactModule (ref), var2 (ref)
	local var3 = reactModule.useContext(var2)
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: var3 (ref), p0 (ref), var5 (ref)
		var3.registerOnHoverCallback(p0, var5)
	end, {})
	
	return var4, reactModule.useCallback(function(p1) --[[ line: 62 ]]
		-- upvalues: var3 (ref), p0 (ref)
		var3.onHover(p0, p1)
	end, { p0 })
end

function Provider(p2) --[[ line: 69 ]]
	-- upvalues: reactModule (ref), var2 (ref)
	local var6 = reactModule.useRef({})
	
	return reactModule.createElement(var2.Provider, {
		value = {
			onHover = reactModule.useCallback(function(p3, p4) --[[ line: 71 ]]
				-- upvalues: var6 (ref)
				if not var6.current[p3] then return end
				for i, v in var6.current[p3] do
					v(p4)
				end
			end, {}),
			registerOnHoverCallback = reactModule.useCallback(function(p5, p6) --[[ line: 80 ]]
				-- upvalues: var6 (ref)
				local var7 = var6.current[p5]
				
				if var7 then
					table.insert(var7, p6)
					
					return
				end
				var6.current[p5] = { p6 }
			end, {})
		}
	}, p2.children)
end

return { useHoverContext = useHoverContext, Provider = Provider }
local reactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local responsiveModule = require(script.Parent.Parent.Responsive)
local containerRefModule = require(script.Parent.Parent.Context.ContainerRef)
local luaAppResponsiveFixHookDeps = game:DefineFastFlag("LuaAppResponsiveFixHookDeps", false)

function id(p0) --[[ line: 9 ]]
	return p0
end

function useResponsiveImpl(p1, p2, p3) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), containerRefModule (ref), responsiveModule (ref), luaAppResponsiveFixHookDeps (ref)
	local var4 = if typeof(p1) == "function" then p1 else id
	local var5 = reactModule.useContext(containerRefModule)
	local var6, var7 = reactModule.useState(var4(responsiveModule.DefaultKey))
	local var8 = reactModule.useRef("")
	local var9 = reactModule.useRef({ Key = responsiveModule.DefaultKey })
	local t = nil
	
	if typeof(p1) == "table" then
		t = {}
		
		for i, v in p1 do
			t[v] = true
		end
	end
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var5 (ref), responsiveModule (copy), p2 (ref), p3 (ref), t (write), var8 (ref), var9 (ref), var7 (ref), var4 (ref)
		if var5 and var5.current then
			local var11 = responsiveModule.bindContainer(var5.current, p2)
			local var12 = var11:connect(function() --[[ line: 37 ]]
				-- upvalues: var11 (ref), p3 (copy), t (copy), var8 (copy), var9 (copy), var7 (copy), var4 (copy)
				local var14 = var11:currentKey(p3)
				
				if not t then
					var9.current = var11:currentRule(p3)
					var7(var4(var14))
				elseif t[var14] or var8.current and t[var8.current] then
					var9.current = var11:currentRule(p3)
					var7(var14)
				end
				var8.current = var14
			end)
			var9.current = var11:currentRule(p3)
			local var13 = var11:currentKey(p3)
			var7(var4(var13))
			var8.current = var13
			
			return function() --[[ line: 56 ]]
				-- upvalues: var12 (ref), var11 (ref)
				var12:disconnect()
				var11:destroy()
			end
		end
		return function() --[[ line: 61 ]] end
	end, {
		var5,
		if var5 then var5.current else false,
		if luaAppResponsiveFixHookDeps then p2 else nil,
		if luaAppResponsiveFixHookDeps then p3 else nil
	})
	
	return var6, var9.current
end

return useResponsiveImpl
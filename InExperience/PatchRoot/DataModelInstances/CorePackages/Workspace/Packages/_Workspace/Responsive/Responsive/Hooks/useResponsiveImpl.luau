local reactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local responsiveModule = require(script.Parent.Parent.Responsive)
local containerRefModule = require(script.Parent.Parent.Context.ContainerRef)
local luaAppResponsiveFixHookDeps = game:DefineFastFlag("LuaAppResponsiveFixHookDeps", false)

function id(p1)
	return p1
end

function useResponsiveImpl(p1, p2, p3)
	-- upvalues: reactModule (ref), containerRefModule (ref), responsiveModule (ref), luaAppResponsiveFixHookDeps (ref)
	local var1 = if typeof(p1) == "function" then p1 else id
	local var2 = reactModule.useContext(containerRefModule)
	local var3, var4 = reactModule.useState(var1(responsiveModule.DefaultKey))
	local var5 = reactModule.useRef("")
	local var6 = reactModule.useRef({ Key = responsiveModule.DefaultKey })
	local t = nil
	
	if typeof(p1) == "table" then
		t = {}
		
		for i, v in p1 do
			t[v] = true
		end
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), responsiveModule (copy), p2 (ref), p3 (ref), t (write), var5 (ref), var6 (ref), var4 (ref), var1 (ref)
		if var2 and var2.current then
			local var7 = responsiveModule.bindContainer(var2.current, p2)
			local var8 = var7:connect(function()
				-- upvalues: var7 (ref), p3 (copy), t (copy), var5 (copy), var6 (copy), var4 (copy), var1 (copy)
				local var9 = var7:currentKey(p3)
				
				if not t then
					var6.current = var7:currentRule(p3)
					var4(var1(var9))
				elseif t[var9] or var5.current and t[var5.current] then
					var6.current = var7:currentRule(p3)
					var4(var9)
				end
				var5.current = var9
			end)
			var6.current = var7:currentRule(p3)
			local var9 = var7:currentKey(p3)
			var4(var1(var9))
			var5.current = var9
			
			return function()
				-- upvalues: var8 (ref), var7 (ref)
				var8:disconnect()
				var7:destroy()
			end
		end
		return function() end
	end, {
		var2,
		if var2 then var2.current else false,
		if luaAppResponsiveFixHookDeps then p2 else nil,
		if luaAppResponsiveFixHookDeps then p3 else nil
	})
	
	return var3, var6.current
end

return useResponsiveImpl
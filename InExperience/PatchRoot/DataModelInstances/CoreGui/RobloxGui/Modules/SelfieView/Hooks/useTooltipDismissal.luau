local userInputService = game:GetService("UserInputService")
local packages = game:GetService("CorePackages").Packages
local reactModule = require(packages.React)
local luauPolyfillModule = require(packages.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout

local function _(p1)
	return if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true
end

return function(p1)
	-- upvalues: reactModule (ref), clearTimeout (ref), setTimeout (ref), userInputService (ref)
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useState("")
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), clearTimeout (copy), var7 (ref)
		if var8.current then
			clearTimeout(var8.current)
		end
		if var7.current then
			var7.current:Disconnect()
			var7.current = nil
		end
	end, { var8, var7 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var6 (ref), var8 (ref), setTimeout (copy), p1 (ref), var7 (ref), userInputService (copy)
		var9()
		var6(true)
		var8.current = setTimeout(function()
			-- upvalues: var9 (copy), var6 (copy)
			var9()
			var6(false)
		end, p1)
		var7.current = userInputService.InputBegan:Connect(function(p2, _)
			-- upvalues: var9 (copy), var6 (copy)
			if if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true then
				var9()
				var6(false)
				
				return
			end
		end)
	end, { var8, var7 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref)
		return var9
	end, {})
	
	return var1, var3, var5, reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), var4 (ref), var10 (ref)
		var2(p2)
		var4(p3)
		var10()
	end, {})
end
local userInputService = game:GetService("UserInputService")
local packages = game:GetService("CorePackages").Packages
local reactModule = require(packages.React)
local luauPolyfillModule = require(packages.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout

local function _(p0) --[[ line: 12 | named "isClickOrTap" ]]
	return if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then p0.UserInputType == Enum.UserInputType.Touch else true
end

return function(p1) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), clearTimeout (ref), setTimeout (ref), userInputService (ref)
	local var3, var4 = reactModule.useState("")
	local var5, var6 = reactModule.useState("")
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useCallback(function() --[[ line: 23 ]]
		-- upvalues: var10 (ref), clearTimeout (copy), var9 (ref)
		if var10.current then
			clearTimeout(var10.current)
		end
		if var9.current then
			var9.current:Disconnect()
			var9.current = nil
		end
	end, { var10, var9 })
	local var12 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: var11 (ref), var8 (ref), var10 (ref), setTimeout (copy), p1 (ref), var9 (ref), userInputService (copy)
		var11()
		var8(true)
		var10.current = setTimeout(function() --[[ line: 39 ]]
			-- upvalues: var11 (copy), var8 (copy)
			var11()
			var8(false)
		end, p1)
		var9.current = userInputService.InputBegan:Connect(function(p2, _) --[[ line: 44 ]]
			-- upvalues: var11 (copy), var8 (copy)
			if if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true then
				var11()
				var8(false)
				
				return
			end
		end)
	end, { var10, var9 })
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var11 (ref)
		return var11
	end, {})
	
	return var3, var5, var7, reactModule.useCallback(function(p3, p4) --[[ line: 58 ]]
		-- upvalues: var4 (ref), var6 (ref), var12 (ref)
		var4(p3)
		var6(p4)
		var12()
	end, {})
end
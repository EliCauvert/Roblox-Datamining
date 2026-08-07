-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React)
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local camera = Instance.new("Camera")

return function() --[[ line: 11 | named "useCurrentCamera" ]]
	-- upvalues: useState (ref), useCallback (ref), useEffect (ref), camera (ref)
	local var2, var3 = useState(nil)
	local var4 = useCallback(function() --[[ line: 14 ]]
		-- upvalues: var2 (ref), var3 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera and currentCamera ~= var2 then
			var3(currentCamera)
		end
	end, { var2 })
	useEffect(function() --[[ line: 21 ]]
		-- upvalues: var4 (ref)
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(var4)
		
		return function() --[[ line: 24 ]]
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, { var4 })
	useEffect(var4, {})
	
	return var2 or camera
end
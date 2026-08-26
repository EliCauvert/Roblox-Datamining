local reactModule = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React)
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local camera = Instance.new("Camera")

return function()
	-- upvalues: useState (ref), useCallback (ref), useEffect (ref), camera (ref)
	local var1, var2 = useState(nil)
	local var3 = useCallback(function()
		-- upvalues: var1 (ref), var2 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera and currentCamera ~= var1 then
			var2(currentCamera)
		end
	end, { var1 })
	useEffect(function()
		-- upvalues: var3 (ref)
		local var4 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(var3)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, { var3 })
	useEffect(var3, {})
	
	return var1 or camera
end
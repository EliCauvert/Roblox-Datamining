local reactModule = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React)
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local camera = Instance.new("Camera")

return function()
	-- upvalues: useState (ref), useCallback (ref), useEffect (ref), camera (ref)
	local var2, var3 = useState(nil)
	local var4 = useCallback(function()
		-- upvalues: var2 (ref), var3 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera and currentCamera ~= var2 then
			var3(currentCamera)
		end
	end, { var2 })
	useEffect(function()
		-- upvalues: var4 (ref)
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(var4)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, { var4 })
	useEffect(var4, {})
	
	return var2 or camera
end
local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local userInputService = game:GetService("UserInputService")
local reactUtilsModule = require(reactSceneUnderstanding.Parent.ReactUtils)
local reactModule = require(reactSceneUnderstanding.Parent.React)
local enumsModule = require(reactSceneUnderstanding.enums)
local useCurrentCameraModule = require(reactSceneUnderstanding.useCurrentCamera)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState
local useEventConnection = reactUtilsModule.useEventConnection

return function(p1)
	-- upvalues: useCurrentCameraModule (ref), useState (ref), enumsModule (ref), useRef (ref), useCallback (ref), useEventConnection (ref), userInputService (ref), useEffect (ref)
	local var1 = useCurrentCameraModule()
	local var2, var3 = useState(enumsModule.CameraState.Idle)
	local var4 = useRef(nil)
	p1 = p1 or var1
	local var5 = useCallback(function()
		-- upvalues: var3 (ref), enumsModule (copy), var4 (ref)
		var3(function(p2)
			-- upvalues: enumsModule (copy)
			return if p2 == enumsModule.CameraState.Moving then p2 else enumsModule.CameraState.Moving
		end)
		
		if var4.current then
			task.cancel(var4.current)
		end
		var4.current = task.delay(0.2, function()
			-- upvalues: var3 (copy), enumsModule (copy)
			var3(enumsModule.CameraState.Idle)
		end)
	end, {})
	useEventConnection(userInputService.InputChanged, function(p2)
		-- upvalues: var5 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseWheel then
			var5()
		end
	end, { var5 })
	useEffect(function()
		-- upvalues: p1 (ref), var5 (ref)
		local var6 = p1:GetPropertyChangedSignal("CFrame"):Connect(var5)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { p1, var5 })
	
	return var2
end
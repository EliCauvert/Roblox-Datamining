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

return function(p0)
	-- upvalues: useCurrentCameraModule (ref), useState (ref), enumsModule (ref), useRef (ref), useCallback (ref), useEventConnection (ref), userInputService (ref), useEffect (ref)
	local var6 = useCurrentCameraModule()
	local var7, var8 = useState(enumsModule.CameraState.Idle)
	local var9 = useRef(nil)
	p0 = p0 or var6
	local var11 = useCallback(function()
		-- upvalues: var8 (ref), enumsModule (copy), var9 (ref)
		var8(function(p1)
			-- upvalues: enumsModule (copy)
			return if p1 == enumsModule.CameraState.Moving then p1 else enumsModule.CameraState.Moving
		end)
		
		if var9.current then
			task.cancel(var9.current)
		end
		var9.current = task.delay(0.2, function()
			-- upvalues: var8 (copy), enumsModule (copy)
			var8(enumsModule.CameraState.Idle)
		end)
	end, {})
	useEventConnection(userInputService.InputChanged, function(p2)
		-- upvalues: var11 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseWheel then
			var11()
		end
	end, { var11 })
	useEffect(function()
		-- upvalues: p0 (ref), var11 (ref)
		local var12 = p0:GetPropertyChangedSignal("CFrame"):Connect(var11)
		
		return function()
			-- upvalues: var12 (ref)
			var12:Disconnect()
		end
	end, { p0, var11 })
	
	return var7
end
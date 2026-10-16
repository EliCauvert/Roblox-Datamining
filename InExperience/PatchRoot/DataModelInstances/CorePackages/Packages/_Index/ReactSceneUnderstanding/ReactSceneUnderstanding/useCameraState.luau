local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(ReactSceneUnderstanding.Parent.React)
local EnumsModule = require(ReactSceneUnderstanding.enums)
local UseCurrentCameraModule = require(ReactSceneUnderstanding.useCurrentCamera)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseEventConnectionFunction = require(ReactSceneUnderstanding.Parent.ReactUtils).useEventConnection

return function(p1) --[[ Line: 20 | Named "useCameraState" ]]
	-- upvalues: UseCurrentCameraModule (copy), UseStateFunction (copy), EnumsModule (copy), UseRefFunction (copy), UseCallbackFunction (copy), UseEventConnectionFunction (copy), UserInputService (copy), UseEffectFunction (copy)
	local UseCurrentCameraModuleResult = UseCurrentCameraModule()
	local UseStateResult, UseStateResult2 = UseStateFunction(EnumsModule.CameraState.Idle)
	local UseRefResult = UseRefFunction(nil)
	local P0 = p1 or UseCurrentCameraModuleResult
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 27 ]]
		-- upvalues: UseStateResult2 (copy), EnumsModule (upval), UseRefResult (copy)
		UseStateResult2(function(Moving) --[[ Line: 28 ]]
			-- upvalues: EnumsModule (upval)
			return if Moving == EnumsModule.CameraState.Moving then Moving else EnumsModule.CameraState.Moving
		end)
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(0.2, function() --[[ Line: 36 ]]
			-- upvalues: UseStateResult2 (upval), EnumsModule (upval)
			UseStateResult2(EnumsModule.CameraState.Idle)
		end)
	end, {})
	UseEventConnectionFunction(UserInputService.InputChanged, function(Input) --[[ Line: 41 ]]
		-- upvalues: UseCallbackResult (copy)
		if Input.UserInputType == Enum.UserInputType.MouseWheel then
			UseCallbackResult()
		end
	end, { UseCallbackResult })
	UseEffectFunction(function() --[[ Line: 47 ]]
		-- upvalues: P0 (copy), UseCallbackResult (copy)
		local Connection = P0:GetPropertyChangedSignal("CFrame"):Connect(UseCallbackResult)
		
		return function() --[[ Line: 50 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { P0, UseCallbackResult })
	
	return UseStateResult
end
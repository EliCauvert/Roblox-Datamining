local ReactModule = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React)
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local Camera = Instance.new("Camera")

return function()
	-- upvalues: UseStateFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy), Camera (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera and CurrentCamera ~= UseStateResult then
			UseStateResult2(CurrentCamera)
		end
	end, { UseStateResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(UseCallbackResult)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseCallbackResult })
	UseEffectFunction(UseCallbackResult, {})
	
	return if UseStateResult then UseStateResult else Camera
end
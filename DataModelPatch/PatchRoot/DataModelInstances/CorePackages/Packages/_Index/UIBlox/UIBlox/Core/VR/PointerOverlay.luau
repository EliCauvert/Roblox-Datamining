local ContextActionService = game:GetService("ContextActionService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local RoactModule = require(Parent1.Roact)
local EventConnection = require(Parent1.ReactUtils).EventConnection
local Object = require(Parent1.LuauPolyfill).Object
local _ = require(Parent.Constants)
local config = {
	VRService = game:GetService("VRService"),
	UpdateEvent = game:GetService("RunService").Heartbeat
}

local function setLaserPointerModeBasedOnUserCFrame(UseRefResult, VRService)
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		UseRefResult.current:setMode(UseRefResult.current.Mode.DualPointer)
		
		return
	end
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		UseRefResult.current:setMode(UseRefResult.current.Mode.Pointer)
		
		return
	else
		UseRefResult.current:setMode(UseRefResult.current.Mode.Disabled)
	end
end

return function(p1)
	-- upvalues: Object (copy), config (copy), ReactModule (copy), setLaserPointerModeBasedOnUserCFrame (copy), ContextActionService (copy), RoactModule (copy), EventConnection (copy)
	local AssignResult = Object.assign({}, config, p1)
	local LaserPointer = AssignResult.LaserPointer
	local VRControllerModel = AssignResult.VRControllerModel
	local VRService = AssignResult.VRService
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local Success, Result = pcall(function()
		-- upvalues: VRService (copy)
		return VRService:GetPropertyChangedSignal("VRSessionState")
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), LaserPointer (copy), setLaserPointerModeBasedOnUserCFrame (upval), VRService (copy), UseRefResult1 (copy), VRControllerModel (copy), UseRefResult2 (copy), ContextActionService (upval)
		if not UseRefResult.current then
			UseRefResult.current = LaserPointer.new()
			setLaserPointerModeBasedOnUserCFrame(UseRefResult, VRService)
			UseRefResult.current:setEnableAmbidexterousPointer(true)
			UseRefResult1.current = VRControllerModel.new(Enum.UserCFrame.LeftHand)
			UseRefResult2.current = VRControllerModel.new(Enum.UserCFrame.RightHand)
		end
		UseRefResult1.current:setEnabled(VRService.VREnabled)
		UseRefResult2.current:setEnabled(VRService.VREnabled)
		
		if VRService.VREnabled then
			ContextActionService:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
		end
	end, {
		UseRefResult1,
		UseRefResult2,
		UseRefResult,
		LaserPointer,
		VRControllerModel
	})
	local UseResult1 = nil
	UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy), ContextActionService (upval)
		if UseRefResult1.current then
			UseRefResult1.current:setEnabled(false)
		end
		if UseRefResult2.current then
			UseRefResult2.current:setEnabled(false)
		end
		if UseRefResult.current then
			UseRefResult.current:disableComponent()
		end
		ContextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA)
		ContextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
	end, {
		UseRefResult1,
		UseRefResult2,
		UseRefResult,
		LaserPointer,
		VRControllerModel
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: VRService (copy), UseRefResult (copy), setLaserPointerModeBasedOnUserCFrame (upval), UseRefResult1 (copy), UseRefResult2 (copy)
		local Inverted = not (VRService.VRSessionState == Enum.VRSessionState.Idle or VRService.VRSessionState == Enum.VRSessionState.Visible)
		
		if UseRefResult.current then
			if Inverted then
				setLaserPointerModeBasedOnUserCFrame(UseRefResult, VRService)
			else
				UseRefResult.current:setMode(UseRefResult.current.Mode.Disabled)
			end
		end
		if UseRefResult1.current then
			UseRefResult1.current:setEnabled(Inverted)
		end
		if UseRefResult2.current then
			UseRefResult2.current:setEnabled(Inverted)
		end
	end, {
		UseRefResult1,
		UseRefResult2,
		UseRefResult,
		LaserPointer,
		VRControllerModel
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: setLaserPointerModeBasedOnUserCFrame (upval), UseRefResult (copy), VRService (copy)
		setLaserPointerModeBasedOnUserCFrame(UseRefResult, VRService)
	end, { UseRefResult })
	ReactModule.useEffect(function()
		-- upvalues: VRService (copy), UseResult (copy), UseResult1 (ref)
		if VRService.VREnabled then
			UseResult()
		end
		return UseResult1
	end, {})
	
	return ReactModule.createElement(RoactModule.Portal, { target = workspace }, {
		UserCFrameChangedConnection = ReactModule.createElement(EventConnection, {
			event = AssignResult.UpdateEvent,
			callback = function()
				-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
				if UseRefResult.current then
					UseRefResult.current:update()
				end
				if UseRefResult1.current then
					UseRefResult1.current:update()
				end
				if UseRefResult2.current then
					UseRefResult2.current:update()
				end
			end
		}),
		VREnabledConnection = ReactModule.createElement(EventConnection, {
			event = VRService:GetPropertyChangedSignal("VREnabled"),
			callback = UseResult
		}),
		VRUserCFrameEnabledConnection = ReactModule.createElement(EventConnection, {
			event = VRService.UserCFrameEnabled,
			callback = UseResult3
		}),
		VRSessionStateConnection = if Success then ReactModule.createElement(EventConnection, { event = Result, callback = UseResult2 }) else nil
	})
end
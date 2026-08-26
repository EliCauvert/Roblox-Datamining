local runService = game:GetService("RunService")
local contextActionService = game:GetService("ContextActionService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local reactModule = require(parent_1.React)
local roactModule = require(parent_1.Roact)
local eventConnection = require(parent_1.ReactUtils).EventConnection
local object = require(parent_1.LuauPolyfill).Object
local _ = require(parent.Constants)
local t = {
	VRService = game:GetService("VRService"),
	UpdateEvent = runService.Heartbeat
}

local function setLaserPointerModeBasedOnUserCFrame(value, p1)
	if p1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and p1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		value.current:setMode(value.current.Mode.DualPointer)
		
		return
	elseif p1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or p1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		value.current:setMode(value.current.Mode.Pointer)
		
		return
	end
	value.current:setMode(value.current.Mode.Disabled)
end

return function(p1)
	-- upvalues: object (ref), t (ref), reactModule (ref), setLaserPointerModeBasedOnUserCFrame (ref), contextActionService (ref), roactModule (ref), eventConnection (ref)
	local var1 = object.assign({}, t, p1)
	local laserPointer = var1.LaserPointer
	local VRControllerModel = var1.VRControllerModel
	local VRService = var1.VRService
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local ok, status = pcall(function()
		-- upvalues: VRService (ref)
		return VRService:GetPropertyChangedSignal("VRSessionState")
	end)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), laserPointer (ref), setLaserPointerModeBasedOnUserCFrame (copy), VRService (ref), var3 (ref), VRControllerModel (ref), var4 (ref), contextActionService (copy)
		if not var2.current then
			var2.current = laserPointer.new()
			setLaserPointerModeBasedOnUserCFrame(var2, VRService)
			var2.current:setEnableAmbidexterousPointer(true)
			var3.current = VRControllerModel.new(Enum.UserCFrame.LeftHand)
			var4.current = VRControllerModel.new(Enum.UserCFrame.RightHand)
		end
		var3.current:setEnabled(VRService.VREnabled)
		var4.current:setEnabled(VRService.VREnabled)
		
		if VRService.VREnabled then
			contextActionService:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
		end
	end, {
		var3,
		var4,
		var2,
		laserPointer,
		VRControllerModel
	})
	local _ = nil
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), var2 (ref), contextActionService (copy)
		if var3.current then
			var3.current:setEnabled(false)
		end
		if var4.current then
			var4.current:setEnabled(false)
		end
		if var2.current then
			var2.current:disableComponent()
		end
		contextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA)
		contextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
	end, {
		var3,
		var4,
		var2,
		laserPointer,
		VRControllerModel
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: VRService (ref), var2 (ref), setLaserPointerModeBasedOnUserCFrame (copy), var3 (ref), var4 (ref)
		local var8 = not (if VRService.VRSessionState ~= Enum.VRSessionState.Idle then VRService.VRSessionState == Enum.VRSessionState.Visible else true)
		
		if var2.current then
			if var8 then
				setLaserPointerModeBasedOnUserCFrame(var2, VRService)
			else
				var2.current:setMode(var2.current.Mode.Disabled)
			end
		end
		if var3.current then
			var3.current:setEnabled(var8)
		end
		if var4.current then
			var4.current:setEnabled(var8)
		end
	end, {
		var3,
		var4,
		var2,
		laserPointer,
		VRControllerModel
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: setLaserPointerModeBasedOnUserCFrame (copy), var2 (ref), VRService (ref)
		setLaserPointerModeBasedOnUserCFrame(var2, VRService)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: VRService (ref), var5 (ref), var6 (write)
		if VRService.VREnabled then
			var5()
		end
		return var6
	end, {})
	
	return reactModule.createElement(roactModule.Portal, { target = workspace }, {
		UserCFrameChangedConnection = reactModule.createElement(eventConnection, {
			event = var1.UpdateEvent,
			callback = function()
				-- upvalues: var2 (ref), var3 (ref), var4 (ref)
				if var2.current then
					var2.current:update()
				end
				if var3.current then
					var3.current:update()
				end
				if var4.current then
					var4.current:update()
				end
			end
		}),
		VREnabledConnection = reactModule.createElement(eventConnection, {
			event = VRService:GetPropertyChangedSignal("VREnabled"),
			callback = var5
		}),
		VRUserCFrameEnabledConnection = reactModule.createElement(eventConnection, { event = VRService.UserCFrameEnabled, callback = var8 }),
		VRSessionStateConnection = if ok then reactModule.createElement(eventConnection, { event = status, callback = var7 }) else nil
	})
end
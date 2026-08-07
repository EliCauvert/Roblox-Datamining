-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

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

local function setLaserPointerModeBasedOnUserCFrame(value, p0) --[[ line: 45 ]]
	if p0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and p0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		value.current:setMode(value.current.Mode.DualPointer)
		
		return
	elseif p0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or p0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		value.current:setMode(value.current.Mode.Pointer)
		
		return
	end
	value.current:setMode(value.current.Mode.Disabled)
end

return function(p1) --[[ line: 61 | named "PointerOverlay" ]]
	-- upvalues: object (ref), t (ref), reactModule (ref), setLaserPointerModeBasedOnUserCFrame (ref), contextActionService (ref), roactModule (ref), eventConnection (ref)
	local var6 = object.assign({}, t, p1)
	local laserPointer = var6.LaserPointer
	local VRControllerModel = var6.VRControllerModel
	local VRService = var6.VRService
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local ok, status = pcall(function() --[[ line: 74 ]]
		-- upvalues: VRService (ref)
		return VRService:GetPropertyChangedSignal("VRSessionState")
	end)
	local var10 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var7 (ref), laserPointer (ref), setLaserPointerModeBasedOnUserCFrame (copy), VRService (ref), var8 (ref), VRControllerModel (ref), var9 (ref), contextActionService (copy)
		if not var7.current then
			var7.current = laserPointer.new()
			setLaserPointerModeBasedOnUserCFrame(var7, VRService)
			var7.current:setEnableAmbidexterousPointer(true)
			var8.current = VRControllerModel.new(Enum.UserCFrame.LeftHand)
			var9.current = VRControllerModel.new(Enum.UserCFrame.RightHand)
		end
		var8.current:setEnabled(VRService.VREnabled)
		var9.current:setEnabled(VRService.VREnabled)
		
		if VRService.VREnabled then
			contextActionService:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
		end
	end, {
		var8,
		var9,
		var7,
		laserPointer,
		VRControllerModel
	})
	local _ = nil
	local var11 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var8 (ref), var9 (ref), var7 (ref), contextActionService (copy)
		if var8.current then
			var8.current:setEnabled(false)
		end
		if var9.current then
			var9.current:setEnabled(false)
		end
		if var7.current then
			var7.current:disableComponent()
		end
		contextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA)
		contextActionService:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
	end, {
		var8,
		var9,
		var7,
		laserPointer,
		VRControllerModel
	})
	local var12 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: VRService (ref), var7 (ref), setLaserPointerModeBasedOnUserCFrame (copy), var8 (ref), var9 (ref)
		local var14 = not (if VRService.VRSessionState ~= Enum.VRSessionState.Idle then VRService.VRSessionState == Enum.VRSessionState.Visible else true)
		
		if var7.current then
			if var14 then
				setLaserPointerModeBasedOnUserCFrame(var7, VRService)
			else
				var7.current:setMode(var7.current.Mode.Disabled)
			end
		end
		if var8.current then
			var8.current:setEnabled(var14)
		end
		if var9.current then
			var9.current:setEnabled(var14)
		end
	end, {
		var8,
		var9,
		var7,
		laserPointer,
		VRControllerModel
	})
	local var13 = reactModule.useCallback(function() --[[ line: 135 ]]
		-- upvalues: setLaserPointerModeBasedOnUserCFrame (copy), var7 (ref), VRService (ref)
		setLaserPointerModeBasedOnUserCFrame(var7, VRService)
	end, { var7 })
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: VRService (ref), var10 (ref), var11 (write)
		if VRService.VREnabled then
			var10()
		end
		return var11
	end, {})
	
	return reactModule.createElement(roactModule.Portal, { target = workspace }, {
		UserCFrameChangedConnection = reactModule.createElement(eventConnection, {
			event = var6.UpdateEvent,
			callback = function() --[[ line: 152 ]]
				-- upvalues: var7 (ref), var8 (ref), var9 (ref)
				if var7.current then
					var7.current:update()
				end
				if var8.current then
					var8.current:update()
				end
				if var9.current then
					var9.current:update()
				end
			end
		}),
		VREnabledConnection = reactModule.createElement(eventConnection, {
			event = VRService:GetPropertyChangedSignal("VREnabled"),
			callback = var10
		}),
		VRUserCFrameEnabledConnection = reactModule.createElement(eventConnection, { event = VRService.UserCFrameEnabled, callback = var13 }),
		VRSessionStateConnection = if ok then reactModule.createElement(eventConnection, { event = status, callback = var12 }) else nil
	})
end
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils

return (require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks)(function(p1)
	-- upvalues: RunService (copy), GamepadUtils (copy), ContextActionService (copy), ReactModule (copy), RoactModule (copy)
	local Flag = false
	
	local function rotate(_, _, p2)
		-- upvalues: Flag (ref), RunService (upval), GamepadUtils (upval), p1 (copy)
		if not Flag then
			Flag = true
			RunService:BindToRenderStep("VRAvatarEditorJoystickRotate", Enum.RenderPriority.Input.Value, function(DeltaTime)
				-- upvalues: GamepadUtils (upval), p2 (copy), p1 (upval)
				GamepadUtils.rotateAndZoom(p2, DeltaTime, p1.setAngularVelocityByPixels, p1.rotateByRadians)
			end)
		end
		return Enum.ContextActionResult.Pass
	end
	
	local function unbindRotate()
		-- upvalues: ContextActionService (upval), RunService (upval), Flag (ref)
		ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_R")
		ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_L")
		RunService:UnbindFromRenderStep("VRAvatarEditorJoystickRotate")
		Flag = false
	end
	
	local function bindRotate()
		-- upvalues: ContextActionService (upval), RunService (upval), Flag (ref), rotate (copy)
		ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_R")
		ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_L")
		RunService:UnbindFromRenderStep("VRAvatarEditorJoystickRotate")
		Flag = false
		ContextActionService:BindCoreAction("RotateAvatarWithGamepadVR_R", rotate, false, Enum.KeyCode.Thumbstick2)
		ContextActionService:BindCoreAction("RotateAvatarWithGamepadVR_L", rotate, false, Enum.KeyCode.Thumbstick1)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), RunService (upval), Flag (ref)
		return function()
			-- upvalues: ContextActionService (upval), RunService (upval), Flag (upval)
			ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_R")
			ContextActionService:UnbindCoreAction("RotateAvatarWithGamepadVR_L")
			RunService:UnbindFromRenderStep("VRAvatarEditorJoystickRotate")
			Flag = false
		end
	end, {})
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[RoactModule.Event.MouseEnter] = bindRotate,
		[RoactModule.Event.MouseLeave] = unbindRotate
	})
end))
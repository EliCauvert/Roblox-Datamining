local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local VRConstants = require(Parent.VrCompatibility).VRConstants
local Panel3D = UIBloxModule.Core.VR.Panel3D
local Constants = UIBloxModule.Core.VR.Constants
local RepositionInExperienceVRToasts = game:DefineFastFlag("RepositionInExperienceVRToasts", false)

return function(p1) --[[ Line: 28 ]]
	-- upvalues: ReactModule (copy), GuiService (copy), VRConstants (copy), RepositionInExperienceVRToasts (copy), Constants (copy), Panel3D (copy)
	local IsConfirmModalOpen = p1.isConfirmModalOpen
	local IsToastOpen = p1.isToastOpen
	local IsCoreScript = p1.isCoreScript
	local ToastComponent = p1.ToastComponent
	local ConfirmationModalComponent = p1.ConfirmationModalComponent
	local UseRefResult = ReactModule.useRef(nil)
	local PositionLockedPanelName = GuiService.CoreGuiFolder and GuiService.CoreGuiFolder:FindFirstChild(VRConstants.PositionLockedPanelName)
	
	if PositionLockedPanelName then
		UseRefResult.current = PositionLockedPanelName
	else
		PositionLockedPanelName = UseRefResult.current
	end
	local Y = if PositionLockedPanelName then PositionLockedPanelName.Size.Y else 2.45
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ReactModule.createElement(Panel3D, if IsCoreScript then {
			panelName = "ToastNotifications",
			lerp = false,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			alwaysOnTop = true,
			partSize = if RepositionInExperienceVRToasts then vector.create(1, 0.5, 0) else vector.create(1.2000000476837158, 0.6000000238418579, 0),
			virtualScreenSize = Vector2.new(300, 150),
			anchoring = Constants.AnchoringTypes.Head,
			parent = GuiService.CoreGuiFolder,
			hidden = not IsToastOpen,
			tiltCallback = ReactModule.useCallback(function(p2) --[[ Line: 62 ]]
				-- upvalues: PositionLockedPanelName (ref), RepositionInExperienceVRToasts (upval), Y (copy)
				return if PositionLockedPanelName then if RepositionInExperienceVRToasts then PositionLockedPanelName.CFrame * CFrame.new(0, Y * -0.53, Y * -0.15) * CFrame.Angles(0.25, 0, 0) else PositionLockedPanelName.CFrame * CFrame.new(0, Y * -0.45, Y * -0.15) * CFrame.Angles(0.2, 0, 0) else p2.panelCFrame
			end, { PositionLockedPanelName, Y })
		} else {
			panelName = "ToastNotifications",
			partSize = VRConstants.ToastSize,
			offset = CFrame.lookAt(VRConstants.ToastPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = VRConstants.ToastResolution,
			curvature = VRConstants.ToastCurvature,
			hidden = not IsToastOpen
		}, { Toast = ToastComponent }),
		ReactModule.createElement(Panel3D, {
			panelName = "ConfirmationModal",
			partSize = vector.create(3, 3, 0),
			lerp = false,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			alwaysOnTop = true,
			virtualScreenSize = Vector2.new(600, 600),
			anchoring = Constants.AnchoringTypes.Head,
			parent = GuiService.CoreGuiFolder,
			hidden = not IsConfirmModalOpen,
			tiltCallback = ReactModule.useCallback(function(p2) --[[ Line: 93 ]]
				-- upvalues: PositionLockedPanelName (ref)
				return if PositionLockedPanelName then PositionLockedPanelName.CFrame * CFrame.new(0, 0, -0.1) else p2.panelCFrame
			end, { PositionLockedPanelName })
		}, { DeeplinkConfirmationModal = ConfirmationModalComponent })
	})
end
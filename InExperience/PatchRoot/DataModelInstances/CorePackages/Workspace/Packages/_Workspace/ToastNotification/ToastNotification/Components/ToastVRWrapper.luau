local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local VRConstants = require(parent.VrCompatibility).VRConstants
local panel3D = UIBloxModule.Core.VR.Panel3D
local constants = UIBloxModule.Core.VR.Constants
local repositionInExperienceVRToasts = game:DefineFastFlag("RepositionInExperienceVRToasts", false)

return function(p0) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), guiService (ref), VRConstants (ref), repositionInExperienceVRToasts (ref), constants (ref), panel3D (ref)
	local isConfirmModalOpen = p0.isConfirmModalOpen
	local isToastOpen = p0.isToastOpen
	local isCoreScript = p0.isCoreScript
	local toastComponent = p0.ToastComponent
	local confirmationModalComponent = p0.ConfirmationModalComponent
	local var4 = reactModule.useRef(nil)
	local positionLockedPanelName = guiService.CoreGuiFolder and guiService.CoreGuiFolder:FindFirstChild(VRConstants.PositionLockedPanelName)
	
	if positionLockedPanelName then
		var4.current = positionLockedPanelName
	else
		positionLockedPanelName = var4.current
	end
	local var6 = if positionLockedPanelName then positionLockedPanelName.Size.Y else 2.45
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		reactModule.createElement(panel3D, if isCoreScript then {
			panelName = "ToastNotifications",
			lerp = false,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			alwaysOnTop = true,
			partSize = if repositionInExperienceVRToasts then Vector3.new(1, 0.5, 0) else Vector3.new(1.200000047684, 0.600000023842, 0),
			virtualScreenSize = Vector2.new(300, 150),
			anchoring = constants.AnchoringTypes.Head,
			parent = guiService.CoreGuiFolder,
			hidden = not isToastOpen,
			tiltCallback = reactModule.useCallback(function(p1) --[[ line: 62 ]]
				-- upvalues: positionLockedPanelName (write), repositionInExperienceVRToasts (copy), var6 (ref)
				return if positionLockedPanelName then if repositionInExperienceVRToasts then positionLockedPanelName.CFrame * CFrame.new(0, var6 * -0.53, var6 * -0.15) * CFrame.Angles(0.25, 0, 0) else positionLockedPanelName.CFrame * CFrame.new(0, var6 * -0.45, var6 * -0.15) * CFrame.Angles(0.2, 0, 0) else p1.panelCFrame
			end, { positionLockedPanelName, var6 })
		} else {
			panelName = "ToastNotifications",
			partSize = VRConstants.ToastSize,
			offset = CFrame.lookAt(VRConstants.ToastPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = VRConstants.ToastResolution,
			curvature = VRConstants.ToastCurvature,
			hidden = not isToastOpen
		}, { Toast = toastComponent }),
		reactModule.createElement(panel3D, {
			panelName = "ConfirmationModal",
			partSize = Vector3.new(3, 3, 0),
			lerp = false,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			alwaysOnTop = true,
			virtualScreenSize = Vector2.new(600, 600),
			anchoring = constants.AnchoringTypes.Head,
			parent = guiService.CoreGuiFolder,
			hidden = not isConfirmModalOpen,
			tiltCallback = reactModule.useCallback(function(p2) --[[ line: 93 ]]
				-- upvalues: positionLockedPanelName (write)
				return if positionLockedPanelName then positionLockedPanelName.CFrame * CFrame.new(0, 0, -0.1) else p2.panelCFrame
			end, { positionLockedPanelName })
		}, { DeeplinkConfirmationModal = confirmationModalComponent })
	})
end
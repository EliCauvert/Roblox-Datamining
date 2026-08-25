local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local guiService = game:GetService("GuiService")
local parent = vrSpatialUi.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local constants = UIBloxModule.Core.VR.Constants
local panel3D = UIBloxModule.Core.VR.Panel3D
local UIManagerModule = require(vrSpatialUi.UIManager)
local _ = require(vrSpatialUi.Constants)
local registerRoactPanelModule = require(vrSpatialUi.registerRoactPanel)
local useHeadScaleModule = require(vrSpatialUi.Hooks.useHeadScale)
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP

return reactModule.memo(function(p0)
	-- upvalues: UIManagerModule (ref), inExperienceUIVRIXP (ref), reactModule (ref), useHeadScaleModule (ref), panel3D (ref), constants (ref), guiService (ref), registerRoactPanelModule (ref)
	local panelTypeScaledPartSizeInPixel = UIManagerModule.getInstance():getScaledPartSizeInPixel(p0.panelType)
	local panelTypePanelSizeInPixel = UIManagerModule.getInstance():getPanelSizeInPixel(p0.panelType)
	local var9 = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then reactModule.useRef(nil) else nil
	local var10, _ = useHeadScaleModule(var9, panelTypeScaledPartSizeInPixel)
	
	return reactModule.createElement(panel3D, {
		lerp = true,
		tilt = 0,
		faceCamera = true,
		curvature = 0,
		panelName = p0.panelType,
		partRef = var9,
		partSize = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypeScaledPartSizeInPixel else panelTypeScaledPartSizeInPixel * var10,
		virtualScreenSize = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var10,
		offset = CFrame.new(0, 0, 0),
		anchoring = constants.AnchoringTypes.PanelManaged,
		parent = guiService.CoreGuiFolder,
		connectPanelManagerFunction = function(p1)
			-- upvalues: registerRoactPanelModule (copy), p0 (ref), UIManagerModule (copy)
			if p1 then
				registerRoactPanelModule(p1, p0.panelType, p0.visibilityObservable)
				
				return
			end
			UIManagerModule.getInstance():removeRoactPanel(p0.panelType)
		end,
		zOffset = p0.zOffset or 1
	}, {
		ContentContainer = if p0.requireCanvasGroup then reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Name = "AnimatablePanelManagedContent",
			BorderSizePixel = 0,
			GroupTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Content = p0.renderFunction(if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var10)
		}) else p0.renderFunction(if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var10)
	})
end)
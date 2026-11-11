local VrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local GuiService = game:GetService("GuiService")
local Parent = VrSpatialUi.Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local Constants = UIBloxModule.Core.VR.Constants
local Panel3D = UIBloxModule.Core.VR.Panel3D
local UIManagerModule = require(VrSpatialUi.UIManager)
local _ = require(VrSpatialUi.Constants)
local RegisterRoactPanelModule = require(VrSpatialUi.registerRoactPanel)
local UseHeadScaleModule = require(VrSpatialUi.Hooks.useHeadScale)
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP

return ReactModule.memo(function(p1)
	-- upvalues: UIManagerModule (copy), InExperienceUIVRIXP (copy), ReactModule (copy), UseHeadScaleModule (copy), Panel3D (copy), Constants (copy), GuiService (copy), RegisterRoactPanelModule (copy)
	local ScaledPartSizeInPixel = UIManagerModule.getInstance():getScaledPartSizeInPixel(p1.panelType)
	local PanelSizeInPixel = UIManagerModule.getInstance():getPanelSizeInPixel(p1.panelType)
	local UseRefResult = if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then ReactModule.useRef(nil) else nil
	local UseHeadScaleModuleResult, _ = UseHeadScaleModule(UseRefResult, ScaledPartSizeInPixel)
	
	return ReactModule.createElement(Panel3D, {
		lerp = true,
		tilt = 0,
		faceCamera = true,
		curvature = 0,
		panelName = p1.panelType,
		partRef = UseRefResult,
		partSize = if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then ScaledPartSizeInPixel else ScaledPartSizeInPixel * UseHeadScaleModuleResult,
		virtualScreenSize = if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then PanelSizeInPixel else PanelSizeInPixel * UseHeadScaleModuleResult,
		offset = CFrame.new(0, 0, 0),
		anchoring = Constants.AnchoringTypes.PanelManaged,
		parent = GuiService.CoreGuiFolder,
		connectPanelManagerFunction = function(p2)
			-- upvalues: RegisterRoactPanelModule (upval), p1 (copy), UIManagerModule (upval)
			if p2 then
				RegisterRoactPanelModule(p2, p1.panelType, p1.visibilityObservable)
				
				return
			else
				UIManagerModule.getInstance():removeRoactPanel(p1.panelType)
			end
		end,
		zOffset = p1.zOffset or 1
	}, {
		ContentContainer = if p1.requireCanvasGroup then ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Name = "AnimatablePanelManagedContent",
			BorderSizePixel = 0,
			GroupTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Content = p1.renderFunction(if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then PanelSizeInPixel else PanelSizeInPixel * UseHeadScaleModuleResult)
		}) else p1.renderFunction(if InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then PanelSizeInPixel else PanelSizeInPixel * UseHeadScaleModuleResult)
	})
end)
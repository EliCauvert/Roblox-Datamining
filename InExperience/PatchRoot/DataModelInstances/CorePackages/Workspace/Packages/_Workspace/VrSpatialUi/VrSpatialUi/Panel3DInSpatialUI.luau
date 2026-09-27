local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local guiService = game:GetService("GuiService")
local parent = vrSpatialUi.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local subscribeToBinding = reactModule.__subscribeToBinding
local constants = UIBloxModule.Core.VR.Constants
local panel3D = UIBloxModule.Core.VR.Panel3D
local UIManagerModule = require(vrSpatialUi.UIManager)
local _ = require(vrSpatialUi.Constants)
local registerRoactPanelModule = require(vrSpatialUi.registerRoactPanel)
local useHeadScaleModule = require(vrSpatialUi.Hooks.useHeadScale)
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP

return reactModule.memo(function(p1)
	-- upvalues: UIManagerModule (ref), inExperienceUIVRIXP (ref), reactModule (ref), useHeadScaleModule (ref), panel3D (ref), constants (ref), guiService (ref), registerRoactPanelModule (ref), subscribeToBinding (ref)
	local panelTypeScaledPartSizeInPixel = UIManagerModule.getInstance():getScaledPartSizeInPixel(p1.panelType)
	local panelTypePanelSizeInPixel = UIManagerModule.getInstance():getPanelSizeInPixel(p1.panelType)
	local var1 = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then reactModule.useRef(nil) else nil
	local var2, _ = useHeadScaleModule(var1, panelTypeScaledPartSizeInPixel)
	local var3 = nil
	
	return reactModule.createElement(panel3D, {
		lerp = true,
		tilt = 0,
		faceCamera = true,
		curvature = 0,
		panelName = p1.panelType,
		partRef = var1,
		partSize = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypeScaledPartSizeInPixel else panelTypeScaledPartSizeInPixel * var2,
		virtualScreenSize = if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var2,
		offset = CFrame.new(0, 0, 0),
		anchoring = constants.AnchoringTypes.PanelManaged,
		parent = guiService.CoreGuiFolder,
		connectPanelManagerFunction = function(p2)
			-- upvalues: registerRoactPanelModule (copy), p1 (ref), subscribeToBinding (copy), var3 (write), UIManagerModule (copy)
			if p2 then
				registerRoactPanelModule(p2, p1.panelType, p1.visibilityObservable, p1.keepVisibleWhenTopBarHidden)
				
				if p1.keepVisibleWhenTopBarHidden and p1.controlsVisible and p2.current then
					local current = p2.current
					local adornee = current.Adornee
					local active = current.Active
					local canQuery = adornee.CanQuery
					local var4 = subscribeToBinding(p1.controlsVisible, function(p3)
						-- upvalues: current (ref), active (ref), adornee (ref), canQuery (ref)
						current.Active = active and p3
						adornee.CanQuery = canQuery and p3
					end)
					local value = p1.controlsVisible:getValue()
					current.Active = active and value
					adornee.CanQuery = canQuery and value
					
					var3 = function()
						-- upvalues: var4 (ref), current (ref), adornee (ref), active (ref), canQuery (ref)
						var4()
						current.Active = active
						adornee.CanQuery = canQuery
					end
					
					return
				end
			elseif var3 then
				var3()
				var3 = nil
			end
			UIManagerModule.getInstance():removeRoactPanel(p1.panelType)
		end,
		zOffset = p1.zOffset or 1
	}, {
		ContentContainer = if p1.requireCanvasGroup then reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Name = "AnimatablePanelManagedContent",
			BorderSizePixel = 0,
			GroupTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Content = p1.renderFunction(if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var2)
		}) else p1.renderFunction(if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then panelTypePanelSizeInPixel else panelTypePanelSizeInPixel * var2)
	})
end)
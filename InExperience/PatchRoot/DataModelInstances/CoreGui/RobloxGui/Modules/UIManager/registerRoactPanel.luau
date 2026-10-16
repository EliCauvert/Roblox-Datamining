local Parent = script.Parent
local UIManagerModule = require(Parent.UIManager)
local ConstantsModule = require(Parent.Constants)

return function(p1, PanelType) --[[ Line: 7 ]]
	-- upvalues: ConstantsModule (copy), UIManagerModule (copy)
	local CameraFixedPanelProp = nil
	local ROACTPANELUIGROUP = ConstantsModule.ROACT_PANEL_UIGROUP_MAP[PanelType]
	
	if ROACTPANELUIGROUP then
		CameraFixedPanelProp = {
			uiGroupElementOffset = ConstantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[PanelType]
		}
	end
	UIManagerModule.getInstance():registerRoactPanel(PanelType, {
		headScale = 1,
		panelObject = p1.current,
		uiType = ConstantsModule.SpatialUIType.SpatialUIRoact,
		panelType = PanelType,
		panelPositionProps = {
			uiGroup = ROACTPANELUIGROUP,
			cameraFixedPanelProp = CameraFixedPanelProp
		}
	})
end
local parent = script.Parent
local UIManagerModule = require(parent.UIManager)
local constantsModule = require(parent.Constants)

return function(p1, p2)
	-- upvalues: constantsModule (ref), UIManagerModule (ref)
	local t = nil
	local var1 = constantsModule.ROACT_PANEL_UIGROUP_MAP[p2]
	
	if var1 then
		t = {
			uiGroupElementOffset = constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[p2]
		}
	end
	UIManagerModule.getInstance():registerRoactPanel(p2, {
		headScale = 1,
		panelObject = p1.current,
		uiType = constantsModule.SpatialUIType.SpatialUIRoact,
		panelType = p2,
		panelPositionProps = { uiGroup = var1, cameraFixedPanelProp = t }
	})
end
local parent = script.Parent
local UIManagerModule = require(parent.UIManager)
local constantsModule = require(parent.Constants)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: constantsModule (ref), UIManagerModule (ref)
	local t = nil
	local var3 = constantsModule.ROACT_PANEL_UIGROUP_MAP[p1]
	
	if var3 then
		t = {
			uiGroupElementOffset = constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[p1]
		}
	end
	UIManagerModule.getInstance():registerRoactPanel(p1, {
		headScale = 1,
		panelObject = p0.current,
		uiType = constantsModule.SpatialUIType.SpatialUIRoact,
		panelType = p1,
		panelPositionProps = { uiGroup = var3, cameraFixedPanelProp = t }
	})
end
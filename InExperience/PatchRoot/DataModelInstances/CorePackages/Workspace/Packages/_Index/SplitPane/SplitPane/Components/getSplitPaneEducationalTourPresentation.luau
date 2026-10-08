local _ = require(script:FindFirstAncestor("SplitPane").Parent.React)

local function _(p1, p2)
	return Rect.new(p1.Min.X - p2, p1.Min.Y - p2, p1.Max.X + p2, p1.Max.Y + p2)
end

return function(p1)
	local rect
	local var1 = p1.stepIndex == 1 and p1.isSupportPaneCollapsed
	local isDirectionalInput = var1 and p1.isDirectionalInput
	local var2 = if var1 then if p1.anchors.gamepadCollapsedStepOne == nil then p1.collapsedExpandButtonRect ~= nil and p1.anchors.collapsedExpandButton ~= nil else true else not var1
	local _ = nil
	local var3 = if isDirectionalInput and p1.anchors.gamepadCollapsedStepOne ~= nil then p1.anchors.gamepadCollapsedStepOne elseif var1 and p1.anchors.collapsedExpandButton ~= nil then p1.anchors.collapsedExpandButton elseif p1.stepIndex == 2 and p1.isDirectionalInput and p1.anchors.gamepadStepTwo ~= nil then p1.anchors.gamepadStepTwo elseif p1.stepIndex == 2 and p1.anchors.bottomPane ~= nil then p1.anchors.bottomPane elseif p1.stepIndex == 3 and p1.isDirectionalInput and p1.anchors.gamepadFinal ~= nil then p1.anchors.gamepadFinal elseif p1.stepIndex == 3 and p1.anchors.topRightControl ~= nil then p1.anchors.topRightControl else p1.anchors.supportPane
	
	if var1 and not isDirectionalInput and p1.collapsedExpandButtonRect ~= nil then
		local collapsedExpandButtonRect = p1.collapsedExpandButtonRect
		local collapsedSpotlightPadding = p1.collapsedSpotlightPadding
		rect = Rect.new(collapsedExpandButtonRect.Min.X - collapsedSpotlightPadding, collapsedExpandButtonRect.Min.Y - collapsedSpotlightPadding, collapsedExpandButtonRect.Max.X + collapsedSpotlightPadding, collapsedExpandButtonRect.Max.Y + collapsedSpotlightPadding)
	else
		rect = nil
	end
	return {
		isCollapsedStepOne = var1,
		isGamepadCollapsedStepOne = isDirectionalInput,
		isAnchorReady = var2,
		anchorRef = var3,
		spotlightRect = rect,
		dimEndX = if var1 or p1.supportPaneRect == nil then nil else p1.supportPaneRect.Min.X
	}
end
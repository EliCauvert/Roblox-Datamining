local _ = require(script:FindFirstAncestor("SplitPane").Parent.React)

local function _(p1, p2): Rect
	return Rect.new(p1.Min.X - p2, p1.Min.Y - p2, p1.Max.X + p2, p1.Max.Y + p2)
end

return function(p1)
	local IsSupportPaneCollapsed = p1.stepIndex == 1 and p1.isSupportPaneCollapsed
	local IsDirectionalInput = IsSupportPaneCollapsed and p1.isDirectionalInput
	local NoIsSupportPaneCollapsed: boolean = not IsSupportPaneCollapsed or (p1.anchors.gamepadCollapsedStepOne ~= nil or p1.collapsedExpandButtonRect ~= nil and p1.anchors.collapsedExpandButton ~= nil)
	local GamepadCollapsedStepOne = if IsDirectionalInput and p1.anchors.gamepadCollapsedStepOne ~= nil then p1.anchors.gamepadCollapsedStepOne elseif IsSupportPaneCollapsed and p1.anchors.collapsedExpandButton ~= nil then p1.anchors.collapsedExpandButton elseif p1.stepIndex == 2 and p1.isDirectionalInput and p1.anchors.gamepadStepTwo ~= nil then p1.anchors.gamepadStepTwo elseif p1.stepIndex == 2 and p1.anchors.bottomPane ~= nil then p1.anchors.bottomPane elseif p1.stepIndex == 3 and p1.isDirectionalInput and p1.anchors.gamepadFinal ~= nil then p1.anchors.gamepadFinal elseif p1.stepIndex == 3 and p1.anchors.topRightControl ~= nil then p1.anchors.topRightControl else p1.anchors.supportPane
	local SpotlightRect = nil
	
	if IsSupportPaneCollapsed and not IsDirectionalInput and p1.collapsedExpandButtonRect ~= nil then
		local CollapsedExpandButtonRect = p1.collapsedExpandButtonRect
		local CollapsedSpotlightPadding = p1.collapsedSpotlightPadding
		SpotlightRect = Rect.new(CollapsedExpandButtonRect.Min.X - CollapsedSpotlightPadding, CollapsedExpandButtonRect.Min.Y - CollapsedSpotlightPadding, CollapsedExpandButtonRect.Max.X + CollapsedSpotlightPadding, CollapsedExpandButtonRect.Max.Y + CollapsedSpotlightPadding)
	else
		SpotlightRect = nil
	end
	return {
		isCollapsedStepOne = IsSupportPaneCollapsed,
		isGamepadCollapsedStepOne = IsDirectionalInput,
		isAnchorReady = NoIsSupportPaneCollapsed,
		anchorRef = GamepadCollapsedStepOne,
		spotlightRect = SpotlightRect,
		dimEndX = if IsSupportPaneCollapsed or p1.supportPaneRect == nil then nil else p1.supportPaneRect.Min.X
	}
end
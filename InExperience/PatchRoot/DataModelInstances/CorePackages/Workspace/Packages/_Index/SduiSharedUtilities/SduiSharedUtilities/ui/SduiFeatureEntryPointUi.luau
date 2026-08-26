local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local loading = require(parent.Foundation).Loading
local sduiFeatureErrorUiModule = require(sduiSharedUtilities.ui.SduiFeatureErrorUi)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = require(parent.SharedFlags).FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (ref), loading (ref), sduiFeatureErrorUiModule (ref)
	return reactModule.createElement("Frame", {
		Size = if p1.Size then p1.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p1.AutomaticSize then p1.AutomaticSize else Enum.AutomaticSize.Y,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = if fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then p1.onAbsoluteSizeChange else nil,
		ref = p2
	}, {
		Content = if p1.uiStatus == "Loading" and p1.shouldDisplayLoading then if p1.loadingSlot then p1.loadingSlot else reactModule.createElement(loading, {
			testId = "sdui-feature-entry-point-loading",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}) elseif p1.uiStatus == "Error" and p1.shouldDisplayError then if p1.errorSlot then p1.errorSlot else reactModule.createElement(sduiFeatureErrorUiModule, { onRetry = p1.onRetry }) elseif p1.uiStatus == "Resolved" then p1.contentSlot else nil
	})
end)
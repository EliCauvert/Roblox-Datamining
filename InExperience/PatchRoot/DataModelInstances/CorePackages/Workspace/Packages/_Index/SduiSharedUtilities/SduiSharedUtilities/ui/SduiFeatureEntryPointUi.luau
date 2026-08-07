local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local loading = require(parent.Foundation).Loading
local sduiFeatureErrorUiModule = require(sduiSharedUtilities.ui.SduiFeatureErrorUi)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = require(parent.SharedFlags).FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler

return reactModule.forwardRef(function(p0, p1) --[[ line: 33 | named "SduiFeatureEntryPointUi" ]]
	-- upvalues: reactModule (ref), fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (ref), loading (ref), sduiFeatureErrorUiModule (ref)
	return reactModule.createElement("Frame", {
		Size = if p0.Size then p0.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p0.AutomaticSize then p0.AutomaticSize else Enum.AutomaticSize.Y,
		Position = p0.Position,
		LayoutOrder = p0.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = if fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then p0.onAbsoluteSizeChange else nil,
		ref = p1
	}, {
		Content = if p0.uiStatus == "Loading" and p0.shouldDisplayLoading then if p0.loadingSlot then p0.loadingSlot else reactModule.createElement(loading, {
			testId = "sdui-feature-entry-point-loading",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}) elseif p0.uiStatus == "Error" and p0.shouldDisplayError then if p0.errorSlot then p0.errorSlot else reactModule.createElement(sduiFeatureErrorUiModule, { onRetry = p0.onRetry }) elseif p0.uiStatus == "Resolved" then p0.contentSlot else nil
	})
end)
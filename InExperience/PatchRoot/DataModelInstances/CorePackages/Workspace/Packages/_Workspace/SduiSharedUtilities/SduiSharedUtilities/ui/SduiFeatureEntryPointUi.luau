local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local Loading = require(Parent.Foundation).Loading
local SduiFeatureErrorUiModule = require(SduiSharedUtilities.ui.SduiFeatureErrorUi)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = require(Parent.SharedFlags).FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler

return ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: ReactModule (copy), FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (copy), Loading (copy), SduiFeatureErrorUiModule (copy)
	return ReactModule.createElement("Frame", {
		Size = if Frame.Size then Frame.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if Frame.AutomaticSize then Frame.AutomaticSize else Enum.AutomaticSize.Y,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = if FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then Frame.onAbsoluteSizeChange else nil,
		ref = Ref
	}, {
		Content = if Frame.uiStatus == "Loading" and Frame.shouldDisplayLoading then if Frame.loadingSlot then Frame.loadingSlot else ReactModule.createElement(Loading, {
			testId = "sdui-feature-entry-point-loading",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}) elseif Frame.uiStatus == "Error" and Frame.shouldDisplayError then if Frame.errorSlot then Frame.errorSlot else ReactModule.createElement(SduiFeatureErrorUiModule, { onRetry = Frame.onRetry }) elseif Frame.uiStatus == "Resolved" then Frame.contentSlot else nil
	})
end)
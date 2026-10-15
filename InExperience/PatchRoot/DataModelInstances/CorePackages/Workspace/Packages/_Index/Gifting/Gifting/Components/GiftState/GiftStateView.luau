local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local button = foundationModule.Button
local image = foundationModule.Image
local loading = foundationModule.Loading
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
preloadAsset("pictograms/collaborators")
preloadAsset("pictograms/alert")
local giftStateEnumModule = require(script.Parent.GiftStateEnum)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), giftStateEnumModule (ref), assets (ref), reactModule (ref), view (ref), loading (ref), image (ref), text (ref), button (ref), buttonVariant (ref)
	local var1 = p1.retryLabel ~= nil and p1.onRetry ~= nil
	local var2 = useTokens()
	local state = p1.state
	local var3 = if state == giftStateEnumModule.Empty then assets["pictograms/collaborators"] elseif state == giftStateEnumModule.Error or state == giftStateEnumModule.Blocked then assets["pictograms/alert"] else nil
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-y-xxlarge",
		testId = `gift-state-{string.lower(state)}`
	}, {
		Loading = if state == giftStateEnumModule.Loading then reactModule.createElement(loading, { testId = "gift-state-loading-indicator", LayoutOrder = 1 }) else nil,
		Illustration = if var3 then reactModule.createElement(image, {
			testId = "gift-state-illustration",
			LayoutOrder = 1,
			Image = var3.assetId,
			imageStyle = var2.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * var2.Config.UI.Scale, 180 * var2.Config.UI.Scale)
		}) else nil,
		Title = if p1.titleText then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
			testId = "gift-state-title",
			LayoutOrder = 2,
			Text = p1.titleText
		}) else nil,
		Body = if p1.bodyText then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			testId = "gift-state-body",
			LayoutOrder = 3,
			Text = p1.bodyText
		}) else nil,
		Retry = if var1 then reactModule.createElement(button, {
			testId = "gift-state-retry",
			LayoutOrder = 4,
			text = p1.retryLabel,
			variant = buttonVariant.Standard,
			onActivated = p1.onRetry
		}) else nil
	})
end)
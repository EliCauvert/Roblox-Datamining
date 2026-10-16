local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Loading = FoundationModule.Loading
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction: (any) -> () = FoundationCloudAssetsModule.preloadAsset
PreloadAssetFunction("pictograms/collaborators")
PreloadAssetFunction("pictograms/alert")
local GiftStateEnumModule = require(script.Parent.GiftStateEnum)

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "GiftStateView" ]]
	-- upvalues: UseTokensFunction (copy), GiftStateEnumModule (copy), Assets (copy), ReactModule (copy), View (copy), Loading (copy), Image (copy), Text (copy), Button (copy), ButtonVariant (copy)
	local HasOnRetry: boolean = p1.retryLabel ~= nil and p1.onRetry ~= nil
	local UseTokensResult = UseTokensFunction()
	local State: string = p1.state
	local PictogramsCollaborators = if State == GiftStateEnumModule.Empty then Assets["pictograms/collaborators"] elseif State == GiftStateEnumModule.Error or State == GiftStateEnumModule.Blocked then Assets["pictograms/alert"] else nil
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-y-xxlarge",
		testId = `gift-state-{string.lower(State)}`
	}, {
		Loading = if State == GiftStateEnumModule.Loading then ReactModule.createElement(Loading, { testId = "gift-state-loading-indicator", LayoutOrder = 1 }) else nil,
		Illustration = if PictogramsCollaborators then ReactModule.createElement(Image, {
			testId = "gift-state-illustration",
			LayoutOrder = 1,
			Image = PictogramsCollaborators.assetId,
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * UseTokensResult.Config.UI.Scale, 180 * UseTokensResult.Config.UI.Scale)
		}) else nil,
		Title = if p1.titleText then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
			testId = "gift-state-title",
			LayoutOrder = 2,
			Text = p1.titleText
		}) else nil,
		Body = if p1.bodyText then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			testId = "gift-state-body",
			LayoutOrder = 3,
			Text = p1.bodyText
		}) else nil,
		Retry = if HasOnRetry then ReactModule.createElement(Button, {
			testId = "gift-state-retry",
			LayoutOrder = 4,
			text = p1.retryLabel,
			variant = ButtonVariant.Standard,
			onActivated = p1.onRetry
		}) else nil
	})
end)
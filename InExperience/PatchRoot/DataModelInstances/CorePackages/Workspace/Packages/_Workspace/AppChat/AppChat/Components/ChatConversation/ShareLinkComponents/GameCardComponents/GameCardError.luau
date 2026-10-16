local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Alert, _ = require(AppChat.Utils.loadFoundationCloudAsset)("pictograms/alert")

function GameCardError() --[[ Line: 14 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), Alert (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-xy bg-action-subtle align-x-center col padding-xxlarge"
	}, {
		LoadingFailedImage = ReactModule.createElement(FoundationModule.Image, {
			tag = "size-1600",
			Image = Alert,
			imageStyle = UseTokensResult.Color.System.Contrast,
			ScaleType = Enum.ScaleType.Fit
		}),
		LoadingFailedText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 2,
			Text = UseLocalizationFunction({
				contentLoadingFailed = "Feature.Chat.Label.ContentLoadingFailed"
			}).contentLoadingFailed,
			textStyle = UseTokensResult.Color.System.Contrast,
			fontStyle = UseTokensResult.Typography.BodyLarge
		})
	})
end

return ReactModule.memo(GameCardError)
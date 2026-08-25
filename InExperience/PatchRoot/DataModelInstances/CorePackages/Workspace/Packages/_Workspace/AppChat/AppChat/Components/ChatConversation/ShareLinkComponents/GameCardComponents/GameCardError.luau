local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local var3, _ = require(appChat.Utils.loadFoundationCloudAsset)("pictograms/alert")

function GameCardError()
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), var3 (ref)
	local var4 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-xy bg-action-subtle align-x-center col padding-xxlarge"
	}, {
		LoadingFailedImage = reactModule.createElement(foundationModule.Image, {
			tag = "size-1600",
			Image = var3,
			imageStyle = var4.Color.System.Contrast,
			ScaleType = Enum.ScaleType.Fit
		}),
		LoadingFailedText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 2,
			Text = useLocalization({
				contentLoadingFailed = "Feature.Chat.Label.ContentLoadingFailed"
			}).contentLoadingFailed,
			textStyle = var4.Color.System.Contrast,
			fontStyle = var4.Typography.BodyLarge
		})
	})
end

return reactModule.memo(GameCardError)
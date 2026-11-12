local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseXSmallTileTypographyModule = require(SocialCarousel.Hooks.useXSmallTileTypography)
local FFlagSocialCarouselXSmallTileTextModule = require(SocialCarousel.Flags.FFlagSocialCarouselXSmallTileText)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local Text = FoundationModule.Text
local View = FoundationModule.View
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled

return function(p1)
	-- upvalues: UseSocialCarouselContextModule (copy), FFlagSocialCarouselXSmallTileTextModule (copy), UseTokensFunction (copy), UseXSmallTileTypographyModule (copy), FFlagSocialCarouselShareQREnabled (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseTokensResult = if FFlagSocialCarouselXSmallTileTextModule then UseTokensFunction() else nil
	local UseXSmallTileTypographyModuleResult = if FFlagSocialCarouselXSmallTileTextModule then UseXSmallTileTypographyModule() else nil
	local FontStyle = nil
	local FontStyle1 = nil
	
	if FFlagSocialCarouselXSmallTileTextModule and UseXSmallTileTypographyModuleResult and UseTokensResult then
		FontStyle = {
			Font = UseTokensResult.Typography.BodySmall.Font,
			FontSize = UseTokensResult.FontSize.FontSize_200,
			LineHeight = UseTokensResult.Typography.BodySmall.LineHeight
		}
		FontStyle1 = {
			Font = UseTokensResult.Typography.TitleMedium.Font,
			FontSize = UseTokensResult.FontSize.FontSize_200,
			LineHeight = UseTokensResult.Typography.TitleMedium.LineHeight
		}
	end
	local UseLocalizationResult = UseLocalizationFunction(if FFlagSocialCarouselShareQREnabled then {
		friendsHintBold = ConstantsModule.LOCALIZATION.FRIENDS_HINT_BOLD,
		friendsHintPlain = ConstantsModule.LOCALIZATION.FRIENDS_HINT_PLAIN
	} else {
		friendsHintTitle = ConstantsModule.LOCALIZATION.FRIENDS_HINT_TITLE,
		friendsHintBody = ConstantsModule.LOCALIZATION.FRIENDS_HINT_BODY
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.EMPTY_HINT)
	end, {})
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		tag = "col auto-none align-y-center",
		Size = UDim2.new(p1.itemSize.X.Scale, p1.itemSize.X.Offset + ConstantsModule.TILE_TEXT_WIDTH, p1.itemSize.Y.Scale, if FFlagSocialCarouselXSmallTileTextModule and UseXSmallTileTypographyModuleResult then p1.itemSize.X.Offset else p1.itemSize.Y.Offset - ConstantsModule.TILE_TEXT_HEIGHT),
		LayoutOrder = p1.index
	}, {
		Content = ReactModule.createElement(View, {
			BackgroundTransparency = 1,
			tag = {
				["auto-xy"] = FFlagSocialCarouselShareQREnabled,
				["col gap-xxsmall auto-xy"] = not FFlagSocialCarouselShareQREnabled
			}
		}, if FFlagSocialCarouselShareQREnabled then {
			HintText = ReactModule.createElement(Text, {
				RichText = true,
				tag = "text-body-small text-align-x-left auto-xy text-wrap",
				Text = `<b>{UseLocalizationResult.friendsHintBold}</b> {UseLocalizationResult.friendsHintPlain}`,
				fontStyle = FontStyle
			})
		} else {
			Title = ReactModule.createElement(Text, {
				tag = "text-title-medium text-align-x-left auto-xy text-wrap",
				LayoutOrder = 1,
				Text = UseLocalizationResult.friendsHintTitle,
				fontStyle = FontStyle1
			}),
			Subtitle = ReactModule.createElement(Text, {
				tag = "text-body-small text-align-x-left auto-xy text-wrap",
				LayoutOrder = 2,
				Text = UseLocalizationResult.friendsHintBody,
				fontStyle = FontStyle
			})
		})
	})
end
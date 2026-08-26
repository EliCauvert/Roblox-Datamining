local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(socialCarousel.Common.Constants)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local text = foundationModule.Text
local view = foundationModule.View
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagSocialCarouselShareQREnabled = require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled

return function(p1)
	-- upvalues: useSocialCarouselContextModule (ref), fFlagSocialCarouselShareQREnabled (ref), constantsModule (ref), fFlagConnectionsToFriendsRename (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var1 = useSocialCarouselContextModule()
	local var2 = useLocalization(if fFlagSocialCarouselShareQREnabled then {
		friendsHintBold = constantsModule.LOCALIZATION.FRIENDS_HINT_BOLD,
		friendsHintPlain = constantsModule.LOCALIZATION.FRIENDS_HINT_PLAIN
	} else {
		friendsHintTitle = if fFlagConnectionsToFriendsRename then constantsModule.LOCALIZATION.FRIENDS_HINT_TITLE else constantsModule.LOCALIZATION.CONNECTIONS_HINT_TITLE,
		friendsHintBody = if fFlagConnectionsToFriendsRename then constantsModule.LOCALIZATION.FRIENDS_HINT_BODY else constantsModule.LOCALIZATION.CONNECTIONS_HINT_BODY
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), constantsModule (copy)
		var1.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.EMPTY_HINT)
	end, {})
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		tag = "col auto-none align-y-center",
		Size = UDim2.new(p1.itemSize.X.Scale, p1.itemSize.X.Offset + constantsModule.TILE_TEXT_WIDTH, p1.itemSize.Y.Scale, p1.itemSize.Y.Offset - constantsModule.TILE_TEXT_HEIGHT),
		LayoutOrder = p1.index
	}, {
		Content = reactModule.createElement(view, {
			BackgroundTransparency = 1,
			tag = {
				["auto-xy"] = fFlagSocialCarouselShareQREnabled,
				["col gap-xxsmall auto-xy"] = not fFlagSocialCarouselShareQREnabled
			}
		}, if fFlagSocialCarouselShareQREnabled then {
			HintText = reactModule.createElement(text, {
				RichText = true,
				tag = "text-body-small text-align-x-left auto-xy text-wrap",
				Text = `<b>{var2.friendsHintBold}</b> {var2.friendsHintPlain}`
			})
		} else {
			Title = reactModule.createElement(text, {
				tag = "text-title-medium text-align-x-left auto-xy text-wrap",
				LayoutOrder = 1,
				Text = var2.friendsHintTitle
			}),
			Subtitle = reactModule.createElement(text, {
				tag = "text-body-small text-align-x-left auto-xy text-wrap",
				LayoutOrder = 2,
				Text = var2.friendsHintBody
			})
		})
	})
end
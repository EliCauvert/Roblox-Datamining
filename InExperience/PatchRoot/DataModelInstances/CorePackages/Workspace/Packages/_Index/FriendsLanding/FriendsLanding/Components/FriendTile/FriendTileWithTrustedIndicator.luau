local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local react = dependenciesModule.React
local useLocalization = require(parent.Localization).Hooks.useLocalization
local llama = require(parent.LuaSocialLibrariesDeps).llama
local verifiedBadgesModule = require(parent.VerifiedBadges)
local UIBlox = dependenciesModule.UIBlox
local useStyle = UIBlox.Core.Style.useStyle
local playerTile = UIBlox.App.Tile.PlayerTile
local openTypeSupport = UIBlox.Utility.OpenTypeSupport
local playerContext = UIBlox.App.Indicator.PlayerContext
local _ = dependenciesModule.RoduxPresence.Enums.PresenceType
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local text = foundationModule.Text
local skeleton = foundationModule.Skeleton
local enums = foundationModule.Enums
local stateLayerAffordance = enums.StateLayerAffordance
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fixFriendsLandingTileGamepadSelection = game:DefineFastFlag("FixFriendsLandingTileGamepadSelection", false)
local t = {
	userPresence = nil,
	index = 1,
	openPlayerProfile = nil,
	buttons = nil,
	trustedConnection = false,
	isVerified = false
}

return function(p1)
	-- upvalues: llama (ref), t (ref), useStyle (ref), useTokens (ref), useLocalization (ref), react (ref), view (ref), stateLayerAffordance (ref), playerTile (ref), fixFriendsLandingTileGamepadSelection (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), skeleton (ref), text (ref), verifiedBadgesModule (ref), fFlagEnableBlackbirdCheck (ref), foundationModule (ref), enums (ref), playerContext (ref)
	local var1 = llama.Dictionary.join(t, p1 or {})
	local var2 = useStyle()
	local var3 = useTokens()
	local var4 = useLocalization({
		trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
	})
	local icon = nil
	local iconColor = nil
	local iconTransparency = nil
	local textDefault = var2.Theme.TextDefault
	
	if var1.relevancyInfo then
		iconColor = var1.relevancyInfo.iconColor
		icon = var1.relevancyInfo.icon
		iconTransparency = var1.relevancyInfo.iconTransparency
	end
	local createElement = react.createElement
	local t_1 = {
		tag = "col auto-xy size-0-0 gap-small",
		onActivated = var1.openPlayerProfile,
		stateLayer = { affordance = stateLayerAffordance.None }
	}
	local t_2 = {
		PlayerTile = react.createElement(view, {
			tag = "size-full-full aspect-1-1 bg-surface-100 clip",
			LayoutOrder = 1
		}, {
			react.createElement(playerTile, {
				title = "",
				subtitle = "",
				tileSize = UDim2.fromScale(1, 1),
				thumbnail = var1.user.thumbnail,
				onActivated = var1.openPlayerProfile,
				forwardedRef = var1.playerTileRef,
				buttons = var1.buttons,
				Selectable = if fixFriendsLandingTileGamepadSelection then false else true,
				openTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
			})
		})
	}
	local createElement_1 = react.createElement
	local t_3 = {
		tag = "col size-full-0 auto-y gap-xxsmall",
		LayoutOrder = 2
	}
	local t_4 = {}
	local createElement_2 = react.createElement
	local t_5 = { tag = "auto-y size-full-0" }
	local t_6 = {
		LoadingSkeleton = if not var1.title then react.createElement(skeleton, {
			Size = UDim2.new(1, 0, 0, var3.Typography.TitleLarge.FontSize)
		}) else nil
	}
	local title = var1.title
	
	if title then
		title = react.createElement
		title = title(view, {
			tag = "row auto-y size-full-0 align-y-center ",
			LayoutOrder = 1
		}, {
			TitleText = react.createElement(text, {
				tag = "text-truncate-end text-align-x-left auto-xy shrink content-default",
				LayoutOrder = 1,
				RichText = true,
				fontStyle = var3.Typography.TitleLarge,
				Text = var1.title
			}),
			VerifiedBadge = var1.isVerified and react.createElement(text, {
				tag = "auto-xy content-default",
				LayoutOrder = 2,
				RichText = true,
				fontStyle = var3.Typography.TitleLarge,
				Text = verifiedBadgesModule.emoji.verified
			}),
			SubscriptionBadge = if fFlagEnableBlackbirdCheck and var1.isRobloxSubscriber == true then react.createElement(foundationModule.Icon, {
				LayoutOrder = 3,
				name = enums.IconName.RobloxPlus,
				size = enums.IconSize.Small,
				style = var3.Color.Content.Emphasis
			}) else nil
		})
	end
	t_6.Title = title
	t_4.Title = createElement_2(view, t_5, t_6)
	t_4.Subtitle = react.createElement(view, { tag = "row auto-y size-full-0", LayoutOrder = 2 }, {
		LoadingSkeleton = if var1.subtitle and var1.subtitle ~= "@" then nil else react.createElement(skeleton, {
			Size = UDim2.new(0.4, 0, 0, var3.Typography.BodySmall.FontSize)
		}),
		SubtitleText = var1.subtitle and (var1.subtitle ~= "@" and react.createElement(text, {
			tag = "text-truncate-end auto-xy text-align-x-left shrink content-default",
			LayoutOrder = 1,
			RichText = true,
			fontStyle = var3.Typography.BodySmall,
			Text = var1.subtitle
		})),
		TCTextLabel = var1.isTrustedConnection and (var1.subtitle and (var1.subtitle ~= "@" and react.createElement(text, {
			tag = "content-default auto-xy text-align-x-left",
			LayoutOrder = 2,
			fontStyle = var3.Typography.BodySmall,
			Text = " \226\128\162 " .. var9.trustedText
		})))
	})
	t_4.RelevancyContainer = react.createElement(view, {
		tag = "size-full-0 row auto-y gap-xsmall align-x-left align-y-center",
		LayoutOrder = 3
	}, {
		ContextualPresence = var1.relevancyInfo and (var1.relevancyInfo.text and react.createElement(playerContext, {
			layoutOrder = 2,
			fontStyle = var2.Font.CaptionBody,
			icon = icon,
			iconColor = iconColor,
			iconSize = UDim2.fromOffset(12, 12),
			iconTransparency = iconTransparency,
			text = if var1.relevancyInfo then var1.relevancyInfo.text else nil,
			textColorStyle = textDefault,
			onActivated = var1.openPlayerProfile,
			Selectable = if fixFriendsLandingTileGamepadSelection then false else nil
		}))
	})
	t_2.TextColumn = createElement_1(view, t_3, t_4)
	
	return createElement(view, t_1, t_2)
end
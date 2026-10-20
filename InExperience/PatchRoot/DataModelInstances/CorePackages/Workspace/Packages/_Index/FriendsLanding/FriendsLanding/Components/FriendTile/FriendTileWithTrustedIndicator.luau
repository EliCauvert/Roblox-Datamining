local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local React = DependenciesModule.React
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Llama = require(Parent.LuaSocialLibrariesDeps).llama
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local UIBlox = DependenciesModule.UIBlox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local PlayerTile = UIBlox.App.Tile.PlayerTile
local OpenTypeSupport = UIBlox.Utility.OpenTypeSupport
local PlayerContext = UIBlox.App.Indicator.PlayerContext
local _ = DependenciesModule.RoduxPresence.Enums.PresenceType
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Text = FoundationModule.Text
local Skeleton = FoundationModule.Skeleton
local Enums = FoundationModule.Enums
local StateLayerAffordance = Enums.StateLayerAffordance
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local config = {
	userPresence = nil,
	index = 1,
	openPlayerProfile = nil,
	buttons = nil,
	trustedConnection = false,
	isVerified = false
}

return function(p1)
	-- upvalues: Llama (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), React (copy), View (copy), StateLayerAffordance (copy), PlayerTile (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), Skeleton (copy), Text (copy), VerifiedBadgesModule (copy), FFlagEnableBlackbirdCheck (copy), FoundationModule (copy), Enums (copy), PlayerContext (copy)
	local JoinResult = Llama.Dictionary.join(config, p1 or {})
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
	})
	local Icon = nil
	local IconColor = nil
	local IconTransparency = nil
	local TextDefault = UseStyleResult.Theme.TextDefault
	
	if JoinResult.relevancyInfo then
		IconColor = JoinResult.relevancyInfo.iconColor
		Icon = JoinResult.relevancyInfo.icon
		IconTransparency = JoinResult.relevancyInfo.iconTransparency
	end
	return React.createElement(View, {
		tag = "col auto-xy size-0-0 gap-small",
		onActivated = JoinResult.openPlayerProfile,
		stateLayer = { affordance = StateLayerAffordance.None }
	}, {
		PlayerTile = React.createElement(View, {
			tag = "size-full-full aspect-1-1 bg-surface-100 clip",
			LayoutOrder = 1
		}, {
			React.createElement(PlayerTile, {
				title = "",
				subtitle = "",
				Selectable = false,
				tileSize = UDim2.fromScale(1, 1),
				thumbnail = JoinResult.user.thumbnail,
				onActivated = JoinResult.openPlayerProfile,
				forwardedRef = JoinResult.playerTileRef,
				buttons = JoinResult.buttons,
				openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			})
		}),
		TextColumn = React.createElement(View, {
			tag = "col size-full-0 auto-y gap-xxsmall",
			LayoutOrder = 2
		}, {
			Title = React.createElement(View, { tag = "auto-y size-full-0" }, {
				LoadingSkeleton = if JoinResult.title then nil else React.createElement(Skeleton, {
					Size = UDim2.new(1, 0, 0, UseTokensResult.Typography.TitleLarge.FontSize)
				}),
				Title = JoinResult.title and React.createElement(View, {
					tag = "row auto-y size-full-0 align-y-center ",
					LayoutOrder = 1
				}, {
					TitleText = React.createElement(Text, {
						tag = "text-truncate-end text-align-x-left auto-xy shrink content-default",
						LayoutOrder = 1,
						RichText = true,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						Text = JoinResult.title
					}),
					VerifiedBadge = JoinResult.isVerified and React.createElement(Text, {
						tag = "auto-xy content-default",
						LayoutOrder = 2,
						RichText = true,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						Text = VerifiedBadgesModule.emoji.verified
					}),
					SubscriptionBadge = if FFlagEnableBlackbirdCheck and JoinResult.isRobloxSubscriber == true then React.createElement(FoundationModule.Icon, {
						LayoutOrder = 3,
						name = Enums.IconName.RobloxPlus,
						size = Enums.IconSize.Small,
						style = UseTokensResult.Color.Content.Emphasis
					}) else nil
				})
			}),
			Subtitle = React.createElement(View, { tag = "row auto-y size-full-0", LayoutOrder = 2 }, {
				LoadingSkeleton = if JoinResult.subtitle and JoinResult.subtitle ~= "@" then nil else React.createElement(Skeleton, {
					Size = UDim2.new(0.4, 0, 0, UseTokensResult.Typography.BodySmall.FontSize)
				}),
				SubtitleText = JoinResult.subtitle and (JoinResult.subtitle ~= "@" and React.createElement(Text, {
					tag = "text-truncate-end auto-xy text-align-x-left shrink content-default",
					LayoutOrder = 1,
					RichText = true,
					fontStyle = UseTokensResult.Typography.BodySmall,
					Text = JoinResult.subtitle
				})),
				TCTextLabel = JoinResult.isTrustedConnection and (JoinResult.subtitle and (JoinResult.subtitle ~= "@" and React.createElement(Text, {
					tag = "content-default auto-xy text-align-x-left",
					LayoutOrder = 2,
					fontStyle = UseTokensResult.Typography.BodySmall,
					Text = " • " .. UseLocalizationResult.trustedText
				})))
			}),
			RelevancyContainer = React.createElement(View, {
				tag = "size-full-0 row auto-y gap-xsmall align-x-left align-y-center",
				LayoutOrder = 3
			}, {
				ContextualPresence = JoinResult.relevancyInfo and (JoinResult.relevancyInfo.text and React.createElement(PlayerContext, {
					layoutOrder = 2,
					Selectable = false,
					fontStyle = UseStyleResult.Font.CaptionBody,
					icon = Icon,
					iconColor = IconColor,
					iconSize = UDim2.fromOffset(12, 12),
					iconTransparency = IconTransparency,
					text = if JoinResult.relevancyInfo then JoinResult.relevancyInfo.text else nil,
					textColorStyle = TextDefault,
					onActivated = JoinResult.openPlayerProfile
				}))
			})
		})
	})
end
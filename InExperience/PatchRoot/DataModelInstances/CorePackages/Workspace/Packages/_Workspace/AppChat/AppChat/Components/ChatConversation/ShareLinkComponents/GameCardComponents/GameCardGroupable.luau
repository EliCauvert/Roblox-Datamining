local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local constantsModule = require(appChat.Constants)
local roundedVariantModule = require(appChat.Enums.RoundedVariant)
local text = foundationModule.Text
local skeleton = foundationModule.Skeleton
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local useAbbreviatedNumberLocalization = require(parent.Localization).Hooks.useAbbreviatedNumberLocalization
local gameCardThumbnailModule = require(script.Parent.GameCardThumbnail)
local t = {
	thumbnailAspectRatio = 1.777777777778,
	isRepliedTo = false,
	isIncoming = false,
	isPending = false,
	thumbnailRoundedVariant = roundedVariantModule.Top
}

function GameCardGroupable(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useAbbreviatedNumberLocalization (ref), useScaledValue (ref), constantsModule (ref), reactModule (ref), view (ref), gameCardThumbnailModule (ref), skeleton (ref), foundationModule (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useTokens()
	local var3 = useAbbreviatedNumberLocalization(var1.gamePlayerCount)
	
	return reactModule.createElement(view, { tag = "col auto-xy", LayoutOrder = var1.LayoutOrder }, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH), useScaledValue(constantsModule.GameCard.THUMBNAIL_HEIGHT))
		}, {
			Thumbnail = reactModule.createElement(gameCardThumbnailModule, {
				LayoutOrder = 1,
				gameThumbnail = var1.gameThumbnail,
				roundedVariant = var1.thumbnailRoundedVariant,
				aspectRatio = var1.thumbnailAspectRatio,
				onActivated = var1.onThumbnailActivated,
				Visible = not var1.isLoading
			})
		}),
		Footer = reactModule.createElement(view, {
			tag = "padding-medium",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var2.Size.Size_1600)
		}, {
			Skeleton = reactModule.createElement(view, {
				tag = "col size-full-full gap-xsmall",
				Visible = var1.isLoading
			}, {
				TitleSkeleton = reactModule.createElement(view, {
					tag = "grow-4",
					LayoutOrder = 1,
					Size = UDim2.new(0.9, 0, 0, 0)
				}, {
					reactModule.createElement(skeleton, {
						tag = "size-full-full",
						radius = foundationModule.Enums.Radius.Small
					})
				}),
				MetadataSkeleton = reactModule.createElement(view, {
					tag = "grow-3",
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, 0)
				}, {
					reactModule.createElement(skeleton, {
						tag = "size-full-full",
						radius = foundationModule.Enums.Radius.Small
					})
				})
			}),
			Content = reactModule.createElement(view, {
				tag = "row size-full-full gap-small items-center align-y-center flex-between",
				Visible = not var1.isLoading
			}, {
				TextContainer = reactModule.createElement(view, {
					tag = "col size-0-full fill align-y-center radius-small",
					LayoutOrder = 1,
					onActivated = var1.onMetadataActivated,
					Selectable = var1.onMetadataActivated ~= nil
				}, {
					Title = if var1.gameName then reactModule.createElement(text, {
						tag = "auto-y size-full-500 text-title-medium text-align-x-left text-truncate-split",
						LayoutOrder = 1,
						Text = var1.gameName,
						textStyle = if var1.isRepliedTo then var2.Color.Content.Default else var2.Color.Content.Emphasis
					}) else nil,
					Metadata = if var1.gameRating or var3 then reactModule.createElement(view, {
						tag = "row auto-y size-full-500 gap-medium align-y-center",
						LayoutOrder = 2
					}, {
						RatingContainer = if var1.gameRating then reactModule.createElement(view, {
							tag = "auto-xy row gap-xsmall align-y-center",
							LayoutOrder = 1
						}, {
							RatingIcon = reactModule.createElement(icon, {
								LayoutOrder = 1,
								name = iconName.ThumbUp,
								size = iconSize.Small
							}),
							Rating = reactModule.createElement(text, {
								tag = "auto-xy text-body-small content-default text-truncate-split",
								LayoutOrder = 2,
								Text = var1.gameRating
							})
						}) else nil,
						PlayerCountContainer = if var3 then reactModule.createElement(view, {
							tag = "auto-xy row gap-xsmall align-y-center",
							LayoutOrder = 2
						}, {
							PlayerCountIcon = reactModule.createElement(icon, {
								LayoutOrder = 1,
								name = iconName.PersonPlay,
								size = iconSize.Small
							}),
							PlayerCount = reactModule.createElement(text, {
								tag = "auto-xy text-body-small content-default text-truncate-split",
								LayoutOrder = 2,
								Text = var3
							})
						}) else nil
					}) else nil
				}),
				PlayButton = if var1.onPlayButtonActivated then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					icon = iconName.PlayLarge,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var1.onPlayButtonActivated
				}) else nil
			})
		})
	})
end

return reactModule.memo(GameCardGroupable)
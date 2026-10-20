local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ConstantsModule = require(AppChat.Constants)
local Text = FoundationModule.Text
local Skeleton = FoundationModule.Skeleton
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseAbbreviatedNumberLocalizationFunction = require(Parent.Localization).Hooks.useAbbreviatedNumberLocalization
local GameCardThumbnailModule = require(script.Parent.GameCardThumbnail)
local config = {
	thumbnailAspectRatio = 1.7777777777777777,
	cornerRadius = 20,
	isRepliedTo = false,
	isIncoming = false,
	isPending = false,
	thumbnailRoundedVariant = require(AppChat.Enums.RoundedVariant).Top
}

function GameCardGroupable(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseAbbreviatedNumberLocalizationFunction (copy), UseScaledValueFunction (copy), ConstantsModule (copy), ReactModule (copy), View (copy), GameCardThumbnailModule (copy), Skeleton (copy), FoundationModule (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(UnionResult.gamePlayerCount)
	local Default = if UnionResult.isRepliedTo then UseTokensResult.Color.Content.Default else UseTokensResult.Color.Content.Emphasis
	
	return ReactModule.createElement(View, {
		tag = "col auto-xy",
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		ThumbnailContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_WIDTH), UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_HEIGHT))
		}, {
			Thumbnail = ReactModule.createElement(GameCardThumbnailModule, {
				LayoutOrder = 1,
				gameThumbnail = UnionResult.gameThumbnail,
				cornerRadius = UnionResult.cornerRadius,
				roundedVariant = UnionResult.thumbnailRoundedVariant,
				aspectRatio = UnionResult.thumbnailAspectRatio,
				onActivated = UnionResult.onThumbnailActivated,
				Visible = not UnionResult.isLoading
			})
		}),
		Footer = ReactModule.createElement(View, {
			tag = "padding-medium",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1600)
		}, {
			Skeleton = ReactModule.createElement(View, {
				tag = "col size-full-full gap-xsmall",
				Visible = UnionResult.isLoading
			}, {
				TitleSkeleton = ReactModule.createElement(View, {
					tag = "grow-4",
					LayoutOrder = 1,
					Size = UDim2.new(0.9, 0, 0, 0)
				}, {
					ReactModule.createElement(Skeleton, {
						tag = "size-full-full",
						radius = FoundationModule.Enums.Radius.Small
					})
				}),
				MetadataSkeleton = ReactModule.createElement(View, {
					tag = "grow-3",
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, 0)
				}, {
					ReactModule.createElement(Skeleton, {
						tag = "size-full-full",
						radius = FoundationModule.Enums.Radius.Small
					})
				})
			}),
			Content = ReactModule.createElement(View, {
				tag = "row size-full-full gap-small items-center align-y-center flex-between",
				Visible = not UnionResult.isLoading
			}, {
				TextContainer = ReactModule.createElement(View, {
					tag = "col size-0-full fill align-y-center radius-small",
					LayoutOrder = 1,
					onActivated = UnionResult.onMetadataActivated,
					Selectable = UnionResult.onMetadataActivated ~= nil
				}, {
					Title = if UnionResult.gameName then ReactModule.createElement(Text, {
						tag = "auto-y size-full-500 text-title-medium text-align-x-left text-truncate-split",
						LayoutOrder = 1,
						Text = UnionResult.gameName,
						textStyle = Default
					}) else nil,
					Metadata = if UnionResult.gameRating or UseAbbreviatedNumberLocalizationResult then ReactModule.createElement(View, {
						tag = "row auto-y size-full-500 gap-medium align-y-center",
						LayoutOrder = 2
					}, {
						RatingContainer = if UnionResult.gameRating then ReactModule.createElement(View, {
							tag = "auto-xy row gap-xsmall align-y-center",
							LayoutOrder = 1
						}, {
							RatingIcon = ReactModule.createElement(Icon, {
								LayoutOrder = 1,
								name = IconName.ThumbUp,
								size = IconSize.Small
							}),
							Rating = ReactModule.createElement(Text, {
								tag = "auto-xy text-body-small content-default text-truncate-split",
								LayoutOrder = 2,
								Text = UnionResult.gameRating
							})
						}) else nil,
						PlayerCountContainer = if UseAbbreviatedNumberLocalizationResult then ReactModule.createElement(View, {
							tag = "auto-xy row gap-xsmall align-y-center",
							LayoutOrder = 2
						}, {
							PlayerCountIcon = ReactModule.createElement(Icon, {
								LayoutOrder = 1,
								name = IconName.PersonPlay,
								size = IconSize.Small
							}),
							PlayerCount = ReactModule.createElement(Text, {
								tag = "auto-xy text-body-small content-default text-truncate-split",
								LayoutOrder = 2,
								Text = UseAbbreviatedNumberLocalizationResult
							})
						}) else nil
					}) else nil
				}),
				PlayButton = if UnionResult.onPlayButtonActivated then ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					icon = IconName.PlayLarge,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = UnionResult.onPlayButtonActivated
				}) else nil
			})
		})
	})
end

return ReactModule.memo(GameCardGroupable)
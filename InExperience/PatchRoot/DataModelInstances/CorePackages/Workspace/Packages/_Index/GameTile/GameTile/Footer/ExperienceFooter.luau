local gameTile = script:FindFirstAncestor("GameTile")
local coPlayFooterModule = require(gameTile.Footer.CoPlayFooter)
local usePlayerCountTextModule = require(gameTile.Footer.usePlayerCountText)
local _ = require(gameTile.GameTileTypes)
local parent = gameTile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local statGroup = UIBloxModule.App.Indicator.StatGroup
local textFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.TextFooter
local coPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local socialProofFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.SocialProofFooter
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local colors = require(parent.Style).Colors
local useDesignTokens = require(parent.Style).useDesignTokens
local sponsoredTooltipHover = require(parent.Ads).SponsoredTooltipHover
local argCheckModule = require(parent.ArgCheck)
local getUserInputIsSelectionOnlyModule = require(gameTile.Footer.getUserInputIsSelectionOnly)
local uDim2 = UDim2.fromScale(1, 1)

return function(p1)
	-- upvalues: argCheckModule (ref), usePlayerCountTextModule (ref), useStyle (ref), useDesignTokens (ref), useLocalization (ref), getUserInputIsSelectionOnlyModule (ref), reactModule (ref), styledTextLabel (ref), sponsoredTooltipHover (ref), tooltipOrientation (ref), uDim2 (ref), coPlayFooter (ref), colors (ref), coPlayFooterModule (ref), textFooter (ref), socialProofFooter (ref), statGroup (ref)
	if p1.automaticSize then
		argCheckModule.isNotNil(p1.size, "If props.automaticSize is defined, props.size should also be defined.  Otherwise size falls back to a 1, 1 scale for this component.")
	end
	local isShowSponsoredLabel = p1.isSponsored and p1.isShowSponsoredLabel
	local isStatsOnly = p1.isStatsOnly
	local isPlayable = p1.isPlayable
	local requiresPurchase = p1.requiresPurchase
	local rating = p1.rating or ""
	local playingCount = p1.playingCount or 0
	local coPlayFriends = p1.coPlayFriends
	local showAgeRating = p1.showAgeRating
	local ageRatingTextLabel = p1.ageRatingTextLabel
	local useExperienceTileMetadata = p1.useExperienceTileMetadata
	local onActivateSponsoredTooltip = p1.onActivateSponsoredTooltip
	local var1 = usePlayerCountTextModule(playingCount)
	local var2 = useStyle()
	local font = var2.Font
	local theme = var2.Theme
	local global = useDesignTokens().Global
	local var3 = useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		notPlayableText = "Feature.ExperienceDetails.Label.NotPlayable",
		ageRatingText = ageRatingTextLabel or nil,
		friendsText = if useExperienceTileMetadata then "CommonUI.Features.Label.Friends" else nil
	})
	
	if isStatsOnly then
		if isShowSponsoredLabel then
			local var4 = getUserInputIsSelectionOnlyModule()
			
			return if useExperienceTileMetadata then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var2.Tokens.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = var2.Tokens.Color.Shift.Shift_200.Transparency
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				Text = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					Text = var3.sponsoredText,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = var2.Font.CaptionHeader.Font,
					TextSize = var2.Font.BaseSize * var2.Font.CaptionHeader.RelativeSize,
					TextColor3 = var2.Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = var2.Tokens.Color.Content.Emphasis.Transparency
				}),
				SponsoredTooltip = reactModule.createElement(sponsoredTooltipHover, {
					layoutOrder = 2,
					supportTenFootUi = true,
					tooltipOrientation = tooltipOrientation.Bottom,
					onActivateTooltip = onActivateSponsoredTooltip,
					size = UDim2.new(0, 16, 0, 16),
					color = var2.Tokens.Color.Content.Emphasis.Color3,
					selectable = var4
				})
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Tokens.Radius.Small) })
			}) else reactModule.createElement("Frame", {
				Size = p1.size or uDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				BackgroundTransparency = theme.UIDefault.Transparency,
				BackgroundColor3 = theme.UIDefault.Color,
				AutomaticSize = p1.automaticSize
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
				SponsoredLabel = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 4)
					}),
					SponsoredText = reactModule.createElement(styledTextLabel, {
						lineHeight = 1,
						richText = false,
						layoutOrder = 1,
						colorStyle = theme.TextEmphasis,
						fontStyle = font.CaptionHeader,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Center,
						automaticSize = Enum.AutomaticSize.X,
						size = UDim2.new(0, 0, 1, 0),
						text = var3.sponsoredText,
						textTruncate = Enum.TextTruncate.AtEnd
					}),
					SponsoredTooltip = reactModule.createElement(sponsoredTooltipHover, {
						layoutOrder = 2,
						tooltipOrientation = tooltipOrientation.Bottom,
						onActivateTooltip = onActivateSponsoredTooltip,
						size = UDim2.new(0, 16, 0, 16),
						color = theme.TextEmphasis.Color,
						selectable = var4
					})
				})
			})
		elseif coPlayFriends and next(coPlayFriends) then
			return if useExperienceTileMetadata then reactModule.createElement(coPlayFooter, {
				showEmphasisBorder = true,
				faceGroupCount = 2,
				users = coPlayFriends,
				labelText = var3.friendsText,
				styleProps = {
					badgeBorderWidth = 3,
					faceWidth = global.Size_250,
					faceHeight = global.Size_250,
					faceGroupGap = -global.Space_75,
					containerGap = global.Space_50,
					badgeHeight = global.Size_250,
					fontStyle = var2.Font.CaptionHeader,
					badgeSpacingLeading = global.Space_50,
					badgeSpacingTrailing = global.Space_50,
					badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
					badgeContentColor = { Transparency = 0, Color = colors.White }
				}
			}) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.size or uDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				AutomaticSize = p1.automaticSize
			}, {
				CoPlayFooter = reactModule.createElement(coPlayFooterModule, { friends = coPlayFriends })
			})
		elseif showAgeRating then
			local var5 = if p1.localizedAgeRatingTextLabel then p1.localizedAgeRatingTextLabel else var3.ageRatingText
			
			return if useExperienceTileMetadata then reactModule.createElement(textFooter, { text = var5 }) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.size or uDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				AutomaticSize = p1.automaticSize
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 2),
					PaddingRight = UDim.new(0, 0),
					PaddingBottom = UDim.new(0, 2),
					PaddingLeft = UDim.new(0, 0)
				}),
				AgeRatingLabel = reactModule.createElement(styledTextLabel, {
					lineHeight = 1,
					richText = false,
					colorStyle = theme.TextEmphasis,
					fontStyle = font.CaptionHeader,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					size = UDim2.new(1, 0, 2, 0),
					text = var5,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			})
		end
		return if p1.showFriendActivity and not useExperienceTileMetadata then reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = p1.size or uDim2,
			TextColor3 = theme.TextMuted.Color,
			Font = font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Text = p1.friendActivityTitle,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextSize = font.BaseSize * font.Body.RelativeSize,
			TextTransparency = theme.TextMuted.Transparency
		}) elseif isPlayable == false and not requiresPurchase then if useExperienceTileMetadata then reactModule.createElement(textFooter, { text = var3.notPlayableText }) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.size or uDim2,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			AutomaticSize = p1.automaticSize
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
			PlayabilityLabel = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				richText = false,
				colorStyle = theme.TextMuted,
				fontStyle = font.CaptionHeader,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				size = UDim2.new(1, 0, 1, 0),
				text = var3.notPlayableText,
				textTruncate = Enum.TextTruncate.AtEnd
			})
		}) elseif useExperienceTileMetadata then reactModule.createElement(socialProofFooter, { ratingText = rating, playingText = var1 }) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.size or uDim2,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			AutomaticSize = p1.automaticSize
		}, {
			ExperienceStats = reactModule.createElement(statGroup, { ratingText = rating, playingText = var1 })
		})
	end
end
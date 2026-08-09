local gameTile = script:FindFirstAncestor("GameTile")
local coPlayFooterModule = require(gameTile.Footer.CoPlayFooter)
local usePlayerCountTextModule = require(gameTile.Footer.usePlayerCountText)
local _ = require(gameTile.GameTileTypes)
local parent = gameTile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
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

return function(p0) --[[ line: 30 ]]
	-- upvalues: argCheckModule (ref), usePlayerCountTextModule (ref), useStyle (ref), useDesignTokens (ref), useLocalization (ref), getUserInputIsSelectionOnlyModule (ref), reactModule (ref), styledTextLabel (ref), sponsoredTooltipHover (ref), tooltipOrientation (ref), fFlagRenameDeprecatedUIBloxTokens (ref), uDim2 (ref), coPlayFooter (ref), colors (ref), coPlayFooterModule (ref), textFooter (ref), socialProofFooter (ref), statGroup (ref)
	if p0.automaticSize then
		argCheckModule.isNotNil(p0.size, "If props.automaticSize is defined, props.size should also be defined.  Otherwise size falls back to a 1, 1 scale for this component.")
	end
	local isShowSponsoredLabel = p0.isSponsored and p0.isShowSponsoredLabel
	local isStatsOnly = p0.isStatsOnly
	local isPlayable = p0.isPlayable
	local requiresPurchase = p0.requiresPurchase
	local rating = p0.rating or ""
	local playingCount = p0.playingCount or 0
	local coPlayFriends = p0.coPlayFriends
	local showAgeRating = p0.showAgeRating
	local ageRatingTextLabel = p0.ageRatingTextLabel
	local useExperienceTileMetadata = p0.useExperienceTileMetadata
	local onActivateSponsoredTooltip = p0.onActivateSponsoredTooltip
	local var11 = usePlayerCountTextModule(playingCount)
	local var12 = useStyle()
	local font = var12.Font
	local theme = var12.Theme
	local global = useDesignTokens().Global
	local var13 = useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		notPlayableText = "Feature.ExperienceDetails.Label.NotPlayable",
		ageRatingText = ageRatingTextLabel or nil,
		friendsText = if useExperienceTileMetadata then "CommonUI.Features.Label.Friends" else nil
	})
	
	if isStatsOnly then
		if isShowSponsoredLabel then
			local var14 = getUserInputIsSelectionOnlyModule()
			
			return if useExperienceTileMetadata then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Color.Shift.Shift_200 else var12.Tokens.Semantic.Color.Ui.Default).Color3,
				BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Color.Shift.Shift_200 else var12.Tokens.Semantic.Color.Ui.Default).Transparency
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
					Text = var13.sponsoredText,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = var12.Font.CaptionHeader.Font,
					TextSize = var12.Font.BaseSize * var12.Font.CaptionHeader.RelativeSize,
					TextColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Color.Content.Emphasis else var12.Tokens.Semantic.Color.Text.Emphasis).Color3,
					TextTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Color.Content.Emphasis else var12.Tokens.Semantic.Color.Text.Emphasis).Transparency
				}),
				SponsoredTooltip = reactModule.createElement(sponsoredTooltipHover, {
					layoutOrder = 2,
					supportTenFootUi = true,
					tooltipOrientation = tooltipOrientation.Bottom,
					onActivateTooltip = onActivateSponsoredTooltip,
					size = UDim2.new(0, 16, 0, 16),
					color = (if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Color.Content.Emphasis else var12.Tokens.Semantic.Color.Text.Emphasis).Color3,
					selectable = var14
				})
			}, {
				UICorner = reactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var12.Tokens.Radius.Small else var12.Tokens.Semantic.Radius.Small)
				})
			}) else reactModule.createElement("Frame", {
				Size = p0.size or uDim2,
				Position = p0.position,
				AnchorPoint = p0.anchorPoint,
				LayoutOrder = p0.layoutOrder,
				BackgroundTransparency = theme.UIDefault.Transparency,
				BackgroundColor3 = theme.UIDefault.Color,
				AutomaticSize = p0.automaticSize
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
						text = var13.sponsoredText,
						textTruncate = Enum.TextTruncate.AtEnd
					}),
					SponsoredTooltip = reactModule.createElement(sponsoredTooltipHover, {
						layoutOrder = 2,
						tooltipOrientation = tooltipOrientation.Bottom,
						onActivateTooltip = onActivateSponsoredTooltip,
						size = UDim2.new(0, 16, 0, 16),
						color = theme.TextEmphasis.Color,
						selectable = var14
					})
				})
			})
		elseif coPlayFriends and next(coPlayFriends) then
			return if useExperienceTileMetadata then reactModule.createElement(coPlayFooter, {
				showEmphasisBorder = true,
				faceGroupCount = 2,
				users = coPlayFriends,
				labelText = var13.friendsText,
				styleProps = {
					badgeBorderWidth = 3,
					faceWidth = global.Size_250,
					faceHeight = global.Size_250,
					faceGroupGap = -global.Space_75,
					containerGap = global.Space_50,
					badgeHeight = global.Size_250,
					fontStyle = var12.Font.CaptionHeader,
					badgeSpacingLeading = global.Space_50,
					badgeSpacingTrailing = global.Space_50,
					badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
					badgeContentColor = { Transparency = 0, Color = colors.White }
				}
			}) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p0.size or uDim2,
				Position = p0.position,
				AnchorPoint = p0.anchorPoint,
				LayoutOrder = p0.layoutOrder,
				AutomaticSize = p0.automaticSize
			}, {
				CoPlayFooter = reactModule.createElement(coPlayFooterModule, { friends = coPlayFriends })
			})
		elseif showAgeRating then
			local var15 = if p0.localizedAgeRatingTextLabel then p0.localizedAgeRatingTextLabel else var13.ageRatingText
			
			return if useExperienceTileMetadata then reactModule.createElement(textFooter, { text = var15 }) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p0.size or uDim2,
				Position = p0.position,
				AnchorPoint = p0.anchorPoint,
				LayoutOrder = p0.layoutOrder,
				AutomaticSize = p0.automaticSize
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
					text = var15,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			})
		end
		return if p0.showFriendActivity and not useExperienceTileMetadata then reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = p0.size or uDim2,
			TextColor3 = theme.TextMuted.Color,
			Font = font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Text = p0.friendActivityTitle,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextSize = font.BaseSize * font.Body.RelativeSize,
			TextTransparency = theme.TextMuted.Transparency
		}) elseif isPlayable == false and not requiresPurchase then if useExperienceTileMetadata then reactModule.createElement(textFooter, { text = var13.notPlayableText }) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p0.size or uDim2,
			Position = p0.position,
			AnchorPoint = p0.anchorPoint,
			LayoutOrder = p0.layoutOrder,
			AutomaticSize = p0.automaticSize
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
				text = var13.notPlayableText,
				textTruncate = Enum.TextTruncate.AtEnd
			})
		}) elseif useExperienceTileMetadata then reactModule.createElement(socialProofFooter, { ratingText = rating, playingText = var11 }) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p0.size or uDim2,
			Position = p0.position,
			AnchorPoint = p0.anchorPoint,
			LayoutOrder = p0.layoutOrder,
			AutomaticSize = p0.automaticSize
		}, {
			ExperienceStats = reactModule.createElement(statGroup, { ratingText = rating, playingText = var11 })
		})
	end
end
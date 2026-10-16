local GameTile = script:FindFirstAncestor("GameTile")
local CoPlayFooterModule = require(GameTile.Footer.CoPlayFooter)
local UsePlayerCountTextModule = require(GameTile.Footer.usePlayerCountText)
local _ = require(GameTile.GameTileTypes)
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local StatGroup = UIBloxModule.App.Indicator.StatGroup
local TextFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.TextFooter
local CoPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local SocialProofFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.SocialProofFooter
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Colors = require(Parent.Style).Colors
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local SponsoredTooltipHover = require(Parent.Ads).SponsoredTooltipHover
local ArgCheckModule = require(Parent.ArgCheck)
local GetUserInputIsSelectionOnlyModule = require(GameTile.Footer.getUserInputIsSelectionOnly)
local _UDim2 = UDim2.fromScale(1, 1)

return function(p1) --[[ Line: 31 ]]
	-- upvalues: ArgCheckModule (copy), UsePlayerCountTextModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), GetUserInputIsSelectionOnlyModule (copy), ReactModule (copy), StyledTextLabel (copy), SponsoredTooltipHover (copy), TooltipOrientation (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), _UDim2 (copy), CoPlayFooter (copy), Colors (copy), CoPlayFooterModule (copy), TextFooter (copy), SocialProofFooter (copy), StatGroup (copy)
	if p1.automaticSize then
		ArgCheckModule.isNotNil(p1.size, "If props.automaticSize is defined, props.size should also be defined.  Otherwise size falls back to a 1, 1 scale for this component.")
	end
	local IsShowSponsoredLabel = p1.isSponsored and p1.isShowSponsoredLabel
	local IsStatsOnly = p1.isStatsOnly
	local IsPlayable = p1.isPlayable
	local RequiresPurchase = p1.requiresPurchase
	local Rating = p1.rating or ""
	local CoPlayFriends = p1.coPlayFriends
	local ShowAgeRating = p1.showAgeRating
	local AgeRatingTextLabel = p1.ageRatingTextLabel
	local UseExperienceTileMetadata = p1.useExperienceTileMetadata
	local OnActivateSponsoredTooltip = p1.onActivateSponsoredTooltip
	local UsePlayerCountTextModuleResult = UsePlayerCountTextModule(p1.playingCount or 0)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local Size = UseDesignTokensFunction().Size
	local UseLocalizationResult = UseLocalizationFunction({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		notPlayableText = "Feature.ExperienceDetails.Label.NotPlayable",
		ageRatingText = AgeRatingTextLabel or nil,
		friendsText = if UseExperienceTileMetadata then "CommonUI.Features.Label.Friends" else nil
	})
	
	if not IsStatsOnly then
		if IsShowSponsoredLabel then
			local UserInputIsSelectionOnlyModule = GetUserInputIsSelectionOnlyModule()
			local Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				SponsoredText = ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					richText = false,
					layoutOrder = 1,
					colorStyle = Theme.TextEmphasis,
					fontStyle = UseStyleResultFont.CaptionHeader,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.X,
					size = UDim2.new(0, 0, 1, 0),
					text = UseLocalizationResult.sponsoredText,
					textTruncate = Enum.TextTruncate.AtEnd
				}),
				SponsoredTooltip = ReactModule.createElement(SponsoredTooltipHover, {
					layoutOrder = 2,
					tooltipOrientation = TooltipOrientation.Bottom,
					onActivateTooltip = OnActivateSponsoredTooltip,
					size = UDim2.new(0, 16, 0, 16),
					color = Theme.TextEmphasis.Color,
					selectable = UserInputIsSelectionOnlyModule
				})
			})
			
			return if UseExperienceTileMetadata then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = UseStyleResult.Tokens.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = UseStyleResult.Tokens.Color.Shift.Shift_200.Transparency
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				Text = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					Text = UseLocalizationResult.sponsoredText,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionHeader.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.CaptionLarge.Font) else nil,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
					TextColor3 = UseStyleResult.Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = UseStyleResult.Tokens.Color.Content.Emphasis.Transparency
				}),
				SponsoredTooltip = ReactModule.createElement(SponsoredTooltipHover, {
					layoutOrder = 2,
					supportTenFootUi = true,
					tooltipOrientation = TooltipOrientation.Bottom,
					onActivateTooltip = OnActivateSponsoredTooltip,
					size = UDim2.new(0, 16, 0, 16),
					color = UseStyleResult.Tokens.Color.Content.Emphasis.Color3,
					selectable = UserInputIsSelectionOnlyModule
				})
			}, {
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, UseStyleResult.Tokens.Radius.Small)
				})
			}) else ReactModule.createElement("Frame", {
				Size = p1.size or _UDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				BackgroundTransparency = Theme.UIDefault.Transparency,
				BackgroundColor3 = Theme.UIDefault.Color,
				AutomaticSize = p1.automaticSize
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
				SponsoredLabel = Frame
			})
		elseif CoPlayFriends and next(CoPlayFriends) then
			return if UseExperienceTileMetadata then ReactModule.createElement(CoPlayFooter, {
				showEmphasisBorder = true,
				faceGroupCount = 2,
				users = CoPlayFriends,
				labelText = UseLocalizationResult.friendsText,
				styleProps = {
					badgeBorderWidth = 3,
					faceWidth = Size.Size_500,
					faceHeight = Size.Size_500,
					faceGroupGap = -Size.Size_150,
					containerGap = Size.Size_100,
					badgeHeight = Size.Size_500,
					fontStyle = UseStyleResult.Font.CaptionHeader,
					badgeSpacingLeading = Size.Size_100,
					badgeSpacingTrailing = Size.Size_100,
					badgeBackgroundColor = { Transparency = 0, Color = Colors.Smoke },
					badgeContentColor = { Transparency = 0, Color = Colors.White }
				}
			}) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.size or _UDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				AutomaticSize = p1.automaticSize
			}, {
				CoPlayFooter = ReactModule.createElement(CoPlayFooterModule, { friends = CoPlayFriends })
			})
		elseif ShowAgeRating then
			local LocalizedAgeRatingTextLabel = if p1.localizedAgeRatingTextLabel then p1.localizedAgeRatingTextLabel else UseLocalizationResult.ageRatingText
			
			return if UseExperienceTileMetadata then ReactModule.createElement(TextFooter, { text = LocalizedAgeRatingTextLabel }) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.size or _UDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				AutomaticSize = p1.automaticSize
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 2),
					PaddingRight = UDim.new(0, 0),
					PaddingBottom = UDim.new(0, 2),
					PaddingLeft = UDim.new(0, 0)
				}),
				AgeRatingLabel = ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					richText = false,
					colorStyle = Theme.TextEmphasis,
					fontStyle = UseStyleResultFont.CaptionHeader,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					size = UDim2.new(1, 0, 2, 0),
					text = LocalizedAgeRatingTextLabel,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			})
		elseif p1.showFriendActivity and not UseExperienceTileMetadata then
			local BodyFont = UseStyleResultFont.Body.Font
			
			return ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = p1.size or _UDim2,
				TextColor3 = Theme.TextMuted.Color,
				Font = if FoundationFontFaceMigration then nil else BodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				Text = p1.friendActivityTitle,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
				TextTransparency = Theme.TextMuted.Transparency
			})
		elseif IsPlayable == false and not RequiresPurchase then
			return if UseExperienceTileMetadata then ReactModule.createElement(TextFooter, { text = UseLocalizationResult.notPlayableText }) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.size or _UDim2,
				Position = p1.position,
				AnchorPoint = p1.anchorPoint,
				LayoutOrder = p1.layoutOrder,
				AutomaticSize = p1.automaticSize
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
				PlayabilityLabel = ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					richText = false,
					colorStyle = Theme.TextMuted,
					fontStyle = UseStyleResultFont.CaptionHeader,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = UseLocalizationResult.notPlayableText,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			})
		end
	end
	return if UseExperienceTileMetadata then ReactModule.createElement(SocialProofFooter, {
		ratingText = Rating,
		playingText = UsePlayerCountTextModuleResult
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size or _UDim2,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = p1.automaticSize
	}, {
		ExperienceStats = ReactModule.createElement(StatGroup, {
			ratingText = Rating,
			playingText = UsePlayerCountTextModuleResult
		})
	})
end
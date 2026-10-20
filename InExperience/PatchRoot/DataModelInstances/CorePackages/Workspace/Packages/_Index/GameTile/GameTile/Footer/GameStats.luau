local GameTile = script:FindFirstAncestor("GameTile")
local GridTileGameStatsModule = require(GameTile.Footer.GridTileGameStats)
local GridTileIconTextFooterModule = require(GameTile.Footer.GridTileIconTextFooter)
local GetGameStatsRatingPercentageTextModule = require(GameTile.Footer.getGameStatsRatingPercentageText)
local UsePlayerCountTextModule = require(GameTile.Footer.usePlayerCountText)
local GetUserInputIsSelectionOnlyModule = require(GameTile.Footer.getUserInputIsSelectionOnly)
local Parent = GameTile.Parent
local RoactModule = require(Parent.Roact)
local Colors = require(Parent.Style).Colors
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local Interactable = UIBloxModule.Core.Control.Interactable
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local SponsoredTooltipHover = require(Parent.Ads).SponsoredTooltipHover
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppGenreRatingFooter = require(Parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local IconsStatusGamesRatingSmall = Images["icons/status/games/rating_small"]
local IconsStatusGamesPeoplePlayingSmall = Images["icons/status/games/people-playing_small"]
local GameStats = RoactModule.PureComponent:extend("GameStats")
local Callback = if FFlagLuaAppGenreRatingFooter then nil else function(p1: number, p2: number): string
	local v1 = "--"
	
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	if p2 == nil or p2 < 0 then
		p2 = 0
	end
	local v2 = p1 + p2
	
	if v2 > 0 then
		v1 = tostring((math.floor(p1 / v2 * 100)))
	end
	return v1
end

function GameStats.renderSponsored(p1, p2)
	-- upvalues: RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), SponsoredTooltipHover (copy), TooltipOrientation (copy), GetUserInputIsSelectionOnlyModule (copy), Interactable (copy), WithLocalizationFunction (copy)
	local Theme = p2.Theme
	local _Font = p2.Font
	local Body = if p1.props.useLargerFont then _Font.Body else _Font.CaptionHeader
	local ScaledRelativeSize = Body.RelativeSize * _Font.BaseSize
	
	return WithLocalizationFunction({ sponsoredText = "Feature.GamePage.Label.Sponsored" })(function(p3)
		-- upvalues: RoactModule (upval), ScaledRelativeSize (copy), Theme (copy), FoundationFontFaceMigration (upval), Body (copy), NormalizeFontFaceFunction (upval), p1 (copy), p2 (copy), SponsoredTooltipHover (upval), TooltipOrientation (upval), GetUserInputIsSelectionOnlyModule (upval), Interactable (upval)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, (math.ceil(ScaledRelativeSize))),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme.UIDefault.Color,
			BackgroundTransparency = Theme.UIDefault.Transparency
		}, {
			SponsoredBlock = RoactModule.createElement(Interactable, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				onStateChanged = function() end,
				[RoactModule.Event.Activated] = p1.props.onActivateSponsoredTooltip
			}, {
				SponsoredBlockFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 4)
					}),
					SponsoredText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						TextSize = ScaledRelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						Font = if FoundationFontFaceMigration then nil else Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(if p1.props.useLargerFont then p2.Tokens.Typography.BodyLarge.Font else p2.Tokens.Typography.CaptionLarge.Font) else nil,
						Text = p3.sponsoredText,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					SponsoredTooltip = RoactModule.createElement(SponsoredTooltipHover, {
						layoutOrder = 2,
						tooltipOrientation = TooltipOrientation.Bottom,
						onActivateTooltip = p1.props.onActivateSponsoredTooltip,
						size = UDim2.new(0, 16, 0, 16),
						color = Theme.TextEmphasis.Color,
						selectable = GetUserInputIsSelectionOnlyModule()
					})
				})
			})
		})
	end)
end

function GameStats.renderGameStats(p1, p2, Props, p3)
	-- upvalues: FFlagLuaAppGenreRatingFooter (copy), GetGameStatsRatingPercentageTextModule (copy), Callback (ref), RoactModule (copy), GridTileGameStatsModule (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), WithLocalizationFunction (copy), GridTileIconTextFooterModule (copy), Images (copy)
	local Stats = Props.stats
	local GameStatsRatingPercentageTextModule = if FFlagLuaAppGenreRatingFooter then GetGameStatsRatingPercentageTextModule(Stats.totalUpVotes, Stats.totalDownVotes) else Callback(Stats.totalUpVotes, Stats.totalDownVotes)
	
	if Stats.playerCount == nil then
		return WithLocalizationFunction({
			longRatingText = {
				"Feature.GameDetails.RatingPercentOnly",
				percentRating = GameStatsRatingPercentageTextModule
			}
		})(function(p4)
			-- upvalues: RoactModule (upval), GridTileIconTextFooterModule (upval), Images (upval), p1 (copy), Props (copy)
			return RoactModule.createElement(GridTileIconTextFooterModule, {
				icon = Images["icons/status/games/rating_small"],
				text = p4.longRatingText,
				styleProps = { iconSize = 15, padding = 4 },
				useLargerFont = p1.props.useLargerFont,
				isUnifiedGameTile = Props.isUnifiedGameTile
			})
		end)
	end
	if Stats.totalUpVotes + Stats.totalDownVotes > 0 then
		GameStatsRatingPercentageTextModule ..= "%"
	end
	return if Props.isGridTile or Props.isUnifiedGameTile then RoactModule.createElement(GridTileGameStatsModule, {
		playerCountText = Props.playerCountText,
		ratingText = GameStatsRatingPercentageTextModule,
		useLargerFont = p1.props.useLargerFont,
		isUnifiedGameTile = Props.isUnifiedGameTile,
		gameTileLayoutType = Props.gameTileLayoutType,
		LayoutOrder = p1.props.LayoutOrder,
		compactMetadataFormat = Props.compactMetadataFormat,
		hideRating = if FFlagLuaAppNarrowTileHideRating then Props.hideRating else nil,
		hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then Props.hidePlayerCount else nil
	}) else p1:renderFullGameStats(p2, Props, GameStatsRatingPercentageTextModule, p3)
end

function GameStats:renderFullGameStats(p1, p2, Text, p3)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), IconsStatusGamesRatingSmall (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), IconsStatusGamesPeoplePlayingSmall (copy)
	local PlayerCountText = if p2.stats.playerCount then p2.playerCountText else nil
	local Theme = p1.Theme
	local _Font = p1.Font
	local CaptionSubHeaderFont = _Font.CaptionSubHeader.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.CaptionSubHeader.RelativeSize
	local NewScaledBaseSize = ScaledBaseSize + p1.Tokens.Size.Size_150
	local Smallest = math.min(math.ceil(ScaledBaseSize) + (p3 or 0), NewScaledBaseSize)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		VoteIcon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.125, 0, 0, Smallest),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Image = IconsStatusGamesRatingSmall,
			ImageColor3 = Theme.TextDefault.Color,
			ImageTransparency = Theme.TextDefault.Transparency,
			ScaleType = Enum.ScaleType.Fit
		}),
		Vote = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.35, 0, 0, Smallest),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.15, 0.5),
			Text = Text,
			Font = if FoundationFontFaceMigration then nil else CaptionSubHeaderFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionLarge.Font) else nil,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = NewScaledBaseSize })
		}),
		PlayerIcon = if PlayerCountText == nil then nil else RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.125, 0, 0, Smallest),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = IconsStatusGamesPeoplePlayingSmall,
			ImageColor3 = Theme.TextDefault.Color,
			ImageTransparency = Theme.TextDefault.Transparency,
			ScaleType = Enum.ScaleType.Fit
		}),
		PlayerCount = if PlayerCountText == nil then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.35, 0, 0, Smallest),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.65, 0.5),
			Text = PlayerCountText,
			Font = if FoundationFontFaceMigration then nil else CaptionSubHeaderFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionLarge.Font) else nil,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = NewScaledBaseSize })
		})
	})
end

function GameStats:renderConcurrentUsersPill(p1, Props)
	-- upvalues: RoactModule (copy), Colors (copy), ImageSetLabel (copy), IconsStatusGamesPeoplePlayingSmall (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local _Font = p1.Font
	local FooterFont = _Font.Footer.Font
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Size = UDim2.new(0, 0, 0, 23),
		Position = UDim2.new(1, -8, 1, -8),
		AnchorPoint = Vector2.new(1, 1),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Colors.Black
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 15)
		}),
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0.15, 0)
		}),
		PillIcon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ImageTransparency = 0,
			Size = UDim2.new(0.7, 0, 0.7, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Image = IconsStatusGamesPeoplePlayingSmall,
			ImageColor3 = Colors.White,
			ScaleType = Enum.ScaleType.Fit
		}),
		PillPlayerCount = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextTransparency = 0,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = Props.playerCountText,
			Font = if FoundationFontFaceMigration then nil else FooterFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionSmall.Font) else nil,
			TextColor3 = Colors.White,
			TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom
		})
	})
end

function GameStats.render(p1)
	-- upvalues: WithTextSizeOffsetFunction (copy), WithStyleFunction (copy)
	local Stats = p1.props.stats
	
	if Stats == nil then
		return nil
	else
		local function v42(p2, p3)
			-- upvalues: Stats (copy), p1 (copy)
			local IsShowSponsoredLabel = Stats.isSponsored and Stats.isShowSponsoredLabel
			
			return if IsShowSponsoredLabel then p1:renderSponsored(p2) elseif Stats.displayConcurrentUsersPill then p1:renderConcurrentUsersPill(p2, p1.props) elseif p1.props.hideGameStats then nil else p1:renderGameStats(p2, p1.props, p3)
		end
		
		return WithTextSizeOffsetFunction(function(p2)
			-- upvalues: WithStyleFunction (upval), v42 (copy)
			return WithStyleFunction(function(p3)
				-- upvalues: v42 (upval), p2 (copy)
				return v42(p3, p2)
			end)
		end)
	end
end

return function(p1)
	-- upvalues: UsePlayerCountTextModule (copy), RoactModule (copy), GameStats (copy), CryoModule (copy)
	return RoactModule.createElement(GameStats, CryoModule.Dictionary.join(p1, {
		playerCountText = UsePlayerCountTextModule(p1.stats and p1.stats.playerCount or nil)
	}))
end
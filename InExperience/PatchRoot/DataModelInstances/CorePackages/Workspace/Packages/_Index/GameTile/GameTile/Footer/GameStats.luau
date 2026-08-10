local gameTile = script:FindFirstAncestor("GameTile")
local gridTileGameStatsModule = require(gameTile.Footer.GridTileGameStats)
local gridTileIconTextFooterModule = require(gameTile.Footer.GridTileIconTextFooter)
local getGameStatsRatingPercentageTextModule = require(gameTile.Footer.getGameStatsRatingPercentageText)
local usePlayerCountTextModule = require(gameTile.Footer.usePlayerCountText)
local getUserInputIsSelectionOnlyModule = require(gameTile.Footer.getUserInputIsSelectionOnly)
local parent = gameTile.Parent
local roactModule = require(parent.Roact)
local colors = require(parent.Style).Colors
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local withTextSizeOffset = UIBloxModule.Core.Style.withTextSizeOffset
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local interactable = UIBloxModule.Core.Control.Interactable
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local withLocalization = require(parent.Localization).withLocalization
local sponsoredTooltipHover = require(parent.Ads).SponsoredTooltipHover
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppGenreRatingFooter = require(parent.SharedFlags).FFlagLuaAppGenreRatingFooter
local ratingSmall = images["icons/status/games/rating_small"]
local var9 = images["icons/status/games/people-playing_small"]
local gameStats = roactModule.PureComponent:extend("GameStats")
local var11 = if not fFlagLuaAppGenreRatingFooter then function(p0, p1) --[[ line: 35 ]]
	local var12 = "--"
	
	if p0 == nil or p0 < 0 then
		p0 = 0
	end
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	local var13 = p0 + p1
	
	if var13 > 0 then
		var12 = tostring(math.floor(p0 / var13 * 100))
	end
	return var12
end else nil

function gameStats.renderSponsored(p2, p3) --[[ line: 56 ]]
	-- upvalues: roactModule (ref), sponsoredTooltipHover (ref), tooltipOrientation (ref), getUserInputIsSelectionOnlyModule (ref), interactable (ref), withLocalization (ref)
	local theme = p3.Theme
	local font = p3.Font
	local var14 = if p2.props.useLargerFont then font.Body else font.CaptionHeader
	local var15 = var14.RelativeSize * font.BaseSize
	
	return withLocalization({ sponsoredText = "Feature.GamePage.Label.Sponsored" })(function(p4) --[[ line: 63 ]]
		-- upvalues: roactModule (copy), var15 (ref), theme (ref), var14 (ref), sponsoredTooltipHover (copy), tooltipOrientation (copy), p2 (ref), getUserInputIsSelectionOnlyModule (copy), interactable (copy)
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, math.ceil(var15)),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = theme.UIDefault.Color,
			BackgroundTransparency = theme.UIDefault.Transparency
		}, {
			SponsoredBlock = roactModule.createElement(interactable, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				onStateChanged = function() --[[ line: 111 ]] end,
				[roactModule.Event.Activated] = p2.props.onActivateSponsoredTooltip
			}, {
				SponsoredBlockFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Layout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 4)
					}),
					SponsoredText = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						TextSize = var15,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextEmphasis.Transparency,
						Font = var14.Font,
						Text = p4.sponsoredText,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					SponsoredTooltip = roactModule.createElement(sponsoredTooltipHover, {
						layoutOrder = 2,
						tooltipOrientation = tooltipOrientation.Bottom,
						onActivateTooltip = p2.props.onActivateSponsoredTooltip,
						size = UDim2.new(0, 16, 0, 16),
						color = theme.TextEmphasis.Color,
						selectable = getUserInputIsSelectionOnlyModule()
					})
				})
			})
		})
	end)
end

function gameStats.renderGameStats(p5, p6, p7, p8) --[[ line: 124 ]]
	-- upvalues: fFlagLuaAppGenreRatingFooter (ref), getGameStatsRatingPercentageTextModule (ref), var11 (write), roactModule (ref), gridTileGameStatsModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), withLocalization (ref), gridTileIconTextFooterModule (ref), images (ref)
	local stats = p7.stats
	local var16 = if fFlagLuaAppGenreRatingFooter then getGameStatsRatingPercentageTextModule(stats.totalUpVotes, stats.totalDownVotes) else var11(stats.totalUpVotes, stats.totalDownVotes)
	
	if stats.playerCount ~= nil then
		return withLocalization({
			longRatingText = {
				"Feature.GameDetails.RatingPercentOnly",
				percentRating = var16
			}
		})(function(p9) --[[ line: 154 ]]
			-- upvalues: roactModule (copy), gridTileIconTextFooterModule (copy), images (copy), p5 (ref), p7 (ref)
			return roactModule.createElement(gridTileIconTextFooterModule, {
				icon = images["icons/status/games/rating_small"],
				text = p9.longRatingText,
				styleProps = { iconSize = 15, padding = 4 },
				useLargerFont = p5.props.useLargerFont,
				isUnifiedGameTile = p7.isUnifiedGameTile
			})
		end)
	elseif stats.totalUpVotes + stats.totalDownVotes > 0 then
		var16 ..= "%"
	end
	return if p7.isGridTile or p7.isUnifiedGameTile then roactModule.createElement(gridTileGameStatsModule, {
		playerCountText = p7.playerCountText,
		ratingText = var16,
		useLargerFont = p5.props.useLargerFont,
		isUnifiedGameTile = p7.isUnifiedGameTile,
		gameTileLayoutType = p7.gameTileLayoutType,
		LayoutOrder = p5.props.LayoutOrder,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p7.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p7.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p7.hidePlayerCount else nil
	}) else p5:renderFullGameStats(p6, p7, var16, p8)
end

function gameStats.renderFullGameStats(_, p10, p11, p12, p13) --[[ line: 169 ]]
	-- upvalues: roactModule (ref), imageSetLabel (ref), ratingSmall (ref), var9 (ref)
	local var17 = if p11.stats.playerCount then p11.playerCountText else nil
	local theme = p10.Theme
	local font = p10.Font
	local font_1 = font.CaptionSubHeader.Font
	local var18 = font.BaseSize * font.CaptionSubHeader.RelativeSize
	local var19 = var18 + p10.Tokens.Size.Size_150
	local minValue = math.min(math.ceil(var18) + (p13 or 0), var19)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		VoteIcon = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.125, 0, 0, minValue),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Image = ratingSmall,
			ImageColor3 = theme.TextDefault.Color,
			ImageTransparency = theme.TextDefault.Transparency,
			ScaleType = Enum.ScaleType.Fit
		}),
		Vote = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.35, 0, 0, minValue),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.15, 0.5),
			Text = p12,
			Font = font_1,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var18,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var19 })
		}),
		PlayerIcon = if var17 ~= nil then nil else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.125, 0, 0, minValue),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = var9,
			ImageColor3 = theme.TextDefault.Color,
			ImageTransparency = theme.TextDefault.Transparency,
			ScaleType = Enum.ScaleType.Fit
		}),
		PlayerCount = if var17 ~= nil then nil else roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.35, 0, 0, minValue),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.65, 0.5),
			Text = var17,
			Font = font_1,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var18,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var19 })
		})
	})
end

function gameStats.renderConcurrentUsersPill(_, p14, p15) --[[ line: 254 ]]
	-- upvalues: roactModule (ref), colors (ref), imageSetLabel (ref), var9 (ref)
	local font = p14.Font
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Size = UDim2.new(0, 0, 0, 23),
		Position = UDim2.new(1, -8, 1, -8),
		AnchorPoint = Vector2.new(1, 1),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = colors.Black
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Padding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 15)
		}),
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0.15, 0)
		}),
		PillIcon = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ImageTransparency = 0,
			Size = UDim2.new(0.7, 0, 0.7, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Image = var9,
			ImageColor3 = colors.White,
			ScaleType = Enum.ScaleType.Fit
		}),
		PillPlayerCount = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextTransparency = 0,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p15.playerCountText,
			Font = font.Footer.Font,
			TextColor3 = colors.White,
			TextSize = font.BaseSize * font.Footer.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom
		})
	})
end

function gameStats.render(p16) --[[ line: 310 ]]
	-- upvalues: withTextSizeOffset (ref), withStyle (ref)
	local stats = p16.props.stats
	
	if stats == nil then
		return nil
	end
	local var21 = function(p17, p18) --[[ line: 316 ]]
		-- upvalues: stats (ref), p16 (ref)
		return if stats.isSponsored and stats.isShowSponsoredLabel then p16:renderSponsored(p17) elseif stats.displayConcurrentUsersPill then p16:renderConcurrentUsersPill(p17, p16.props) elseif p16.props.hideGameStats then nil else p16:renderGameStats(p17, p16.props, p18)
	end
	
	return withTextSizeOffset(function(p19) --[[ line: 331 ]]
		-- upvalues: withStyle (copy), var21 (ref)
		return withStyle(function(p20) --[[ line: 332 ]]
			-- upvalues: var21 (copy), p19 (ref)
			return var21(p20, p19)
		end)
	end)
end

return function(p21) --[[ line: 339 ]]
	-- upvalues: usePlayerCountTextModule (ref), roactModule (ref), gameStats (ref), cryoModule (ref)
	return roactModule.createElement(gameStats, cryoModule.Dictionary.join(p21, {
		playerCountText = usePlayerCountTextModule(if p21.stats then p21.stats.playerCount else nil)
	}))
end
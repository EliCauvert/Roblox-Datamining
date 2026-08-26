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
local var1 = images["icons/status/games/people-playing_small"]
local gameStats = roactModule.PureComponent:extend("GameStats")
local var2 = if not fFlagLuaAppGenreRatingFooter then function(p1, p2)
	local var3 = "--"
	
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	if p2 == nil or p2 < 0 then
		p2 = 0
	end
	local var4 = p1 + p2
	
	if var4 > 0 then
		var3 = tostring(math.floor(p1 / var4 * 100))
	end
	return var3
end else nil

function gameStats.renderSponsored(p1, p2)
	-- upvalues: roactModule (ref), sponsoredTooltipHover (ref), tooltipOrientation (ref), getUserInputIsSelectionOnlyModule (ref), interactable (ref), withLocalization (ref)
	local theme = p2.Theme
	local font = p2.Font
	local var3 = if p1.props.useLargerFont then font.Body else font.CaptionHeader
	local var4 = var3.RelativeSize * font.BaseSize
	
	return withLocalization({ sponsoredText = "Feature.GamePage.Label.Sponsored" })(function(p3)
		-- upvalues: roactModule (copy), var4 (ref), theme (ref), var3 (ref), sponsoredTooltipHover (copy), tooltipOrientation (copy), p1 (ref), getUserInputIsSelectionOnlyModule (copy), interactable (copy)
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, math.ceil(var4)),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = theme.UIDefault.Color,
			BackgroundTransparency = theme.UIDefault.Transparency
		}, {
			SponsoredBlock = roactModule.createElement(interactable, {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				onStateChanged = function() end,
				[roactModule.Event.Activated] = p1.props.onActivateSponsoredTooltip
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
						TextSize = var4,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextEmphasis.Transparency,
						Font = var3.Font,
						Text = p3.sponsoredText,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					SponsoredTooltip = roactModule.createElement(sponsoredTooltipHover, {
						layoutOrder = 2,
						tooltipOrientation = tooltipOrientation.Bottom,
						onActivateTooltip = p1.props.onActivateSponsoredTooltip,
						size = UDim2.new(0, 16, 0, 16),
						color = theme.TextEmphasis.Color,
						selectable = getUserInputIsSelectionOnlyModule()
					})
				})
			})
		})
	end)
end

function gameStats.renderGameStats(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppGenreRatingFooter (ref), getGameStatsRatingPercentageTextModule (ref), var2 (write), roactModule (ref), gridTileGameStatsModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), withLocalization (ref), gridTileIconTextFooterModule (ref), images (ref)
	local stats = p3.stats
	local var3 = if fFlagLuaAppGenreRatingFooter then getGameStatsRatingPercentageTextModule(stats.totalUpVotes, stats.totalDownVotes) else var2(stats.totalUpVotes, stats.totalDownVotes)
	
	if stats.playerCount ~= nil then
		return withLocalization({
			longRatingText = {
				"Feature.GameDetails.RatingPercentOnly",
				percentRating = var3
			}
		})(function(p5)
			-- upvalues: roactModule (copy), gridTileIconTextFooterModule (copy), images (copy), p1 (ref), p3 (ref)
			return roactModule.createElement(gridTileIconTextFooterModule, {
				icon = images["icons/status/games/rating_small"],
				text = p5.longRatingText,
				styleProps = { iconSize = 15, padding = 4 },
				useLargerFont = p1.props.useLargerFont,
				isUnifiedGameTile = p3.isUnifiedGameTile
			})
		end)
	elseif stats.totalUpVotes + stats.totalDownVotes > 0 then
		var3 ..= "%"
	end
	return if p3.isGridTile or p3.isUnifiedGameTile then roactModule.createElement(gridTileGameStatsModule, {
		playerCountText = p3.playerCountText,
		ratingText = var3,
		useLargerFont = p1.props.useLargerFont,
		isUnifiedGameTile = p3.isUnifiedGameTile,
		gameTileLayoutType = p3.gameTileLayoutType,
		LayoutOrder = p1.props.LayoutOrder,
		compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p3.compactMetadataFormat else nil,
		hideRating = if fFlagLuaAppNarrowTileHideRating then p3.hideRating else nil,
		hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p3.hidePlayerCount else nil
	}) else p1:renderFullGameStats(p2, p3, var3, p4)
end

function gameStats.renderFullGameStats(_, p1, p2, p3, p4)
	-- upvalues: roactModule (ref), imageSetLabel (ref), ratingSmall (ref), var1 (ref)
	local var3 = if p2.stats.playerCount then p2.playerCountText else nil
	local theme = p1.Theme
	local font = p1.Font
	local font_1 = font.CaptionSubHeader.Font
	local var4 = font.BaseSize * font.CaptionSubHeader.RelativeSize
	local var5 = var4 + p1.Tokens.Size.Size_150
	local minValue = math.min(math.ceil(var4) + (p4 or 0), var5)
	
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
			Text = p3,
			Font = font_1,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var4,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var5 })
		}),
		PlayerIcon = if var3 ~= nil then nil else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.125, 0, 0, minValue),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = var1,
			ImageColor3 = theme.TextDefault.Color,
			ImageTransparency = theme.TextDefault.Transparency,
			ScaleType = Enum.ScaleType.Fit
		}),
		PlayerCount = if var3 ~= nil then nil else roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.35, 0, 0, minValue),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.65, 0.5),
			Text = var3,
			Font = font_1,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var4,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UiTextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var5 })
		})
	})
end

function gameStats.renderConcurrentUsersPill(_, p1, p2)
	-- upvalues: roactModule (ref), colors (ref), imageSetLabel (ref), var1 (ref)
	local font = p1.Font
	
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
			Image = var1,
			ImageColor3 = colors.White,
			ScaleType = Enum.ScaleType.Fit
		}),
		PillPlayerCount = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextTransparency = 0,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p2.playerCountText,
			Font = font.Footer.Font,
			TextColor3 = colors.White,
			TextSize = font.BaseSize * font.Footer.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom
		})
	})
end

function gameStats.render(p1)
	-- upvalues: withTextSizeOffset (ref), withStyle (ref)
	local stats = p1.props.stats
	
	if stats == nil then
		return nil
	end
	local var3 = function(p2, p3)
		-- upvalues: stats (ref), p1 (ref)
		return if stats.isSponsored and stats.isShowSponsoredLabel then p1:renderSponsored(p2) elseif stats.displayConcurrentUsersPill then p1:renderConcurrentUsersPill(p2, p1.props) elseif p1.props.hideGameStats then nil else p1:renderGameStats(p2, p1.props, p3)
	end
	
	return withTextSizeOffset(function(p2)
		-- upvalues: withStyle (copy), var3 (ref)
		return withStyle(function(p3)
			-- upvalues: var3 (copy), p2 (ref)
			return var3(p3, p2)
		end)
	end)
end

return function(p1)
	-- upvalues: usePlayerCountTextModule (ref), roactModule (ref), gameStats (ref), cryoModule (ref)
	return roactModule.createElement(gameStats, cryoModule.Dictionary.join(p1, {
		playerCountText = usePlayerCountTextModule(if p1.stats then p1.stats.playerCount else nil)
	}))
end
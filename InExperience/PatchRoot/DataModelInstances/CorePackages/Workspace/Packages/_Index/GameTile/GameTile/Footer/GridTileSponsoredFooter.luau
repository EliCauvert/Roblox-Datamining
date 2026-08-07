local gameTile = script:FindFirstAncestor("GameTile")
local gridTileIconTextFooterModule = require(gameTile.Footer.GridTileIconTextFooter)
local gridTileTextFooterModule = require(gameTile.Footer.GridTileTextFooter)
local parent = gameTile.Parent
local reactModule = require(parent.React)
local sponsoredTooltipHover = require(parent.Ads).SponsoredTooltipHover
local useLocalization = require(parent.Localization).Hooks.useLocalization
local tooltipOrientation = require(parent.UIBlox).App.Dialog.Enum.TooltipOrientation
local _ = require(gameTile.GameTileTypes)
local getUserInputIsSelectionOnlyModule = require(gameTile.Footer.getUserInputIsSelectionOnly)
local view = require(parent.Foundation).View
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrLarger = responsiveModule.useBreakpointXOrLarger

function GridTileSponsoredFooter(p0) --[[ line: 31 ]]
	-- upvalues: useLocalization (ref), useBreakpointXOrLarger (ref), responsiveModule (ref), reactModule (ref), gridTileTextFooterModule (ref), view (ref), gridTileIconTextFooterModule (ref), sponsoredTooltipHover (ref), tooltipOrientation (ref), getUserInputIsSelectionOnlyModule (ref)
	local var6 = useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		adText = "Feature.GamePage.Label.Ad"
	})
	local var7 = if p0.useLargerFont then 24 else 20
	local var8 = useBreakpointXOrLarger(responsiveModule.Keys.Medium)
	
	if not p0.enableSponsoredFeedback then
		return reactModule.createElement(gridTileIconTextFooterModule, {
			iconElement = reactModule.createElement(sponsoredTooltipHover, {
				supportTenFootUi = true,
				tooltipOrientation = tooltipOrientation.Bottom,
				onActivateTooltip = p0.onActivateSponsoredTooltip,
				size = UDim2.fromOffset(var7, var7),
				position = UDim2.fromScale(0.5, 0.5),
				anchorPoint = Vector2.new(0.5, 0.5),
				selectable = getUserInputIsSelectionOnlyModule()
			}),
			text = var6.sponsoredText,
			iconSize = if p0.useLargerFont then 24 else 20,
			useLargerFont = p0.useLargerFont,
			isUnifiedGameTile = p0.isUnifiedGameTile,
			gameTileLayoutType = p0.gameTileLayoutType,
			isNarrowScreenXSmall = p0.isNarrowScreenXSmall
		})
	end
	local var9 = reactModule.createElement(gridTileTextFooterModule, {
		shouldSizeToContentWidth = true,
		text = var6.adText,
		useLargerFont = p0.useLargerFont,
		isUnifiedGameTile = p0.isUnifiedGameTile
	})
	
	return if var8 and p0.isSponsoredRatingFooterAllowed and p0.gameStatsElement then reactModule.createElement(view, {
		tag = "size-full-0 auto-y row align-y-center gap-xsmall clip"
	}, {
		AdLabelWrapper = reactModule.createElement(view, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, { Content = var9 }),
		DotSeparator = reactModule.createElement(gridTileTextFooterModule, {
			LayoutOrder = 2,
			text = "\226\128\162",
			shouldSizeToContentWidth = true,
			useLargerFont = p0.useLargerFont,
			isUnifiedGameTile = p0.isUnifiedGameTile
		}),
		GameStatsWrapper = reactModule.createElement(view, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, { Content = p0.gameStatsElement })
	}) else var9
end

return GridTileSponsoredFooter
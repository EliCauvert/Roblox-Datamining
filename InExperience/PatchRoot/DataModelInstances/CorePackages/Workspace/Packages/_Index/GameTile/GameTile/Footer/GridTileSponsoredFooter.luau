local GameTile = script:FindFirstAncestor("GameTile")
local GridTileIconTextFooterModule = require(GameTile.Footer.GridTileIconTextFooter)
local GridTileTextFooterModule = require(GameTile.Footer.GridTileTextFooter)
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local SponsoredTooltipHover = require(Parent.Ads).SponsoredTooltipHover
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TooltipOrientation = require(Parent.UIBlox).App.Dialog.Enum.TooltipOrientation
local _ = require(GameTile.GameTileTypes)
local GetUserInputIsSelectionOnlyModule = require(GameTile.Footer.getUserInputIsSelectionOnly)
local View = require(Parent.Foundation).View
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrLargerFunction = ResponsiveModule.useBreakpointXOrLarger

function GridTileSponsoredFooter(p1)
	-- upvalues: UseLocalizationFunction (copy), UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), ReactModule (copy), GridTileTextFooterModule (copy), View (copy), GridTileIconTextFooterModule (copy), SponsoredTooltipHover (copy), TooltipOrientation (copy), GetUserInputIsSelectionOnlyModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		adText = "Feature.GamePage.Label.Ad"
	})
	local XOffset: number = if p1.useLargerFont then 24 else 20
	local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Medium)
	
	if p1.enableSponsoredFeedback then
		local Element = ReactModule.createElement(GridTileTextFooterModule, {
			shouldSizeToContentWidth = true,
			text = UseLocalizationResult.adText,
			useLargerFont = p1.useLargerFont,
			isUnifiedGameTile = p1.isUnifiedGameTile
		})
		
		return if UseBreakpointXOrLargerResult and p1.isSponsoredRatingFooterAllowed and p1.gameStatsElement then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y row align-y-center gap-xsmall clip"
		}, {
			AdLabelWrapper = ReactModule.createElement(View, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, { Content = Element }),
			DotSeparator = ReactModule.createElement(GridTileTextFooterModule, {
				LayoutOrder = 2,
				text = "•",
				shouldSizeToContentWidth = true,
				useLargerFont = p1.useLargerFont,
				isUnifiedGameTile = p1.isUnifiedGameTile
			}),
			GameStatsWrapper = ReactModule.createElement(View, {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, { Content = p1.gameStatsElement })
		}) else Element
	else
		return ReactModule.createElement(GridTileIconTextFooterModule, {
			iconElement = ReactModule.createElement(SponsoredTooltipHover, {
				supportTenFootUi = true,
				tooltipOrientation = TooltipOrientation.Bottom,
				onActivateTooltip = p1.onActivateSponsoredTooltip,
				size = UDim2.fromOffset(XOffset, XOffset),
				position = UDim2.fromScale(0.5, 0.5),
				anchorPoint = Vector2.new(0.5, 0.5),
				selectable = GetUserInputIsSelectionOnlyModule()
			}),
			text = UseLocalizationResult.sponsoredText,
			iconSize = if p1.useLargerFont then 24 else 20,
			useLargerFont = p1.useLargerFont,
			isUnifiedGameTile = p1.isUnifiedGameTile,
			gameTileLayoutType = p1.gameTileLayoutType,
			isNarrowScreenXSmall = p1.isNarrowScreenXSmall
		})
	end
end

return GridTileSponsoredFooter
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local VerticalTile = UIBloxModule.App.Tile.VerticalTile
local VerticalTileThumbnail = UIBloxModule.App.Tile.VerticalTileThumbnail

return function(p1)
	-- upvalues: ReactModule (copy), VerticalTileThumbnail (copy), VerticalTile (copy)
	local HasBackground = p1.hasBackground or false
	local ThumbnailOverlay = p1.thumbnailOverlay
	
	return ReactModule.createElement(VerticalTile, {
		hasOutline = p1.hasOutline,
		hasBackground = HasBackground,
		isHoverEnabled = HasBackground,
		isOverlayVisible = HasBackground,
		onActivated = p1.onActivated,
		renderTopContent = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), VerticalTileThumbnail (upval), HasBackground (copy), p1 (copy), ThumbnailOverlay (copy)
			local Element = ReactModule.createElement(VerticalTileThumbnail, {
				aspectRatio = 1,
				isTopRounded = true,
				isBottomRounded = not HasBackground,
				thumbnail = p1.thumbnail
			})
			
			return if ThumbnailOverlay then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}, {
				Thumbnail = Element,
				ThumbnailOverlay = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1)
				}, { Content = ThumbnailOverlay })
			}) else Element
		end, { HasBackground, p1.thumbnail, ThumbnailOverlay }),
		renderBottomContent = p1.renderBottomPanel,
		renderFooterRow = p1.renderActionRow,
		reservedBottomHeight = if p1.renderActionRow then if p1.hasBackground then 48 else 40 else 0
	})
end
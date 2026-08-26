local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_2.Core
local parent_3 = parent_2.Parent
local cryoModule = require(parent_3.Cryo)
local reactModule = require(parent_3.React)
local useDebouncedState = require(parent_3.ReactUtils).useDebouncedState
local useStyleModule = require(core.Style.useStyle)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_1.ImageSet.Images)
local tileOverlayModule = require(parent.SplitTile.TileOverlay)
local _ = require(parent_1.Style.StyleTypes)
local uDim = UDim.new(0, 8)

local function useIsHoveredState(p1, p2)
	-- upvalues: useDebouncedState (ref), reactModule (ref)
	local var1, var2 = useDebouncedState(false, p1)
	reactModule.useLayoutEffect(function()
		-- upvalues: p2 (ref), var1 (ref)
		if p2 ~= nil then
			p2(var1)
		end
	end, { p2, var1 })
	
	return var1, var2
end

return function(p1)
	-- upvalues: useStyleModule (ref), cryoModule (ref), uDim (ref), useIsHoveredState (ref), reactModule (ref), tileOverlayModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local theme = useStyleModule().Theme
	local var1 = cryoModule.Dictionary.join({
		hasBackground = true,
		hasOutline = true,
		isHoverEnabled = true,
		isOverlayVisible = true,
		isActive = true,
		backgroundColor = {
			Color = theme.BackgroundUIDefault.Color,
			Transparency = theme.BackgroundUIDefault.Transparency
		},
		border = {
			Width = 1,
			BorderColor = {
				Color = theme.Divider.Color,
				Transparency = theme.Divider.Transparency
			},
			CornerRadius = uDim
		},
		dropShadow = {
			ImageAssetName = "component_assets/dropshadow_24_6",
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 10, 1, 12),
			ImageColor = {
				Color = theme.DropShadow.Color,
				Transparency = theme.DropShadow.Transparency
			},
			SliceCenter = Rect.new(18, 18, 18, 18)
		}
	}, p1)
	local hasBackground = var1.hasBackground
	local isHoverEnabled = var1.isHoverEnabled
	local var2, var3 = useIsHoveredState(var1.hoverDelay, var1.onHoverChanged)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy), p2 (ref)
			var3(p2)
		end
	end, {})
	local isHoverEnabled_1 = var2 and isHoverEnabled
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UISizeConstraint = if var1.minTileSize then reactModule.createElement("UISizeConstraint", { MinSize = var1.minTileSize }) else nil,
		TileContent = reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = if hasBackground then var1.backgroundColor.Color else nil,
			BackgroundTransparency = if hasBackground then var1.backgroundColor.Transparency else 1,
			[reactModule.Event.MouseEnter] = if isHoverEnabled then var4(true) else nil,
			[reactModule.Event.MouseLeave] = if isHoverEnabled then var4(false) else nil,
			ClipsDescendants = false,
			ZIndex = 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var1.border.CornerRadius }),
			Panel = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.Name
				}),
				Content1 = if var1.renderTopContent then var1.renderTopContent(isHoverEnabled_1) else nil,
				Content2 = if var1.renderBottomContent then var1.renderBottomContent(isHoverEnabled_1) else nil
			}),
			FooterRow = if var1.renderFooterRow then var1.renderFooterRow(isHoverEnabled_1) else nil,
			Overlay = reactModule.createElement(tileOverlayModule, {
				zIndex = 3,
				reservedBottomHeight = var1.reservedBottomHeight,
				isVisible = var1.isOverlayVisible,
				isActive = var1.isActive,
				onActivated = var1.onActivated
			})
		}),
		BorderFrame = if var1.hasOutline then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.new(1, -2 * var1.border.Width, 1, -2 * var1.border.Width),
			AnchorPoint = if hasBackground then Vector2.new(0.5, 0.5) else nil,
			Position = if hasBackground then UDim2.fromScale(0.5, 0.5) else UDim2.fromOffset(var1.border.Width, var1.border.Width),
			SizeConstraint = if not hasBackground then Enum.SizeConstraint.RelativeXX else nil
		}, {
			UIStroke = reactModule.createElement("UIStroke", {
				Color = var1.border.BorderColor.Color,
				Transparency = var1.border.BorderColor.Transparency,
				Thickness = var1.border.Width
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var1.border.CornerRadius })
		}) else nil,
		HoverShadow = if isHoverEnabled_1 and hasBackground then reactModule.createElement(imageSetComponentModule.Label, {
			ZIndex = 0,
			BackgroundTransparency = 1,
			Position = var1.dropShadow.Position,
			AnchorPoint = var1.dropShadow.AnchorPoint,
			Size = var1.dropShadow.Size,
			Image = imagesModule[var1.dropShadow.ImageAssetName],
			ImageColor3 = var1.dropShadow.ImageColor.Color,
			ImageTransparency = var1.dropShadow.ImageColor.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = var1.dropShadow.SliceCenter
		}) else nil
	})
end
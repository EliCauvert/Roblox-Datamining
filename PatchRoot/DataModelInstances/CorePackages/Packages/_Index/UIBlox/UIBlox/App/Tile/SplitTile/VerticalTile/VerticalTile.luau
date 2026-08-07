-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

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

local function useIsHoveredState(p0, p1) --[[ line: 65 ]]
	-- upvalues: useDebouncedState (ref), reactModule (ref)
	local var8, var9 = useDebouncedState(false, p0)
	reactModule.useLayoutEffect(function() --[[ line: 68 ]]
		-- upvalues: p1 (ref), var8 (ref)
		if p1 ~= nil then
			p1(var8)
		end
	end, { p1, var8 })
	
	return var8, var9
end

return function(p2) --[[ line: 77 | named "VerticalTile" ]]
	-- upvalues: useStyleModule (ref), cryoModule (ref), uDim (ref), useIsHoveredState (ref), reactModule (ref), tileOverlayModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local theme = useStyleModule().Theme
	local var10 = cryoModule.Dictionary.join({
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
	}, p2)
	local hasBackground = var10.hasBackground
	local isHoverEnabled = var10.isHoverEnabled
	local var11, var12 = useIsHoveredState(var10.hoverDelay, var10.onHoverChanged)
	local var13 = reactModule.useCallback(function(p3) --[[ line: 113 ]]
		-- upvalues: var12 (ref)
		return function() --[[ line: 114 ]]
			-- upvalues: var12 (copy), p3 (ref)
			var12(p3)
		end
	end, {})
	local isHoverEnabled_1 = var11 and isHoverEnabled
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UISizeConstraint = if var10.minTileSize then reactModule.createElement("UISizeConstraint", { MinSize = var10.minTileSize }) else nil,
		TileContent = reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = if hasBackground then var10.backgroundColor.Color else nil,
			BackgroundTransparency = if hasBackground then var10.backgroundColor.Transparency else 1,
			[reactModule.Event.MouseEnter] = if isHoverEnabled then var13(true) else nil,
			[reactModule.Event.MouseLeave] = if isHoverEnabled then var13(false) else nil,
			ClipsDescendants = false,
			ZIndex = 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var10.border.CornerRadius }),
			Panel = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.Name
				}),
				Content1 = if var10.renderTopContent then var10.renderTopContent(isHoverEnabled_1) else nil,
				Content2 = if var10.renderBottomContent then var10.renderBottomContent(isHoverEnabled_1) else nil
			}),
			FooterRow = if var10.renderFooterRow then var10.renderFooterRow(isHoverEnabled_1) else nil,
			Overlay = reactModule.createElement(tileOverlayModule, {
				zIndex = 3,
				reservedBottomHeight = var10.reservedBottomHeight,
				isVisible = var10.isOverlayVisible,
				isActive = var10.isActive,
				onActivated = var10.onActivated
			})
		}),
		BorderFrame = if var10.hasOutline then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.new(1, -2 * var10.border.Width, 1, -2 * var10.border.Width),
			AnchorPoint = if hasBackground then Vector2.new(0.5, 0.5) else nil,
			Position = if hasBackground then UDim2.fromScale(0.5, 0.5) else UDim2.fromOffset(var10.border.Width, var10.border.Width),
			SizeConstraint = if not hasBackground then Enum.SizeConstraint.RelativeXX else nil
		}, {
			UIStroke = reactModule.createElement("UIStroke", {
				Color = var10.border.BorderColor.Color,
				Transparency = var10.border.BorderColor.Transparency,
				Thickness = var10.border.Width
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var10.border.CornerRadius })
		}) else nil,
		HoverShadow = if isHoverEnabled_1 and hasBackground then reactModule.createElement(imageSetComponentModule.Label, {
			ZIndex = 0,
			BackgroundTransparency = 1,
			Position = var10.dropShadow.Position,
			AnchorPoint = var10.dropShadow.AnchorPoint,
			Size = var10.dropShadow.Size,
			Image = imagesModule[var10.dropShadow.ImageAssetName],
			ImageColor3 = var10.dropShadow.ImageColor.Color,
			ImageTransparency = var10.dropShadow.ImageColor.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = var10.dropShadow.SliceCenter
		}) else nil
	})
end
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Core = Parent2.Core
local Parent3 = Parent2.Parent
local CryoModule = require(Parent3.Cryo)
local ReactModule = require(Parent3.React)
local UseDebouncedStateFunction = require(Parent3.ReactUtils).useDebouncedState
local UseStyleModule = require(Core.Style.useStyle)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local ImagesModule = require(Parent1.ImageSet.Images)
local TileOverlayModule = require(Parent.SplitTile.TileOverlay)
local _ = require(Parent1.Style.StyleTypes)
local _UDim = UDim.new(0, 8)

local function useIsHoveredState(HoverDelay, Callback) --[[ Line: 65 ]]
	-- upvalues: UseDebouncedStateFunction (copy), ReactModule (copy)
	local UseDebouncedStateResult, UseDebouncedStateResult2 = UseDebouncedStateFunction(false, HoverDelay)
	ReactModule.useLayoutEffect(function() --[[ Line: 68 ]]
		-- upvalues: Callback (copy), UseDebouncedStateResult (copy)
		if Callback ~= nil then
			Callback(UseDebouncedStateResult)
		end
	end, { Callback, UseDebouncedStateResult })
	
	return UseDebouncedStateResult, UseDebouncedStateResult2
end

return function(p1) --[[ Line: 77 | Named "VerticalTile" ]]
	-- upvalues: UseStyleModule (copy), CryoModule (copy), _UDim (copy), useIsHoveredState (copy), ReactModule (copy), TileOverlayModule (copy), ImageSetComponentModule (copy), ImagesModule (copy)
	local Theme = UseStyleModule().Theme
	local JoinResult = CryoModule.Dictionary.join({
		hasBackground = true,
		hasOutline = true,
		isHoverEnabled = true,
		isOverlayVisible = true,
		isActive = true,
		backgroundColor = {
			Color = Theme.BackgroundUIDefault.Color,
			Transparency = Theme.BackgroundUIDefault.Transparency
		},
		border = {
			Width = 1,
			BorderColor = {
				Color = Theme.Divider.Color,
				Transparency = Theme.Divider.Transparency
			},
			CornerRadius = _UDim
		},
		dropShadow = {
			ImageAssetName = "component_assets/dropshadow_24_6",
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 10, 1, 12),
			ImageColor = {
				Color = Theme.DropShadow.Color,
				Transparency = Theme.DropShadow.Transparency
			},
			SliceCenter = Rect.new(18, 18, 18, 18)
		}
	}, p1)
	local HasBackground = JoinResult.hasBackground
	local IsHoverEnabled = JoinResult.isHoverEnabled
	local UseIsHoveredStateResult, UseIsHoveredStateResult2 = useIsHoveredState(JoinResult.hoverDelay, JoinResult.onHoverChanged)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 113 ]]
		-- upvalues: UseIsHoveredStateResult2 (copy)
		return function() --[[ Line: 114 ]]
			-- upvalues: UseIsHoveredStateResult2 (upval), p2 (copy)
			UseIsHoveredStateResult2(p2)
		end
	end, {})
	local IsHoverEnabled1 = UseIsHoveredStateResult and IsHoverEnabled
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UISizeConstraint = if JoinResult.minTileSize then ReactModule.createElement("UISizeConstraint", { MinSize = JoinResult.minTileSize }) else nil,
		TileContent = ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = if HasBackground then JoinResult.backgroundColor.Color else nil,
			BackgroundTransparency = if HasBackground then JoinResult.backgroundColor.Transparency else 1,
			[ReactModule.Event.MouseEnter] = if IsHoverEnabled then UseResult(true) else nil,
			[ReactModule.Event.MouseLeave] = if IsHoverEnabled then UseResult(false) else nil,
			ClipsDescendants = false,
			ZIndex = 1
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.border.CornerRadius }),
			Panel = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.Name
				}),
				Content1 = if JoinResult.renderTopContent then JoinResult.renderTopContent(IsHoverEnabled1) else nil,
				Content2 = if JoinResult.renderBottomContent then JoinResult.renderBottomContent(IsHoverEnabled1) else nil
			}),
			FooterRow = if JoinResult.renderFooterRow then JoinResult.renderFooterRow(IsHoverEnabled1) else nil,
			Overlay = ReactModule.createElement(TileOverlayModule, {
				zIndex = 3,
				reservedBottomHeight = JoinResult.reservedBottomHeight,
				isVisible = JoinResult.isOverlayVisible,
				isActive = JoinResult.isActive,
				onActivated = JoinResult.onActivated
			})
		}),
		BorderFrame = if JoinResult.hasOutline then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.new(1, -2 * JoinResult.border.Width, 1, -2 * JoinResult.border.Width),
			AnchorPoint = if HasBackground then Vector2.new(0.5, 0.5) else nil,
			Position = if HasBackground then UDim2.fromScale(0.5, 0.5) else UDim2.fromOffset(JoinResult.border.Width, JoinResult.border.Width),
			SizeConstraint = if HasBackground then nil else Enum.SizeConstraint.RelativeXX
		}, {
			UIStroke = ReactModule.createElement("UIStroke", {
				Color = JoinResult.border.BorderColor.Color,
				Transparency = JoinResult.border.BorderColor.Transparency,
				Thickness = JoinResult.border.Width
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.border.CornerRadius })
		}) else nil,
		HoverShadow = if IsHoverEnabled1 and HasBackground then ReactModule.createElement(ImageSetComponentModule.Label, {
			ZIndex = 0,
			BackgroundTransparency = 1,
			Position = JoinResult.dropShadow.Position,
			AnchorPoint = JoinResult.dropShadow.AnchorPoint,
			Size = JoinResult.dropShadow.Size,
			Image = ImagesModule[JoinResult.dropShadow.ImageAssetName],
			ImageColor3 = JoinResult.dropShadow.ImageColor.Color,
			ImageTransparency = JoinResult.dropShadow.ImageColor.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = JoinResult.dropShadow.SliceCenter
		}) else nil
	})
end
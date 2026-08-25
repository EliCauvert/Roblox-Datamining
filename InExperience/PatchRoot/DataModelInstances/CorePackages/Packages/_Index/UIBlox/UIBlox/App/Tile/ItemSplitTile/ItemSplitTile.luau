local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(core.Style.withStyle)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local loadableImageModule = require(parent_1.App.Loading.LoadableImage)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local itemSplitTileFooterModule = require(parent_1.App.Tile.ItemSplitTile.ItemSplitTileFooter)
local uDim = UDim.new(0, 8)
local uDim_1 = UDim.new(0, 8)
local uDim_2 = UDim.new(0, 12)
local itemSplitTile = roactModule.PureComponent:extend("ItemSplitTile")
itemSplitTile.validateProps = tModule.strictInterface({
	itemName = tModule.optional(tModule.string),
	priceText = tModule.optional(tModule.string),
	isOwned = tModule.optional(tModule.boolean),
	hasBackground = tModule.optional(tModule.boolean),
	isHovered = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	thumbnail = tModule.optional(tModule.string)
})
itemSplitTile.defaultProps = {
	itemName = "--",
	priceText = "--",
	hasBackground = true,
	isHovered = false
}

function itemSplitTile.init(p0)
	-- upvalues: controlStateModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(_, p1)
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p1 })
	end
end

function itemSplitTile.renderImageFrame(_, p2, p3, p4, p5)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref), uDim (ref), loadableImageModule (ref)
	local theme = p5.Theme
	p4 = p4 or not p3
	
	return roactModule.createElement("Frame", {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, if p3 then 0.5 else 0),
		Size = UDim2.fromScale(1, if p4 then 1 else 0.5)
	}, {
		Image = if typeof(p2) == "table" then roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BackgroundColor3 = theme.PlaceHolder.Color,
			Image = p2,
			Position = UDim2.fromScale(0, if p3 then -1 else 0),
			Size = UDim2.fromScale(1, if p4 then 1 else 2)
		}, {
			UICorner = if p4 then roactModule.createElement("UICorner", { CornerRadius = uDim }) else nil
		}) else roactModule.createElement(loadableImageModule, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			BackgroundColor3 = theme.PlaceHolder.Color,
			Image = p2,
			Position = UDim2.fromScale(0.5, if p3 then 0 else 1),
			Size = UDim2.fromScale(1, if p4 then 1 else 2),
			AnchorPoint = Vector2.new(0.5, if p4 then 1 else 0.5),
			cornerRadius = if p4 then uDim else nil
		})
	})
end

function itemSplitTile.renderTopContent(p6, p7)
	-- upvalues: imagesModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local hasBackground = p6.props.hasBackground
	local isHovered = p6.props.isHovered
	local var14 = not hasBackground
	local theme = p7.Theme
	local image = imagesModule[theme.ItemBackgroundDefault.Image]
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		BackgroundImage = if p6.props.thumbnail then roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p6:renderImageFrame(image, false, var14, p7),
			BottomImageFrame = if not var14 then p6:renderImageFrame(image, true, false, p7) else nil
		}) else nil,
		ItemImage = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p6:renderImageFrame(p6.props.thumbnail, false, var14, p7),
			BottomImageFrame = if not var14 then p6:renderImageFrame(p6.props.thumbnail, true, false, p7) else nil
		}),
		HoverShadow = if isHovered and not hasBackground then roactModule.createElement(imageSetComponentModule.Label, {
			ZIndex = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 12),
			Image = imagesModule["component_assets/dropshadow_24_6"],
			ImageColor3 = theme.DropShadow.Color,
			ImageTransparency = theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		}) else nil
	})
end

function itemSplitTile.renderBottomContent(p8, p9)
	-- upvalues: controlStateModule (ref), uDim_2 (ref), uDim_1 (ref), roactModule (ref), itemSplitTileFooterModule (ref)
	local itemName = p8.props.itemName
	local hasBackground = p8.props.hasBackground
	local font = p9.Font
	local ceiled = math.ceil(p9.Font.BaseSize * p9.Font.Header2.RelativeSize)
	local var16 = if (p8.props.isHovered or p8.state.controlState == controlStateModule.Pressed) and hasBackground then uDim_2 else uDim_1
	local textEmphasis = p9.Theme.TextEmphasis
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, ceiled * 3 + uDim_1.Offset + var16.Offset * 2)
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = uDim_1
		}),
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = if hasBackground then var16 else nil,
			PaddingRight = if hasBackground then var16 else nil,
			PaddingTop = if hasBackground then var16 else uDim_1,
			PaddingBottom = if hasBackground then var16 else uDim_1
		}),
		TitleArea = if itemName and string.len(itemName) > 0 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = itemName,
			Font = font.Header2.Font,
			TextSize = ceiled,
			TextTransparency = textEmphasis.Transparency,
			TextColor3 = textEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, ceiled * 2) })
		}) else nil,
		Footer = roactModule.createElement(itemSplitTileFooterModule, {
			layoutOrder = 2,
			priceText = p8.props.priceText,
			isOwned = p8.props.isOwned
		})
	})
end

function itemSplitTile.renderTileContent(p10, p11)
	-- upvalues: roactModule (ref), uDim (ref), interactableModule (ref)
	local hasBackground = p10.props.hasBackground
	local theme = p11.Theme
	
	return roactModule.createElement("Frame", {
		ClipsDescendants = true,
		ZIndex = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if hasBackground then theme.BackgroundUIDefault.Color else nil,
		BackgroundTransparency = if hasBackground then theme.BackgroundUIDefault.Transparency else 1
	}, {
		UICorner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
		Panel = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TopContentPlaceholder = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}),
			BottomContent = p10:renderBottomContent(p11)
		}),
		TopContent = p10:renderTopContent(p11),
		TileOverlay = roactModule.createElement(interactableModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			onStateChanged = p10.onStateChanged,
			[roactModule.Event.Activated] = p10.props.onActivated,
			ZIndex = 3
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
			BorderFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -2, 1, -2),
				Position = UDim2.fromOffset(1, 1),
				SizeConstraint = if not hasBackground then Enum.SizeConstraint.RelativeXX else nil
			}, {
				UIStroke = roactModule.createElement("UIStroke", {
					Thickness = 1,
					Color = theme.Divider.Color,
					Transparency = theme.Divider.Transparency
				}),
				UICorner = roactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		})
	})
end

function itemSplitTile.render(p12)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local hasBackground = p12.props.hasBackground
	local isHovered = p12.props.isHovered
	
	return withStyleModule(function(p13)
		-- upvalues: roactModule (copy), p12 (ref), isHovered (ref), hasBackground (ref), imageSetComponentModule (copy), imagesModule (copy)
		local theme = p13.Theme
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(146, 233) }),
			TileContent = p12:renderTileContent(p13),
			HoverShadow = if isHovered and hasBackground then roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 0,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				Image = imagesModule["component_assets/dropshadow_24_6"],
				ImageColor3 = theme.DropShadow.Color,
				ImageTransparency = theme.DropShadow.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(18, 18, 18, 18)
			}) else nil
		})
	end)
end

return itemSplitTile
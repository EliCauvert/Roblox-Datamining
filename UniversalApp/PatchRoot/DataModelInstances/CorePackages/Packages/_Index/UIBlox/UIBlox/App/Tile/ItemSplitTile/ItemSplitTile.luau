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

function itemSplitTile.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p2 })
	end
end

function itemSplitTile.renderImageFrame(_, p1, p2, p3, p4)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref), uDim (ref), loadableImageModule (ref)
	local theme = p4.Theme
	p3 = p3 or not p2
	
	return roactModule.createElement("Frame", {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, if p2 then 0.5 else 0),
		Size = UDim2.fromScale(1, if p3 then 1 else 0.5)
	}, {
		Image = if typeof(p1) == "table" then roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BackgroundColor3 = theme.PlaceHolder.Color,
			Image = p1,
			Position = UDim2.fromScale(0, if p2 then -1 else 0),
			Size = UDim2.fromScale(1, if p3 then 1 else 2)
		}, {
			UICorner = if p3 then roactModule.createElement("UICorner", { CornerRadius = uDim }) else nil
		}) else roactModule.createElement(loadableImageModule, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			BackgroundColor3 = theme.PlaceHolder.Color,
			Image = p1,
			Position = UDim2.fromScale(0.5, if p2 then 0 else 1),
			Size = UDim2.fromScale(1, if p3 then 1 else 2),
			AnchorPoint = Vector2.new(0.5, if p3 then 1 else 0.5),
			cornerRadius = if p3 then uDim else nil
		})
	})
end

function itemSplitTile.renderTopContent(p1, p2)
	-- upvalues: imagesModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local hasBackground = p1.props.hasBackground
	local isHovered = p1.props.isHovered
	local var1 = not hasBackground
	local theme = p2.Theme
	local image = imagesModule[theme.ItemBackgroundDefault.Image]
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		BackgroundImage = if p1.props.thumbnail then roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p1:renderImageFrame(image, false, var1, p2),
			BottomImageFrame = if not var1 then p1:renderImageFrame(image, true, false, p2) else nil
		}) else nil,
		ItemImage = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p1:renderImageFrame(p1.props.thumbnail, false, var1, p2),
			BottomImageFrame = if not var1 then p1:renderImageFrame(p1.props.thumbnail, true, false, p2) else nil
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

function itemSplitTile.renderBottomContent(p1, p2)
	-- upvalues: controlStateModule (ref), uDim_2 (ref), uDim_1 (ref), roactModule (ref), itemSplitTileFooterModule (ref)
	local itemName = p1.props.itemName
	local hasBackground = p1.props.hasBackground
	local font = p2.Font
	local ceiled = math.ceil(p2.Font.BaseSize * p2.Font.Header2.RelativeSize)
	local var1 = if (p1.props.isHovered or p1.state.controlState == controlStateModule.Pressed) and hasBackground then uDim_2 else uDim_1
	local textEmphasis = p2.Theme.TextEmphasis
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, ceiled * 3 + uDim_1.Offset + var1.Offset * 2)
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = uDim_1
		}),
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = if hasBackground then var1 else nil,
			PaddingRight = if hasBackground then var1 else nil,
			PaddingTop = if hasBackground then var1 else uDim_1,
			PaddingBottom = if hasBackground then var1 else uDim_1
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
			priceText = p1.props.priceText,
			isOwned = p1.props.isOwned
		})
	})
end

function itemSplitTile.renderTileContent(p1, p2)
	-- upvalues: roactModule (ref), uDim (ref), interactableModule (ref)
	local hasBackground = p1.props.hasBackground
	local theme = p2.Theme
	
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
			BottomContent = p1:renderBottomContent(p2)
		}),
		TopContent = p1:renderTopContent(p2),
		TileOverlay = roactModule.createElement(interactableModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			onStateChanged = p1.onStateChanged,
			[roactModule.Event.Activated] = p1.props.onActivated,
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

function itemSplitTile.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local hasBackground = p1.props.hasBackground
	local isHovered = p1.props.isHovered
	
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), isHovered (ref), hasBackground (ref), imageSetComponentModule (copy), imagesModule (copy)
		local theme = p2.Theme
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(146, 233) }),
			TileContent = p1:renderTileContent(p2),
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
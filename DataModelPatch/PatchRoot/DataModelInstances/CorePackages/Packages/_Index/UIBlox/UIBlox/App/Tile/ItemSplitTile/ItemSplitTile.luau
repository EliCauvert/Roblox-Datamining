local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Core.Style.withStyle)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local LoadableImageModule = require(Parent1.App.Loading.LoadableImage)
local ImagesModule = require(Parent.ImageSet.Images)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local ItemSplitTileFooterModule = require(Parent1.App.Tile.ItemSplitTile.ItemSplitTileFooter)
local _UDim = UDim.new(0, 8)
local _UDim1 = UDim.new(0, 8)
local _UDim2 = UDim.new(0, 12)
local ItemSplitTile = RoactModule.PureComponent:extend("ItemSplitTile")
ItemSplitTile.validateProps = TModule.strictInterface({
	itemName = TModule.optional(TModule.string),
	priceText = TModule.optional(TModule.string),
	isOwned = TModule.optional(TModule.boolean),
	hasBackground = TModule.optional(TModule.boolean),
	isHovered = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	thumbnail = TModule.optional(TModule.string)
})
ItemSplitTile.defaultProps = {
	itemName = "--",
	priceText = "--",
	hasBackground = true,
	isHovered = false
}

function ItemSplitTile.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1:onStateChanged(ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
	end
end

function ItemSplitTile:renderImageFrame(Image, p1, p2, p3)
	-- upvalues: RoactModule (copy), ImageSetComponentModule (copy), _UDim (copy), LoadableImageModule (copy)
	local Theme = p3.Theme
	local P6 = p2 or not p1
	
	return RoactModule.createElement("Frame", {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, if p1 then 0.5 else 0),
		Size = UDim2.fromScale(1, if p2 then 1 else 0.5)
	}, {
		Image = if typeof(Image) == "table" then RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BackgroundColor3 = Theme.PlaceHolder.Color,
			Image = Image,
			Position = UDim2.fromScale(0, if p1 then -1 else 0),
			Size = UDim2.fromScale(1, if p2 then 1 else 2)
		}, {
			UICorner = if P6 then RoactModule.createElement("UICorner", { CornerRadius = _UDim }) else nil
		}) else RoactModule.createElement(LoadableImageModule, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			BackgroundColor3 = Theme.PlaceHolder.Color,
			Image = Image,
			Position = UDim2.fromScale(0.5, if p1 then 0 else 1),
			Size = UDim2.fromScale(1, if p2 then 1 else 2),
			AnchorPoint = Vector2.new(0.5, if p2 then 1 else 0.5),
			cornerRadius = if P6 then _UDim else nil
		})
	})
end

function ItemSplitTile.renderTopContent(p1, p2)
	-- upvalues: ImagesModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	local HasBackground = p1.props.hasBackground
	local IsHovered = p1.props.isHovered
	local NoHasBackground = not HasBackground
	local Theme = p2.Theme
	local ImagesModuleEntry = ImagesModule[Theme.ItemBackgroundDefault.Image]
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 1, 0),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		BackgroundImage = if p1.props.thumbnail then RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p1:renderImageFrame(ImagesModuleEntry, false, NoHasBackground, p2),
			BottomImageFrame = if NoHasBackground then nil else p1:renderImageFrame(ImagesModuleEntry, true, false, p2)
		}) else nil,
		ItemImage = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			TopImageFrame = p1:renderImageFrame(p1.props.thumbnail, false, NoHasBackground, p2),
			BottomImageFrame = if NoHasBackground then nil else p1:renderImageFrame(p1.props.thumbnail, true, false, p2)
		}),
		HoverShadow = if IsHovered and not HasBackground then RoactModule.createElement(ImageSetComponentModule.Label, {
			ZIndex = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 12),
			Image = ImagesModule["component_assets/dropshadow_24_6"],
			ImageColor3 = Theme.DropShadow.Color,
			ImageTransparency = Theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		}) else nil
	})
end

function ItemSplitTile.renderBottomContent(p1, p2)
	-- upvalues: ControlStateModule (copy), _UDim2 (copy), _UDim1 (copy), RoactModule (copy), ItemSplitTileFooterModule (copy)
	local ItemName: string = p1.props.itemName
	local HasBackground = p1.props.hasBackground
	local _Font = p2.Font
	local Ceiled = math.ceil(p2.Font.BaseSize * p2.Font.Header2.RelativeSize)
	local ControlState = p1.state.controlState
	local _UDim = if (p1.props.isHovered or ControlState == ControlStateModule.Pressed) and HasBackground then _UDim2 else _UDim1
	local TextEmphasis = p2.Theme.TextEmphasis
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, Ceiled * 3 + _UDim1.Offset + _UDim.Offset * 2)
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = _UDim1
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = if HasBackground then _UDim else nil,
			PaddingRight = if HasBackground then _UDim else nil,
			PaddingTop = if HasBackground then _UDim else _UDim1,
			PaddingBottom = if HasBackground then _UDim else _UDim1
		}),
		TitleArea = if ItemName and string.len(ItemName) > 0 then RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = ItemName,
			Font = _Font.Header2.Font,
			TextSize = Ceiled,
			TextTransparency = TextEmphasis.Transparency,
			TextColor3 = TextEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, Ceiled * 2) })
		}) else nil,
		Footer = RoactModule.createElement(ItemSplitTileFooterModule, {
			layoutOrder = 2,
			priceText = p1.props.priceText,
			isOwned = p1.props.isOwned
		})
	})
end

function ItemSplitTile.renderTileContent(p1, p2)
	-- upvalues: RoactModule (copy), _UDim (copy), InteractableModule (copy)
	local HasBackground = p1.props.hasBackground
	local Theme = p2.Theme
	
	return RoactModule.createElement("Frame", {
		ClipsDescendants = true,
		ZIndex = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if HasBackground then Theme.BackgroundUIDefault.Color else nil,
		BackgroundTransparency = if HasBackground then Theme.BackgroundUIDefault.Transparency else 1
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Panel = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TopContentPlaceholder = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0),
				SizeConstraint = Enum.SizeConstraint.RelativeXX
			}),
			BottomContent = p1:renderBottomContent(p2)
		}),
		TopContent = p1:renderTopContent(p2),
		TileOverlay = RoactModule.createElement(InteractableModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			onStateChanged = p1.onStateChanged,
			[RoactModule.Event.Activated] = p1.props.onActivated,
			ZIndex = 3
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
			BorderFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -2, 1, -2),
				Position = UDim2.fromOffset(1, 1),
				SizeConstraint = if HasBackground then nil else Enum.SizeConstraint.RelativeXX
			}, {
				UIStroke = RoactModule.createElement("UIStroke", {
					Thickness = 1,
					Color = Theme.Divider.Color,
					Transparency = Theme.Divider.Transparency
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		})
	})
end

function ItemSplitTile.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy)
	local HasBackground = p1.props.hasBackground
	local IsHovered = p1.props.isHovered
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), IsHovered (copy), HasBackground (copy), ImageSetComponentModule (upval), ImagesModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(146, 233) }),
			TileContent = p1:renderTileContent(p2),
			HoverShadow = if IsHovered and HasBackground then RoactModule.createElement(ImageSetComponentModule.Label, {
				ZIndex = 0,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				Image = ImagesModule["component_assets/dropshadow_24_6"],
				ImageColor3 = Theme.DropShadow.Color,
				ImageTransparency = Theme.DropShadow.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(18, 18, 18, 18)
			}) else nil
		})
	end)
end

return ItemSplitTile
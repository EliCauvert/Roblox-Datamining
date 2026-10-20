local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local StatusIndicator = require(Parent1.Foundation).StatusIndicator
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local ValidateImageSetDataModule = require(Parent.Core.ImageSet.Validator.validateImageSetData)
local BadgeVariantModule = require(Parent.App.Indicator.Enum.BadgeVariant)
local BadgeStatesModule = require(Parent.App.Indicator.Enum.BadgeStates)
local InteractableListModule = require(Parent.Core.Control.InteractableList)
local WithAnimationModule = require(Parent.Core.Animation.withAnimation)
local MigrateBadgeVariantModule = require(Parent.Utility.migrateBadgeVariant)
local PlacementModule = require(script.Parent.Enum.Placement)
local config = { frequency = 3 }
local XOffset: number = require(Parent.App.ImageSet.getIconSize)(require(Parent.App.ImageSet.Enum.IconSize).Medium)
local NewXOffset = XOffset + 8
local NewXOffsetRatio = (NewXOffset - XOffset) / 2
local NewXOffsetRatio1 = (NewXOffset - XOffset) / 2
local NewNewXOffsetRatio = NewXOffsetRatio + 4
local NewXOffsetRatioDelta = NewXOffsetRatio1 - 4
local Offset = 12 + (64 - NewXOffset) / 2
local Offset1 = 4 + (64 - NewXOffset)
local SystemBar = RoactModule.PureComponent:extend("SystemBar")
SystemBar.validateProps = TModule.strictInterface({
	itemList = TModule.array(TModule.strictInterface({
		iconOn = TModule.optional(ValidateImageSetDataModule),
		iconOff = TModule.optional(ValidateImageSetDataModule),
		iconImageComponent = TModule.optional(TModule.union(TModule.table, TModule.callback)),
		iconComponent = TModule.optional(TModule.union(TModule.table, TModule.callback)),
		onActivated = TModule.callback,
		badgeValue = TModule.optional(TModule.union(TModule.integer, TModule.string, BadgeStatesModule.isEnumValue)),
		itemSize = TModule.optional(TModule.UDim2),
		bottomAligned = TModule.optional(TModule.boolean)
	})),
	selection = TModule.optional(TModule.integer),
	placement = TModule.optional(PlacementModule.isEnumValue),
	hidden = TModule.optional(TModule.boolean),
	onSafeAreaChanged = TModule.optional(TModule.callback),
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.integer),
	layoutPaddingOffset = TModule.optional(TModule.UDim),
	firstItemPaddingOffset = TModule.optional(TModule.UDim),
	lastItemPaddingOffset = TModule.optional(TModule.UDim),
	[RoactModule.Children] = TModule.optional(TModule.any),
	roundCorners = TModule.optional(TModule.boolean),
	buttonStroke = TModule.optional(TModule.boolean),
	bgTransparency = TModule.optional(TModule.integer),
	sortOrder = TModule.optional(TModule.enum(Enum.SortOrder)),
	clipsDescendants = TModule.optional(TModule.boolean),
	experimentalTabSizePortraitY = TModule.optional(TModule.number)
})
SystemBar.defaultProps = {
	clipsDescendants = true,
	experimentalTabSizePortraitY = 48,
	placement = PlacementModule.Auto,
	layoutPaddingOffset = UDim.new(0, 0),
	firstItemPaddingOffset = UDim.new(0, 0),
	lastItemPaddingOffset = UDim.new(0, 0)
}

function SystemBar.isPortrait(p1)
	-- upvalues: PlacementModule (copy)
	return p1.props.placement ~= PlacementModule.Left and (p1.props.placement == PlacementModule.Bottom or p1.state.portrait)
end

function SystemBar.renderItem(p1, p2, Hover, Selected, LayoutOrder)
	-- upvalues: ControlStateModule (copy), PlacementModule (copy), RoactModule (copy), BadgeStatesModule (copy), TModule (copy), NewXOffsetRatio (copy), NewXOffsetRatio1 (copy), NewXOffsetRatioDelta (copy), NewNewXOffsetRatio (copy), WithAnimationModule (copy), WithStyleModule (copy), ImageSetComponentModule (copy), XOffset (copy), XOffset (copy), StatusIndicator (copy), MigrateBadgeVariantModule (copy), BadgeVariantModule (copy), config (copy)
	assert((if p2.iconOn == nil then p2.iconImageComponent ~= nil else p2.iconOff ~= nil or p2.iconImageComponent ~= nil) or p2.iconComponent ~= nil, "items must define either iconOn and iconOff or iconImageComponent or iconComponent")
	local IsHoverMatch = Hover == ControlStateModule.Pressed
	local IsHoverMatch1: boolean = IsHoverMatch or Hover == ControlStateModule.Hover
	
	if p2.iconComponent then
		return RoactModule.createElement(p2.iconComponent, {
			placement = if p1:isPortrait() then PlacementModule.Bottom else PlacementModule.Left,
			hovered = IsHoverMatch1,
			selected = Selected,
			pressed = IsHoverMatch,
			badgeValue = p2.badgeValue
		}), { LayoutOrder = LayoutOrder }
	end
	local IsBadgeValueMatch = nil
	IsBadgeValueMatch = if p2.badgeValue then p2.badgeValue == BadgeStatesModule.isEmpty or (if TModule.string(p2.badgeValue) then true else p2.badgeValue > 0) else false
	local PositionX = NewXOffsetRatio
	local PositionY = NewXOffsetRatio1
	
	if IsHoverMatch1 then
		if p1:isPortrait() then
			PositionY = NewXOffsetRatioDelta
		else
			PositionX = NewNewXOffsetRatio
		end
	end
	return WithAnimationModule({ positionX = PositionX, positionY = PositionY }, function(p3)
		-- upvalues: WithStyleModule (upval), RoactModule (upval), p2 (copy), ImageSetComponentModule (upval), XOffset (upval), XOffset (upval), p1 (copy), Selected (copy), IsHoverMatch (copy), IsBadgeValueMatch (ref), StatusIndicator (upval), BadgeStatesModule (upval), MigrateBadgeVariantModule (upval), BadgeVariantModule (upval)
		return WithStyleModule(function(p4)
			-- upvalues: RoactModule (upval), p2 (upval), ImageSetComponentModule (upval), p3 (copy), XOffset (upval), XOffset (upval), p1 (upval), Selected (upval), IsHoverMatch (upval), IsBadgeValueMatch (upval), StatusIndicator (upval), BadgeStatesModule (upval), MigrateBadgeVariantModule (upval), BadgeVariantModule (upval)
			return RoactModule.createElement(p2.iconImageComponent or ImageSetComponentModule.Label, {
				Position = UDim2.fromOffset(math.floor(p3.positionX + 0.5), (math.floor(p3.positionY + 0.5))),
				Size = UDim2.fromOffset(XOffset, XOffset),
				BackgroundTransparency = if p1.props.buttonStroke then 0.99 else 1,
				Image = Selected and p2.iconOn or p2.iconOff,
				ImageColor3 = p4.Theme.IconDefault.Color,
				ImageTransparency = if IsHoverMatch then 0.5 else 0
			}, {
				Badge = IsBadgeValueMatch and RoactModule.createElement(StatusIndicator, {
					position = if p2.badgeValue == BadgeStatesModule.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2),
					value = tonumber(p2.badgeValue),
					variant = MigrateBadgeVariantModule(BadgeVariantModule.Default),
					max = if tonumber(p2.badgeValue) then 99 else nil
				}),
				UICorner = p1.props.roundCorners and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.15, 0) }) or nil,
				UIStroke = p1.props.buttonStroke and RoactModule.createElement("UIStroke", {
					Transparency = 0,
					Thickness = 1,
					Color = Color3.new(0.4, 0.4, 0.4)
				}) or nil
			})
		end)
	end, config), { LayoutOrder = LayoutOrder }
end

function SystemBar.renderPortrait(p1, p2, p3)
	-- upvalues: WithAnimationModule (copy), RoactModule (copy), CryoModule (copy), NewXOffset (copy), config (copy)
	return WithAnimationModule({
		offset = if p1.props.hidden then 0 else -p1.props.experimentalTabSizePortraitY
	}, function(p4)
		-- upvalues: RoactModule (upval), CryoModule (upval), p2 (copy), p1 (copy), NewXOffset (upval), p3 (copy)
		return RoactModule.createElement("Frame", CryoModule.Dictionary.join(p2, {
			ZIndex = 99,
			Position = UDim2.new(0, 0, 1, (math.floor(p4.offset + 0.5))),
			Size = UDim2.new(1, 0, 0, p1.props.experimentalTabSizePortraitY)
		}), {
			Layout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
			InnerFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, CryoModule.Dictionary.join({
				Constraint = RoactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(600, p1.props.experimentalTabSizePortraitY)
				}),
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = p1.props.layoutPaddingOffset + UDim.new(1 / #p1.props.itemList, -NewXOffset),
					SortOrder = p1.props.sortOrder
				}, {})
			}, p3))
		})
	end, config)
end

function SystemBar.renderLandscape(p1, p2, FilterResult, p3)
	-- upvalues: WithAnimationModule (copy), RoactModule (copy), CryoModule (copy), Offset (copy), Offset1 (copy), config (copy)
	return WithAnimationModule({ offset = if p1.props.hidden then -64 else 0 }, function(p4)
		-- upvalues: RoactModule (upval), CryoModule (upval), p2 (copy), p3 (copy), p1 (copy), Offset (upval), Offset1 (upval), FilterResult (copy)
		return RoactModule.createElement("Frame", CryoModule.Dictionary.join(p2, {
			ZIndex = 99,
			Position = UDim2.new(0, math.floor(p4.offset + 0.5), 0, 0),
			Size = UDim2.new(0, 64, 1, 0),
			BackgroundTransparency = if p3 then 1 else nil
		}), CryoModule.Dictionary.join({
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = if p3 then nil else p1.props.firstItemPaddingOffset + UDim.new(0, Offset),
				PaddingBottom = if p3 then p1.props.lastItemPaddingOffset + UDim.new(0, Offset1) else nil
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = if p3 then Enum.VerticalAlignment.Bottom else nil,
				Padding = p1.props.layoutPaddingOffset + UDim.new(0, Offset1),
				SortOrder = p1.props.sortOrder
			})
		}, FilterResult))
	end, config)
end

function SystemBar.renderBackground(p1, p2, MapResult)
	-- upvalues: CryoModule (copy), RoactModule (copy)
	if p1:isPortrait() then
		return p1:renderPortrait(p2, MapResult)
	end
	local FilterResult = CryoModule.List.filter(MapResult, function(_, p3)
		-- upvalues: p1 (copy)
		return p1.props.itemList[p3].bottomAligned
	end)
	local RenderLandscapeResult = p1:renderLandscape(p2, (CryoModule.List.filter(MapResult, function(_, p3): boolean
		-- upvalues: p1 (copy)
		return not p1.props.itemList[p3].bottomAligned
	end)))
	
	if #FilterResult > 0 then
		RenderLandscapeResult = RoactModule.createFragment({
			NavBar = RenderLandscapeResult,
			BottomAlignedNavBar = p1:renderLandscape(p2, FilterResult, true)
		})
	end
	return RenderLandscapeResult
end

function SystemBar.renderSafeArea(p1)
	-- upvalues: RoactModule (copy)
	local _UDim2 = nil
	local _UDim2_1 = nil
	if p1.props.hidden then
		_UDim2 = UDim2.new(0, 0, 0, 0)
		_UDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p1:isPortrait() then
		_UDim2 = UDim2.new(0, 0, 0, 0)
		_UDim2_1 = UDim2.new(1, 0, 1, -p1.props.experimentalTabSizePortraitY)
	else
		_UDim2 = UDim2.new(0, 64, 0, 0)
		_UDim2_1 = UDim2.new(1, -64, 1, 0)
	end
	return RoactModule.createElement("Frame", {
		Position = _UDim2,
		Size = _UDim2_1,
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsoluteSize] = p1.onSafeAreaEvent,
		[RoactModule.Change.AbsolutePosition] = p1.onSafeAreaEvent
	}, p1.props[RoactModule.Children])
end

function SystemBar.renderList(p1, p2, Callback)
	-- upvalues: WithStyleModule (copy), CryoModule (copy), RoactModule (copy)
	return WithStyleModule(function(p3)
		-- upvalues: CryoModule (upval), p2 (copy), Callback (copy), RoactModule (upval), p1 (copy)
		local Theme = p3.Theme
		
		return RoactModule.createElement("Frame", {
			Position = p1.props.position or UDim2.new(0, 0, 0, 0),
			Size = p1.props.size or UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			ClipsDescendants = p1.props.clipsDescendants,
			LayoutOrder = p1.props.layoutOrder,
			BackgroundTransparency = p1.props.bgTransparency or 1,
			[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
				-- upvalues: p1 (upval)
				if p1.state.portrait and Frame.AbsoluteSize.Y < Frame.AbsoluteSize.X then
					p1:setState({ portrait = false })
					
					return
				end
				if not p1.state.portrait and Frame.AbsoluteSize.X < Frame.AbsoluteSize.Y then
					p1:setState({ portrait = true })
				end
			end
		}, {
			NavBar = p1:renderBackground({
				BorderSizePixel = 0,
				BackgroundColor3 = Theme.NavigationBar.Color,
				BackgroundTransparency = if p1.props.roundCorners then 1 else Theme.NavigationBar.Transparency
			}, (CryoModule.List.map(p2, function(_, p4)
				-- upvalues: Callback (upval)
				return Callback(p4)
			end))),
			SafeArea = p1:renderSafeArea()
		}, {
			UICorner = p1.props.roundCorners and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.15, 0) or nil }) or nil
		})
	end)
end

function SystemBar.init(p1)
	p1:setState({ portrait = true })
	
	function p1.onSelectionChanged(Entry)
		-- upvalues: p1 (copy)
		if #Entry > 0 then
			local Item = p1.props.itemList[Entry[1]]
			
			if Item and Item.onActivated then
				Item.onActivated()
			end
		end
	end
	
	function p1.onSafeAreaEvent(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.props.onSafeAreaChanged then
			p1.props.onSafeAreaChanged({
				Position = Frame.Position,
				AbsolutePosition = Frame.AbsolutePosition,
				Size = Frame.Size,
				AbsoluteSize = Frame.AbsoluteSize
			})
		end
	end
end

function SystemBar.render(p1)
	-- upvalues: RoactModule (copy), InteractableListModule (copy), NewXOffset (copy), NewXOffset (copy)
	local ItemList = p1.props.itemList
	local Selection = p1.props.selection
	
	if Selection then
		if ItemList[Selection] == nil then
			Selection = nil
		else
			Selection = { Selection }
		end
	end
	return RoactModule.createElement(InteractableListModule, {
		itemList = ItemList,
		selection = Selection,
		itemSize = UDim2.fromOffset(NewXOffset, NewXOffset),
		renderList = function(...)
			-- upvalues: p1 (copy)
			return p1:renderList(...)
		end,
		renderItem = function(...)
			-- upvalues: p1 (copy)
			return p1:renderItem(...)
		end,
		sortOrder = p1.props.sortOrder,
		onSelectionChanged = p1.onSelectionChanged
	})
end

return SystemBar
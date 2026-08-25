local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local statusIndicator = require(parent_1.Foundation).StatusIndicator
local withStyleModule = require(parent.Core.Style.withStyle)
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local validateImageSetDataModule = require(parent.Core.ImageSet.Validator.validateImageSetData)
local badgeVariantModule = require(parent.App.Indicator.Enum.BadgeVariant)
local badgeStatesModule = require(parent.App.Indicator.Enum.BadgeStates)
local iconSizeModule = require(parent.App.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.App.ImageSet.getIconSize)
local interactableListModule = require(parent.Core.Control.InteractableList)
local withAnimationModule = require(parent.Core.Animation.withAnimation)
local migrateBadgeVariantModule = require(parent.Utility.migrateBadgeVariant)
local placementModule = require(script.Parent.Enum.Placement)
local t = { frequency = 3 }
local var16 = getIconSizeModule(iconSizeModule.Medium)
local var17 = var16 + 8
local var18 = (var17 - var16) / 2
local var19 = (var17 - var16) / 2
local var20 = var18 + 4
local var21 = var19 - 4
local var22 = 12 + (64 - var17) / 2
local var23 = 4 + (64 - var17)
local systemBar = roactModule.PureComponent:extend("SystemBar")
systemBar.validateProps = tModule.strictInterface({
	itemList = tModule.array(tModule.strictInterface({
		iconOn = tModule.optional(validateImageSetDataModule),
		iconOff = tModule.optional(validateImageSetDataModule),
		iconImageComponent = tModule.optional(tModule.union(tModule.table, tModule.callback)),
		iconComponent = tModule.optional(tModule.union(tModule.table, tModule.callback)),
		onActivated = tModule.callback,
		badgeValue = tModule.optional(tModule.union(tModule.integer, tModule.string, badgeStatesModule.isEnumValue)),
		itemSize = tModule.optional(tModule.UDim2),
		bottomAligned = tModule.optional(tModule.boolean)
	})),
	selection = tModule.optional(tModule.integer),
	placement = tModule.optional(placementModule.isEnumValue),
	hidden = tModule.optional(tModule.boolean),
	onSafeAreaChanged = tModule.optional(tModule.callback),
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.integer),
	layoutPaddingOffset = tModule.optional(tModule.UDim),
	firstItemPaddingOffset = tModule.optional(tModule.UDim),
	lastItemPaddingOffset = tModule.optional(tModule.UDim),
	[roactModule.Children] = tModule.optional(tModule.any),
	roundCorners = tModule.optional(tModule.boolean),
	buttonStroke = tModule.optional(tModule.boolean),
	bgTransparency = tModule.optional(tModule.integer),
	sortOrder = tModule.optional(tModule.enum(Enum.SortOrder)),
	clipsDescendants = tModule.optional(tModule.boolean),
	experimentalTabSizePortraitY = tModule.optional(tModule.number)
})
systemBar.defaultProps = {
	clipsDescendants = true,
	experimentalTabSizePortraitY = 48,
	placement = placementModule.Auto,
	layoutPaddingOffset = UDim.new(0, 0),
	firstItemPaddingOffset = UDim.new(0, 0),
	lastItemPaddingOffset = UDim.new(0, 0)
}

function systemBar.isPortrait(p0)
	-- upvalues: placementModule (ref)
	return if p0.props.placement == placementModule.Left then false else p0.props.placement == placementModule.Bottom or p0.state.portrait
end

function systemBar.renderItem(p1, p2, p3, p4, p5)
	-- upvalues: controlStateModule (ref), placementModule (ref), roactModule (ref), badgeStatesModule (ref), tModule (ref), var18 (ref), var19 (ref), var21 (ref), var20 (ref), withAnimationModule (ref), withStyleModule (ref), imageSetComponentModule (ref), var16 (ref), var16 (ref), statusIndicator (ref), migrateBadgeVariantModule (ref), badgeVariantModule (ref), t (ref)
	local var25
	if p2.iconOn ~= nil then
		var25 = if p2.iconOff == nil then if p2.iconImageComponent == nil then p2.iconComponent ~= nil else true else true
	end
	assert(var25, "items must define either iconOn and iconOff or iconImageComponent or iconComponent")
	local var26 = p3 == controlStateModule.Pressed
	local var26_1 = var26 or p3 == controlStateModule.Hover
	
	if p2.iconComponent then
		return roactModule.createElement(p2.iconComponent, {
			placement = if p1:isPortrait() then placementModule.Bottom else placementModule.Left,
			hovered = var26_1,
			selected = p4,
			pressed = var26,
			badgeValue = p2.badgeValue
		}), { LayoutOrder = p5 }
	end
	local var28 = if p2.badgeValue then p2.badgeValue == badgeStatesModule.isEmpty or (if tModule.string(p2.badgeValue) then true else p2.badgeValue > 0) else false
	local var29 = var18
	local var30 = var19
	
	if var26_1 then
		if p1:isPortrait() then
			var30 = var21
		else
			var29 = var20
		end
	end
	return withAnimationModule({ positionX = var29, positionY = var30 }, function(p6)
		-- upvalues: withStyleModule (copy), roactModule (copy), p2 (ref), imageSetComponentModule (copy), var16 (copy), var16 (copy), p1 (ref), p4 (ref), var26 (ref), var28 (write), statusIndicator (copy), badgeStatesModule (copy), migrateBadgeVariantModule (copy), badgeVariantModule (copy)
		return withStyleModule(function(p7)
			-- upvalues: roactModule (copy), p2 (copy), imageSetComponentModule (copy), p6 (ref), var16 (copy), var16 (copy), p1 (copy), p4 (copy), var26 (copy), var28 (copy), statusIndicator (copy), badgeStatesModule (copy), migrateBadgeVariantModule (copy), badgeVariantModule (copy)
			return roactModule.createElement(p2.iconImageComponent or imageSetComponentModule.Label, {
				Position = UDim2.fromOffset(math.floor(p6.positionX + 0.5), math.floor(p6.positionY + 0.5)),
				Size = UDim2.fromOffset(var16, var16),
				BackgroundTransparency = if p1.props.buttonStroke then 0.99 else 1,
				Image = if p4 then p2.iconOn else p2.iconOff,
				ImageColor3 = p7.Theme.IconDefault.Color,
				ImageTransparency = if var26 then 0.5 else 0
			}, {
				Badge = var28 and roactModule.createElement(statusIndicator, {
					position = if p2.badgeValue == badgeStatesModule.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2),
					value = tonumber(p2.badgeValue),
					variant = migrateBadgeVariantModule(badgeVariantModule.Default),
					max = if tonumber(p2.badgeValue) then 99 else nil
				}),
				UICorner = p1.props.roundCorners and roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.15, 0) }) or nil,
				UIStroke = p1.props.buttonStroke and roactModule.createElement("UIStroke", {
					Transparency = 0,
					Thickness = 1,
					Color = Color3.new(0.4, 0.4, 0.4)
				}) or nil
			})
		end)
	end, t), { LayoutOrder = p5 }
end

function systemBar.renderPortrait(p8, p9, p10)
	-- upvalues: withAnimationModule (ref), roactModule (ref), cryoModule (ref), var17 (ref), t (ref)
	return withAnimationModule({
		offset = if p8.props.hidden then 0 else -p8.props.experimentalTabSizePortraitY
	}, function(p11)
		-- upvalues: roactModule (copy), cryoModule (copy), p9 (ref), p8 (ref), var17 (copy), p10 (ref)
		return roactModule.createElement("Frame", cryoModule.Dictionary.join(p9, {
			ZIndex = 99,
			Position = UDim2.new(0, 0, 1, math.floor(p11.offset + 0.5)),
			Size = UDim2.new(1, 0, 0, p8.props.experimentalTabSizePortraitY)
		}), {
			Layout = roactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
			InnerFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, cryoModule.Dictionary.join({
				Constraint = roactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(600, p8.props.experimentalTabSizePortraitY)
				}),
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = p8.props.layoutPaddingOffset + UDim.new(1 / #p8.props.itemList, -var17),
					SortOrder = p8.props.sortOrder
				}, {})
			}, p10))
		})
	end, t)
end

function systemBar.renderLandscape(p12, p13, p14, p15)
	-- upvalues: withAnimationModule (ref), roactModule (ref), cryoModule (ref), var22 (ref), var23 (ref), t (ref)
	return withAnimationModule({ offset = if p12.props.hidden then -64 else 0 }, function(p16)
		-- upvalues: roactModule (copy), cryoModule (copy), p13 (ref), p15 (ref), p12 (ref), var22 (copy), var23 (copy), p14 (ref)
		return roactModule.createElement("Frame", cryoModule.Dictionary.join(p13, {
			ZIndex = 99,
			Position = UDim2.new(0, math.floor(p16.offset + 0.5), 0, 0),
			Size = UDim2.new(0, 64, 1, 0),
			BackgroundTransparency = if p15 then 1 else nil
		}), cryoModule.Dictionary.join({
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = if not p15 then p12.props.firstItemPaddingOffset + UDim.new(0, var22) else nil,
				PaddingBottom = if p15 then p12.props.lastItemPaddingOffset + UDim.new(0, var23) else nil
			}),
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = if p15 then Enum.VerticalAlignment.Bottom else nil,
				Padding = p12.props.layoutPaddingOffset + UDim.new(0, var23),
				SortOrder = p12.props.sortOrder
			})
		}, p14))
	end, t)
end

function systemBar.renderBackground(value, p17, p18)
	-- upvalues: cryoModule (ref), roactModule (ref)
	if value:isPortrait() then
		return value:renderPortrait(p17, p18)
	end
	local var31 = cryoModule.List.filter(p18, function(_, p19)
		-- upvalues: value (ref)
		return value.props.itemList[p19].bottomAligned
	end)
	local var32 = value:renderLandscape(p17, cryoModule.List.filter(p18, function(_, p20)
		-- upvalues: value (ref)
		return not value.props.itemList[p20].bottomAligned
	end))
	
	if #var31 > 0 then
		var32 = roactModule.createFragment({
			NavBar = var32,
			BottomAlignedNavBar = value:renderLandscape(p17, var31, true)
		})
	end
	return var32
end

function systemBar.renderSafeArea(p21)
	-- upvalues: roactModule (ref)
	local uDim2, uDim2_1
	local _ = nil
	local _ = nil
	
	if p21.props.hidden then
		uDim2 = UDim2.new(0, 0, 0, 0)
		uDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p21:isPortrait() then
		uDim2 = UDim2.new(0, 0, 0, 0)
		uDim2_1 = UDim2.new(1, 0, 1, -p21.props.experimentalTabSizePortraitY)
	else
		uDim2 = UDim2.new(0, 64, 0, 0)
		uDim2_1 = UDim2.new(1, -64, 1, 0)
	end
	return roactModule.createElement("Frame", {
		Position = uDim2,
		Size = uDim2_1,
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p21.onSafeAreaEvent,
		[roactModule.Change.AbsolutePosition] = p21.onSafeAreaEvent
	}, p21.props[roactModule.Children])
end

function systemBar.renderList(p22, p23, p24)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref)
	return withStyleModule(function(p25)
		-- upvalues: cryoModule (copy), p23 (ref), p24 (ref), roactModule (copy), p22 (ref)
		local theme = p25.Theme
		
		return roactModule.createElement("Frame", {
			Position = p22.props.position or UDim2.new(0, 0, 0, 0),
			Size = p22.props.size or UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			ClipsDescendants = p22.props.clipsDescendants,
			LayoutOrder = p22.props.layoutOrder,
			BackgroundTransparency = p22.props.bgTransparency or 1,
			[roactModule.Change.AbsoluteSize] = function(p26)
				-- upvalues: p22 (copy)
				if p22.state.portrait and p26.AbsoluteSize.Y < p26.AbsoluteSize.X then
					p22:setState({ portrait = false })
					
					return
				elseif not p22.state.portrait and p26.AbsoluteSize.X < p26.AbsoluteSize.Y then
					p22:setState({ portrait = true })
				end
			end
		}, {
			NavBar = p22:renderBackground({
				BorderSizePixel = 0,
				BackgroundColor3 = theme.NavigationBar.Color,
				BackgroundTransparency = if p22.props.roundCorners then 1 else theme.NavigationBar.Transparency
			}, cryoModule.List.map(p23, function(_, p27)
				-- upvalues: p24 (copy)
				return p24(p27)
			end)),
			SafeArea = p22:renderSafeArea()
		}, {
			UICorner = p22.props.roundCorners and roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.15, 0) or nil }) or nil
		})
	end)
end

function systemBar.init(p28)
	p28:setState({ portrait = true })
	
	function p28.onSelectionChanged(p29)
		-- upvalues: p28 (ref)
		if #p29 > 0 then
			local var35 = p28.props.itemList[p29[1]]
			
			if var35 and var35.onActivated then
				var35.onActivated()
			end
		end
	end
	
	function p28.onSafeAreaEvent(p30)
		-- upvalues: p28 (ref)
		if p28.props.onSafeAreaChanged then
			p28.props.onSafeAreaChanged({
				Position = p30.Position,
				AbsolutePosition = p30.AbsolutePosition,
				Size = p30.Size,
				AbsoluteSize = p30.AbsoluteSize
			})
		end
	end
end

function systemBar.render(p31)
	-- upvalues: roactModule (ref), interactableListModule (ref), var17 (ref), var17 (ref)
	local itemList = p31.props.itemList
	local selection = p31.props.selection
	
	return roactModule.createElement(interactableListModule, {
		itemList = itemList,
		selection = selection and (if itemList[selection] == nil then nil else { selection }),
		itemSize = UDim2.fromOffset(var17, var17),
		renderList = function(...)
			-- upvalues: p31 (ref)
			return p31:renderList(...)
		end,
		renderItem = function(...)
			-- upvalues: p31 (ref)
			return p31:renderItem(...)
		end,
		sortOrder = p31.props.sortOrder,
		onSelectionChanged = p31.onSelectionChanged
	})
end

return systemBar
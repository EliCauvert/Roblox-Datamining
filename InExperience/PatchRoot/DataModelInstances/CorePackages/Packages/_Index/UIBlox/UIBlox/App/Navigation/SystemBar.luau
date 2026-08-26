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
local var1 = getIconSizeModule(iconSizeModule.Medium)
local var2 = var1 + 8
local var3 = (var2 - var1) / 2
local var4 = (var2 - var1) / 2
local var5 = var3 + 4
local var6 = var4 - 4
local var7 = 12 + (64 - var2) / 2
local var8 = 4 + (64 - var2)
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

function systemBar.isPortrait(p1)
	-- upvalues: placementModule (ref)
	return if p1.props.placement == placementModule.Left then false else p1.props.placement == placementModule.Bottom or p1.state.portrait
end

function systemBar.renderItem(p1, p2, p3, p4, p5)
	-- upvalues: controlStateModule (ref), placementModule (ref), roactModule (ref), badgeStatesModule (ref), tModule (ref), var3 (ref), var4 (ref), var6 (ref), var5 (ref), withAnimationModule (ref), withStyleModule (ref), imageSetComponentModule (ref), var1 (ref), var1 (ref), statusIndicator (ref), migrateBadgeVariantModule (ref), badgeVariantModule (ref), t (ref)
	local var9
	if p2.iconOn ~= nil then
		var9 = if p2.iconOff == nil then if p2.iconImageComponent == nil then p2.iconComponent ~= nil else true else true
	end
	assert(var9, "items must define either iconOn and iconOff or iconImageComponent or iconComponent")
	local var10 = p3 == controlStateModule.Pressed
	local var11 = var10 or p3 == controlStateModule.Hover
	
	if p2.iconComponent then
		return roactModule.createElement(p2.iconComponent, {
			placement = if p1:isPortrait() then placementModule.Bottom else placementModule.Left,
			hovered = var11,
			selected = p4,
			pressed = var10,
			badgeValue = p2.badgeValue
		}), { LayoutOrder = p5 }
	end
	local var12 = if p2.badgeValue then p2.badgeValue == badgeStatesModule.isEmpty or (if tModule.string(p2.badgeValue) then true else p2.badgeValue > 0) else false
	local var13 = var3
	local var14 = var4
	
	if var11 then
		if p1:isPortrait() then
			var14 = var6
		else
			var13 = var5
		end
	end
	return withAnimationModule({ positionX = var13, positionY = var14 }, function(p6)
		-- upvalues: withStyleModule (copy), roactModule (copy), p2 (ref), imageSetComponentModule (copy), var1 (copy), var1 (copy), p1 (ref), p4 (ref), var10 (ref), var12 (write), statusIndicator (copy), badgeStatesModule (copy), migrateBadgeVariantModule (copy), badgeVariantModule (copy)
		return withStyleModule(function(p7)
			-- upvalues: roactModule (copy), p2 (copy), imageSetComponentModule (copy), p6 (ref), var1 (copy), var1 (copy), p1 (copy), p4 (copy), var10 (copy), var12 (copy), statusIndicator (copy), badgeStatesModule (copy), migrateBadgeVariantModule (copy), badgeVariantModule (copy)
			return roactModule.createElement(p2.iconImageComponent or imageSetComponentModule.Label, {
				Position = UDim2.fromOffset(math.floor(p6.positionX + 0.5), math.floor(p6.positionY + 0.5)),
				Size = UDim2.fromOffset(var1, var1),
				BackgroundTransparency = if p1.props.buttonStroke then 0.99 else 1,
				Image = if p4 then p2.iconOn else p2.iconOff,
				ImageColor3 = p7.Theme.IconDefault.Color,
				ImageTransparency = if var10 then 0.5 else 0
			}, {
				Badge = var12 and roactModule.createElement(statusIndicator, {
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

function systemBar.renderPortrait(p1, p2, p3)
	-- upvalues: withAnimationModule (ref), roactModule (ref), cryoModule (ref), var2 (ref), t (ref)
	return withAnimationModule({
		offset = if p1.props.hidden then 0 else -p1.props.experimentalTabSizePortraitY
	}, function(p4)
		-- upvalues: roactModule (copy), cryoModule (copy), p2 (ref), p1 (ref), var2 (copy), p3 (ref)
		return roactModule.createElement("Frame", cryoModule.Dictionary.join(p2, {
			ZIndex = 99,
			Position = UDim2.new(0, 0, 1, math.floor(p4.offset + 0.5)),
			Size = UDim2.new(1, 0, 0, p1.props.experimentalTabSizePortraitY)
		}), {
			Layout = roactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
			InnerFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, cryoModule.Dictionary.join({
				Constraint = roactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(600, p1.props.experimentalTabSizePortraitY)
				}),
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = p1.props.layoutPaddingOffset + UDim.new(1 / #p1.props.itemList, -var2),
					SortOrder = p1.props.sortOrder
				}, {})
			}, p3))
		})
	end, t)
end

function systemBar.renderLandscape(p1, p2, p3, p4)
	-- upvalues: withAnimationModule (ref), roactModule (ref), cryoModule (ref), var7 (ref), var8 (ref), t (ref)
	return withAnimationModule({ offset = if p1.props.hidden then -64 else 0 }, function(p5)
		-- upvalues: roactModule (copy), cryoModule (copy), p2 (ref), p4 (ref), p1 (ref), var7 (copy), var8 (copy), p3 (ref)
		return roactModule.createElement("Frame", cryoModule.Dictionary.join(p2, {
			ZIndex = 99,
			Position = UDim2.new(0, math.floor(p5.offset + 0.5), 0, 0),
			Size = UDim2.new(0, 64, 1, 0),
			BackgroundTransparency = if p4 then 1 else nil
		}), cryoModule.Dictionary.join({
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = if not p4 then p1.props.firstItemPaddingOffset + UDim.new(0, var7) else nil,
				PaddingBottom = if p4 then p1.props.lastItemPaddingOffset + UDim.new(0, var8) else nil
			}),
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = if p4 then Enum.VerticalAlignment.Bottom else nil,
				Padding = p1.props.layoutPaddingOffset + UDim.new(0, var8),
				SortOrder = p1.props.sortOrder
			})
		}, p3))
	end, t)
end

function systemBar.renderBackground(value, p1, p2)
	-- upvalues: cryoModule (ref), roactModule (ref)
	if value:isPortrait() then
		return value:renderPortrait(p1, p2)
	end
	local var9 = cryoModule.List.filter(p2, function(_, p3)
		-- upvalues: value (ref)
		return value.props.itemList[p3].bottomAligned
	end)
	local var10 = value:renderLandscape(p1, cryoModule.List.filter(p2, function(_, p3)
		-- upvalues: value (ref)
		return not value.props.itemList[p3].bottomAligned
	end))
	
	if #var9 > 0 then
		var10 = roactModule.createFragment({
			NavBar = var10,
			BottomAlignedNavBar = value:renderLandscape(p1, var9, true)
		})
	end
	return var10
end

function systemBar.renderSafeArea(p1)
	-- upvalues: roactModule (ref)
	local uDim2, uDim2_1
	local _ = nil
	local _ = nil
	
	if p1.props.hidden then
		uDim2 = UDim2.new(0, 0, 0, 0)
		uDim2_1 = UDim2.new(1, 0, 1, 0)
	elseif p1:isPortrait() then
		uDim2 = UDim2.new(0, 0, 0, 0)
		uDim2_1 = UDim2.new(1, 0, 1, -p1.props.experimentalTabSizePortraitY)
	else
		uDim2 = UDim2.new(0, 64, 0, 0)
		uDim2_1 = UDim2.new(1, -64, 1, 0)
	end
	return roactModule.createElement("Frame", {
		Position = uDim2,
		Size = uDim2_1,
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p1.onSafeAreaEvent,
		[roactModule.Change.AbsolutePosition] = p1.onSafeAreaEvent
	}, p1.props[roactModule.Children])
end

function systemBar.renderList(p1, p2, p3)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref)
	return withStyleModule(function(p4)
		-- upvalues: cryoModule (copy), p2 (ref), p3 (ref), roactModule (copy), p1 (ref)
		local theme = p4.Theme
		
		return roactModule.createElement("Frame", {
			Position = p1.props.position or UDim2.new(0, 0, 0, 0),
			Size = p1.props.size or UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			ClipsDescendants = p1.props.clipsDescendants,
			LayoutOrder = p1.props.layoutOrder,
			BackgroundTransparency = p1.props.bgTransparency or 1,
			[roactModule.Change.AbsoluteSize] = function(p5)
				-- upvalues: p1 (copy)
				if p1.state.portrait and p5.AbsoluteSize.Y < p5.AbsoluteSize.X then
					p1:setState({ portrait = false })
					
					return
				elseif not p1.state.portrait and p5.AbsoluteSize.X < p5.AbsoluteSize.Y then
					p1:setState({ portrait = true })
				end
			end
		}, {
			NavBar = p1:renderBackground({
				BorderSizePixel = 0,
				BackgroundColor3 = theme.NavigationBar.Color,
				BackgroundTransparency = if p1.props.roundCorners then 1 else theme.NavigationBar.Transparency
			}, cryoModule.List.map(p2, function(_, p5)
				-- upvalues: p3 (copy)
				return p3(p5)
			end)),
			SafeArea = p1:renderSafeArea()
		}, {
			UICorner = p1.props.roundCorners and roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.15, 0) or nil }) or nil
		})
	end)
end

function systemBar.init(p1)
	p1:setState({ portrait = true })
	
	function p28.onSelectionChanged(p2)
		-- upvalues: p1 (ref)
		if #p2 > 0 then
			local var9 = p1.props.itemList[p2[1]]
			
			if var9 and var9.onActivated then
				var9.onActivated()
			end
		end
	end
	
	function p28.onSafeAreaEvent(p2)
		-- upvalues: p1 (ref)
		if p1.props.onSafeAreaChanged then
			p1.props.onSafeAreaChanged({
				Position = p2.Position,
				AbsolutePosition = p2.AbsolutePosition,
				Size = p2.Size,
				AbsoluteSize = p2.AbsoluteSize
			})
		end
	end
end

function systemBar.render(p1)
	-- upvalues: roactModule (ref), interactableListModule (ref), var2 (ref), var2 (ref)
	local itemList = p1.props.itemList
	local selection = p1.props.selection
	
	return roactModule.createElement(interactableListModule, {
		itemList = itemList,
		selection = selection and (if itemList[selection] == nil then nil else { selection }),
		itemSize = UDim2.fromOffset(var2, var2),
		renderList = function(...)
			-- upvalues: p1 (ref)
			return p1:renderList(...)
		end,
		renderItem = function(...)
			-- upvalues: p1 (ref)
			return p1:renderItem(...)
		end,
		sortOrder = p1.props.sortOrder,
		onSelectionChanged = p1.onSelectionChanged
	})
end

return systemBar
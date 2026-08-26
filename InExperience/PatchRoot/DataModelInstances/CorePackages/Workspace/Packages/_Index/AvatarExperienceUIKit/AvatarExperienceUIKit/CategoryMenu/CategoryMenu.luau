local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badge = foundationModule.Badge
local coachmark = foundationModule.Coachmark
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local inputSize = foundationModule.Enums.InputSize
local iconVariant = foundationModule.Enums.IconVariant
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCategoryMenuVisualFixes = avatarExperienceFlagsModule.FFlagAXCategoryMenuVisualFixes
local fFlagAXMigrateAllTabToSduiDev = avatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local AXCategoryMenuBadgePositionTokens2 = game:DefineFastFlag("AXCategoryMenuBadgePositionTokens2", false)
local tabGroupModule = require(avatarExperienceUIKit.TabGroup.TabGroup)
local categoryMenuButtonsLocationEnumModule = require(script.Parent.CategoryMenuButtonsLocationEnum)
local t = {
	FillDirection = Enum.FillDirection.Horizontal,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalFlex = Enum.UIFlexAlignment.Fill
}
local t_1 = {
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder
}
local t_2 = { FlexMode = Enum.UIFlexMode.Fill }

local function CategoryMenuButtonGroup(p1)
	-- upvalues: AXCategoryMenuBadgePositionTokens2 (ref), foundationModule (ref), reactModule (ref), fFlagAXMigrateAllTabToSduiDev (ref), iconVariant (ref), view (ref), iconButton (ref), inputSize (ref), badge (ref), badgeVariant (ref)
	local var1 = if AXCategoryMenuBadgePositionTokens2 then foundationModule.Hooks.useTokens() else nil
	local backgroundColor3 = p1.BackgroundColor3
	local backgroundTransparency = p1.BackgroundTransparency
	local var2 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p1 (ref), AXCategoryMenuBadgePositionTokens2 (copy), fFlagAXMigrateAllTabToSduiDev (copy), iconVariant (copy), view (copy), iconButton (copy), inputSize (copy), backgroundColor3 (ref), backgroundTransparency (ref), badge (copy), badgeVariant (copy), var1 (ref)
		local t = {
			FlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if p1.buttons then
			for i, v in p1.buttons do
				local id = `Button-{v.id}`
				
				if AXCategoryMenuBadgePositionTokens2 then
					local badgeCount = v.badgeCount
					t[id] = reactModule.createElement(view, { LayoutOrder = i, AutomaticSize = Enum.AutomaticSize.XY }, {
						IconButton = reactModule.createElement(iconButton, {
							onActivated = v.onActivated,
							icon = {
								name = v.icon,
								variant = v.iconVariant or (if fFlagAXMigrateAllTabToSduiDev then iconVariant.Regular else iconVariant.Filled)
							},
							size = inputSize.Medium,
							isDisabled = v.isDisabled,
							BackgroundColor3 = backgroundColor3,
							BackgroundTransparency = if backgroundTransparency ~= nil then 1 else backgroundTransparency
						}),
						CountBadge = if typeof(badgeCount) == "number" and badgeCount > 0 then reactModule.createElement(badge, {
							ZIndex = 2,
							text = if badgeCount > 99 then "99+" else tostring(badgeCount),
							variant = badgeVariant.Contrast,
							AnchorPoint = Vector2.new(1, 0),
							Position = if var1 then UDim2.new(1, var1.Gap.XXSmall, 0, -var1.Gap.XXSmall) else UDim2.new(1, 0, 0, -4)
						}) else nil
					})
				else
					t[id] = reactModule.createElement(iconButton, {
						onActivated = v.onActivated,
						LayoutOrder = i,
						icon = { name = v.icon, variant = iconVariant.Filled },
						size = inputSize.Small,
						isDisabled = v.isDisabled,
						BackgroundColor3 = backgroundColor3,
						BackgroundTransparency = if backgroundTransparency ~= nil then 1 else backgroundTransparency
					})
				end
			end
		end
		return t
	end, {
		p1.buttons,
		backgroundColor3,
		backgroundTransparency,
		var1
	})
	local var3 = nil
	
	if AXCategoryMenuBadgePositionTokens2 then
		local paddingRight = p1.paddingRight
		var3 = reactModule.useMemo(function()
			-- upvalues: paddingRight (ref)
			return if paddingRight then { right = paddingRight } else nil
		end, { paddingRight })
	end
	return reactModule.createElement(view, {
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p1.LayoutOrder,
		padding = var3
	}, var2)
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagAXCategoryMenuVisualFixes (ref), categoryMenuButtonsLocationEnumModule (ref), AXCategoryMenuBadgePositionTokens2 (ref), view (ref), t_1 (ref), t (ref), CategoryMenuButtonGroup (ref), t_2 (ref), tabGroupModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = foundationModule.Hooks.useTokens()
	local var5 = nil
	
	if fFlagAXCategoryMenuVisualFixes then
		local var6 = reactModule.useRef(nil)
		var5 = var6
		local var7 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), var6 (ref)
			if not var7.current then
				var7.current = true
				
				return
			end
			local current = var6.current
			
			if current then
				current.setOffset(0)
			end
		end, { p2.activeCategoryId })
	end
	local var8
	local activeTooltipIdx = p2.activeTooltipIdx
	local tooltips = p2.tooltips
	local var9 = if activeTooltipIdx and tooltips then tooltips[activeTooltipIdx] else nil
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), p2 (ref), var3 (ref)
		local t = {}
		
		if not var9 then
			return p2.categories
		end
		for i, v in p2.categories do
			if v.id == var9.anchorId then
				local cloned = table.clone(v)
				cloned.ref = var3
				table.insert(t, cloned)
			else
				table.insert(t, v)
			end
		end
		return t
	end, { p2.categories, var9 })
	local var11 = if p2.categoryBackgroundStyle then p2.categoryBackgroundStyle else var4.Color.Common.NavigationBar
	local var12 = if p2.subcategoryBackgroundStyle then p2.subcategoryBackgroundStyle else var4.Color.Common.NavigationBar
	local var13 = if p2.buttonsLocation then p2.buttonsLocation else categoryMenuButtonsLocationEnumModule.SubcategoriesStart
	
	if p2.buttons then
		var8 = #p2.buttons > 0
		var8 = nil
	else
		var8 = false
	end
	local var14
	local var15 = if AXCategoryMenuBadgePositionTokens2 then UDim.new(0, var4.Padding.Medium) else nil
	local subcategories = p2.subcategories
	
	if subcategories then
		var14 = #subcategories > 0
		var14 = nil
	else
		var14 = false
	end
	local var16
	local var17 = var14 or var8
	local createElement = reactModule.createElement
	local t_3 = {
		ref = p3,
		Position = p2.Position,
		LayoutOrder = p2.LayoutOrder,
		ZIndex = p2.ZIndex,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		layout = t_1
	}
	local t_4 = {
		CategoryRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = t
		}, {
			ButtonsStart = if var8 and var13 == categoryMenuButtonsLocationEnumModule.CategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p2.buttons,
				BackgroundColor3 = var11.Color3,
				BackgroundTransparency = var11.Transparency
			}) else nil,
			Categories = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = t_2
			}, {
				TabGroup = reactModule.createElement(tabGroupModule, {
					items = var10,
					activeTabId = p2.activeCategoryId,
					onTabActivated = p2.onCategoryActivated,
					tabFontStyle = p2.categoryFontStyle,
					tabPadding = p2.categoryPadding,
					tabTextStyle = p2.categoryTextStyle,
					tabActiveTextStyle = p2.categoryActiveTextStyle,
					BackgroundColor3 = var11.Color3,
					BackgroundTransparency = var11.Transparency
				})
			}),
			ButtonsEnd = if var8 and var13 == categoryMenuButtonsLocationEnumModule.CategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p2.buttons,
				BackgroundColor3 = var11.Color3,
				BackgroundTransparency = var11.Transparency,
				paddingRight = var15
			}) else nil
		})
	}
	
	if var17 then
		var16 = reactModule.createElement
		var16 = var16(view, {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = t
		}, {
			ButtonsStart = if var8 and var13 == categoryMenuButtonsLocationEnumModule.SubcategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p2.buttons,
				BackgroundColor3 = var12.Color3,
				BackgroundTransparency = var12.Transparency
			}) else nil,
			Subcategories = if var14 then reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = t_2
			}, {
				TabGroup = reactModule.createElement(tabGroupModule, {
					items = subcategories or {},
					activeTabId = p2.activeSubcategoryId,
					onTabActivated = p2.onSubcategoryActivated,
					tabFontStyle = p2.subcategoryFontStyle,
					tabPadding = p2.subcategoryPadding,
					tabTextStyle = p2.subcategoryTextStyle,
					tabActiveTextStyle = p2.subcategoryActiveTextStyle,
					BackgroundColor3 = var12.Color3,
					BackgroundTransparency = var12.Transparency,
					controllerRef = var5
				})
			}) else nil,
			ButtonsEnd = if var8 and var13 == categoryMenuButtonsLocationEnumModule.SubcategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p2.buttons,
				BackgroundColor3 = var12.Color3,
				BackgroundTransparency = var12.Transparency,
				paddingRight = var15
			}) else nil
		})
	else
		var16 = nil
	end
	t_4.SubcategoryRow = var16
	t_4.ToolTip = if var9 then reactModule.createElement(coachmark, {
		LayoutOrder = 3,
		title = var9.title,
		text = var9.text,
		isOpen = var9.isOpen,
		side = var9.side or popoverSide.Bottom,
		align = var9.align or popoverAlign.Center,
		anchorRef = var3,
		onClose = var9.onClose,
		actions = var9.actions
	}) else nil
	
	return createElement(view, t_3, t_4)
end)
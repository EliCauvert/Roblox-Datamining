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

local function CategoryMenuButtonGroup(p0)
	-- upvalues: AXCategoryMenuBadgePositionTokens2 (ref), foundationModule (ref), reactModule (ref), fFlagAXMigrateAllTabToSduiDev (ref), iconVariant (ref), view (ref), iconButton (ref), inputSize (ref), badge (ref), badgeVariant (ref)
	local var11 = if AXCategoryMenuBadgePositionTokens2 then foundationModule.Hooks.useTokens() else nil
	local backgroundColor3 = p0.BackgroundColor3
	local backgroundTransparency = p0.BackgroundTransparency
	local var12 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p0 (ref), AXCategoryMenuBadgePositionTokens2 (copy), fFlagAXMigrateAllTabToSduiDev (copy), iconVariant (copy), view (copy), iconButton (copy), inputSize (copy), backgroundColor3 (ref), backgroundTransparency (ref), badge (copy), badgeVariant (copy), var11 (ref)
		local t = {
			FlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if p0.buttons then
			for i, v in p0.buttons do
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
							Position = if var11 then UDim2.new(1, var11.Gap.XXSmall, 0, -var11.Gap.XXSmall) else UDim2.new(1, 0, 0, -4)
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
		p0.buttons,
		backgroundColor3,
		backgroundTransparency,
		var11
	})
	local var13 = nil
	
	if AXCategoryMenuBadgePositionTokens2 then
		local paddingRight = p0.paddingRight
		var13 = reactModule.useMemo(function()
			-- upvalues: paddingRight (ref)
			return if paddingRight then { right = paddingRight } else nil
		end, { paddingRight })
	end
	return reactModule.createElement(view, {
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p0.LayoutOrder,
		padding = var13
	}, var12)
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagAXCategoryMenuVisualFixes (ref), categoryMenuButtonsLocationEnumModule (ref), AXCategoryMenuBadgePositionTokens2 (ref), view (ref), t_1 (ref), t (ref), CategoryMenuButtonGroup (ref), t_2 (ref), tabGroupModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var16 = reactModule.useRef(nil)
	local var17 = foundationModule.Hooks.useTokens()
	local var18 = nil
	
	if fFlagAXCategoryMenuVisualFixes then
		local var19 = reactModule.useRef(nil)
		var18 = var19
		local var20 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var20 (ref), var19 (ref)
			if not var20.current then
				var20.current = true
				
				return
			end
			local current = var19.current
			
			if current then
				current.setOffset(0)
			end
		end, { p1.activeCategoryId })
	end
	local var26
	local activeTooltipIdx = p1.activeTooltipIdx
	local tooltips = p1.tooltips
	local var21 = if activeTooltipIdx and tooltips then tooltips[activeTooltipIdx] else nil
	local var22 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), p1 (ref), var16 (ref)
		local t = {}
		
		if not var21 then
			return p1.categories
		end
		for i, v in p1.categories do
			if v.id == var21.anchorId then
				local cloned = table.clone(v)
				cloned.ref = var16
				table.insert(t, cloned)
			else
				table.insert(t, v)
			end
		end
		return t
	end, { p1.categories, var21 })
	local var23 = if p1.categoryBackgroundStyle then p1.categoryBackgroundStyle else var17.Color.Common.NavigationBar
	local var24 = if p1.subcategoryBackgroundStyle then p1.subcategoryBackgroundStyle else var17.Color.Common.NavigationBar
	local var25 = if p1.buttonsLocation then p1.buttonsLocation else categoryMenuButtonsLocationEnumModule.SubcategoriesStart
	
	if p1.buttons then
		var26 = #p1.buttons > 0
		var26 = nil
	else
		var26 = false
	end
	local var28
	local var27 = if AXCategoryMenuBadgePositionTokens2 then UDim.new(0, var17.Padding.Medium) else nil
	local subcategories = p1.subcategories
	
	if subcategories then
		var28 = #subcategories > 0
		var28 = nil
	else
		var28 = false
	end
	local var32
	local var28_1 = var28 or var26
	local createElement = reactModule.createElement
	local t_3 = {
		ref = p2,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		ZIndex = p1.ZIndex,
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
			ButtonsStart = if var26 and var25 == categoryMenuButtonsLocationEnumModule.CategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p1.buttons,
				BackgroundColor3 = var23.Color3,
				BackgroundTransparency = var23.Transparency
			}) else nil,
			Categories = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = t_2
			}, {
				TabGroup = reactModule.createElement(tabGroupModule, {
					items = var22,
					activeTabId = p1.activeCategoryId,
					onTabActivated = p1.onCategoryActivated,
					tabFontStyle = p1.categoryFontStyle,
					tabPadding = p1.categoryPadding,
					tabTextStyle = p1.categoryTextStyle,
					tabActiveTextStyle = p1.categoryActiveTextStyle,
					BackgroundColor3 = var23.Color3,
					BackgroundTransparency = var23.Transparency
				})
			}),
			ButtonsEnd = if var26 and var25 == categoryMenuButtonsLocationEnumModule.CategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p1.buttons,
				BackgroundColor3 = var23.Color3,
				BackgroundTransparency = var23.Transparency,
				paddingRight = var27
			}) else nil
		})
	}
	
	if var28_1 then
		var32 = reactModule.createElement
		var32 = var32(view, {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = t
		}, {
			ButtonsStart = if var26 and var25 == categoryMenuButtonsLocationEnumModule.SubcategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p1.buttons,
				BackgroundColor3 = var24.Color3,
				BackgroundTransparency = var24.Transparency
			}) else nil,
			Subcategories = if var28 then reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = t_2
			}, {
				TabGroup = reactModule.createElement(tabGroupModule, {
					items = subcategories or {},
					activeTabId = p1.activeSubcategoryId,
					onTabActivated = p1.onSubcategoryActivated,
					tabFontStyle = p1.subcategoryFontStyle,
					tabPadding = p1.subcategoryPadding,
					tabTextStyle = p1.subcategoryTextStyle,
					tabActiveTextStyle = p1.subcategoryActiveTextStyle,
					BackgroundColor3 = var24.Color3,
					BackgroundTransparency = var24.Transparency,
					controllerRef = var18
				})
			}) else nil,
			ButtonsEnd = if var26 and var25 == categoryMenuButtonsLocationEnumModule.SubcategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p1.buttons,
				BackgroundColor3 = var24.Color3,
				BackgroundTransparency = var24.Transparency,
				paddingRight = var27
			}) else nil
		})
	else
		var32 = nil
	end
	t_4.SubcategoryRow = var32
	t_4.ToolTip = if var21 then reactModule.createElement(coachmark, {
		LayoutOrder = 3,
		title = var21.title,
		text = var21.text,
		isOpen = var21.isOpen,
		side = var21.side or popoverSide.Bottom,
		align = var21.align or popoverAlign.Center,
		anchorRef = var16,
		onClose = var21.onClose,
		actions = var21.actions
	}) else nil
	
	return createElement(view, t_3, t_4)
end)
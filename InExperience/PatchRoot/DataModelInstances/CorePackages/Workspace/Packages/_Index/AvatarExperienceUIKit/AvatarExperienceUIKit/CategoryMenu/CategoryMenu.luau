local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local coachmark = foundationModule.Coachmark
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local iconVariant = foundationModule.Enums.IconVariant
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
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

local function CategoryMenuButtonGroup(p0) --[[ line: 58 ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconVariant (ref), inputSize (ref), view (ref)
	local backgroundColor3 = p0.BackgroundColor3
	local backgroundTransparency = p0.BackgroundTransparency
	
	return reactModule.createElement(view, {
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p0.LayoutOrder
	}, reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: reactModule (copy), p0 (ref), iconButton (copy), iconVariant (copy), inputSize (copy), backgroundColor3 (ref), backgroundTransparency (ref)
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
				t[`Button-{v.id}`] = reactModule.createElement(iconButton, {
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
		return t
	end, { p0.buttons, backgroundColor3, backgroundTransparency }))
end

return reactModule.forwardRef(function(p1, p2) --[[ line: 140 | named "CategoryMenu" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), categoryMenuButtonsLocationEnumModule (ref), view (ref), t_1 (ref), t (ref), CategoryMenuButtonGroup (ref), t_2 (ref), tabGroupModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var17
	local var10 = reactModule.useRef(nil)
	local var11 = foundationModule.Hooks.useTokens()
	local activeTooltipIdx = p1.activeTooltipIdx
	local tooltips = p1.tooltips
	local var12 = if activeTooltipIdx and tooltips then tooltips[activeTooltipIdx] else nil
	local var13 = reactModule.useMemo(function() --[[ line: 147 ]]
		-- upvalues: var12 (ref), p1 (ref), var10 (ref)
		local t = {}
		
		if not var12 then
			return p1.categories
		end
		for i, v in p1.categories do
			if v.id == var12.anchorId then
				local cloned = table.clone(v)
				cloned.ref = var10
				table.insert(t, cloned)
			else
				table.insert(t, v)
			end
		end
		return t
	end, { p1.categories, var12 })
	local var14 = if p1.categoryBackgroundStyle then p1.categoryBackgroundStyle else var11.Color.Common.NavigationBar
	local var15 = if p1.subcategoryBackgroundStyle then p1.subcategoryBackgroundStyle else var11.Color.Common.NavigationBar
	local var16 = if p1.buttonsLocation then p1.buttonsLocation else categoryMenuButtonsLocationEnumModule.SubcategoriesStart
	
	if p1.buttons then
		var17 = #p1.buttons > 0
		var17 = nil
	else
		var17 = false
	end
	local var18
	local subcategories = p1.subcategories
	
	if subcategories then
		var18 = #subcategories > 0
		var18 = nil
	else
		var18 = false
	end
	local var22
	local var18_1 = var18 or var17
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
			ButtonsStart = if var17 and var16 == categoryMenuButtonsLocationEnumModule.CategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p1.buttons,
				BackgroundColor3 = var14.Color3,
				BackgroundTransparency = var14.Transparency
			}) else nil,
			Categories = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = t_2
			}, {
				TabGroup = reactModule.createElement(tabGroupModule, {
					items = var13,
					activeTabId = p1.activeCategoryId,
					onTabActivated = p1.onCategoryActivated,
					tabFontStyle = p1.categoryFontStyle,
					tabPadding = p1.categoryPadding,
					tabTextStyle = p1.categoryTextStyle,
					tabActiveTextStyle = p1.categoryActiveTextStyle,
					BackgroundColor3 = var14.Color3,
					BackgroundTransparency = var14.Transparency
				})
			}),
			ButtonsEnd = if var17 and var16 == categoryMenuButtonsLocationEnumModule.CategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p1.buttons,
				BackgroundColor3 = var14.Color3,
				BackgroundTransparency = var14.Transparency
			}) else nil
		})
	}
	
	if var18_1 then
		var22 = reactModule.createElement
		var22 = var22(view, {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = t
		}, {
			ButtonsStart = if var17 and var16 == categoryMenuButtonsLocationEnumModule.SubcategoriesStart then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = p1.buttons,
				BackgroundColor3 = var15.Color3,
				BackgroundTransparency = var15.Transparency
			}) else nil,
			Subcategories = if var18 then reactModule.createElement(view, {
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
					BackgroundColor3 = var15.Color3,
					BackgroundTransparency = var15.Transparency
				})
			}) else nil,
			ButtonsEnd = if var17 and var16 == categoryMenuButtonsLocationEnumModule.SubcategoriesEnd then reactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = p1.buttons,
				BackgroundColor3 = var15.Color3,
				BackgroundTransparency = var15.Transparency
			}) else nil
		})
	else
		var22 = nil
	end
	t_4.SubcategoryRow = var22
	t_4.ToolTip = if var12 then reactModule.createElement(coachmark, {
		LayoutOrder = 3,
		title = var12.title,
		text = var12.text,
		isOpen = var12.isOpen,
		side = var12.side or popoverSide.Bottom,
		align = var12.align or popoverAlign.Center,
		anchorRef = var10,
		onClose = var12.onClose,
		actions = var12.actions
	}) else nil
	
	return createElement(view, t_3, t_4)
end)
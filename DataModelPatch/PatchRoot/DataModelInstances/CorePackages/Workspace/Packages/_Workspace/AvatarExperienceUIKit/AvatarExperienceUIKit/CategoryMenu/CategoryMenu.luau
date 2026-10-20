local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local Coachmark = FoundationModule.Coachmark
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local InputSize = FoundationModule.Enums.InputSize
local IconVariant = FoundationModule.Enums.IconVariant
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXResetSubcategoryRowOnCategoryChange = AvatarExperienceFlagsModule.FFlagAXResetSubcategoryRowOnCategoryChange
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local AXCategoryMenuBadgePositionTokens = game:DefineFastFlag("AXCategoryMenuBadgePositionTokens", false)
local TabGroupModule = require(AvatarExperienceUIKit.TabGroup.TabGroup)
local CategoryMenuButtonsLocationEnumModule = require(script.Parent.CategoryMenuButtonsLocationEnum)
local Layout = {
	FillDirection = Enum.FillDirection.Horizontal,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalFlex = Enum.UIFlexAlignment.Fill
}
local Layout1 = {
	FillDirection = Enum.FillDirection.Vertical,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder
}
local FlexItem = { FlexMode = Enum.UIFlexMode.Fill }

local function CategoryMenuButtonGroup(Frame: Frame)
	-- upvalues: AXCategoryMenuBadgePositionTokens (copy), FoundationModule (copy), ReactModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), IconVariant (copy), View (copy), IconButton (copy), InputSize (copy), Badge (copy), BadgeVariant (copy)
	local UseTokensResult = if AXCategoryMenuBadgePositionTokens then FoundationModule.Hooks.useTokens() else nil
	local BackgroundColor3 = Frame.BackgroundColor3
	local BackgroundTransparency = Frame.BackgroundTransparency
	
	return ReactModule.createElement(View, {
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = Frame.LayoutOrder
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Frame (copy), AXCategoryMenuBadgePositionTokens (upval), FFlagAXMigrateAllTabToSduiDev (upval), IconVariant (upval), View (upval), IconButton (upval), InputSize (upval), BackgroundColor3 (copy), BackgroundTransparency (copy), Badge (upval), BadgeVariant (upval), UseTokensResult (copy)
		local Elements = {
			FlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if Frame.buttons then
			for LayoutOrder, button in Frame.buttons do
				local ButtonName: string = `Button-{button.id}`
				
				if AXCategoryMenuBadgePositionTokens then
					local BadgeCount: number = button.badgeCount
					local IsBadgeCountAbove: boolean = typeof(BadgeCount) == "number" and BadgeCount > 0
					local Regular = if FFlagAXMigrateAllTabToSduiDev then IconVariant.Regular else IconVariant.Filled
					Elements[ButtonName] = ReactModule.createElement(View, {
						LayoutOrder = LayoutOrder,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						IconButton = ReactModule.createElement(IconButton, {
							onActivated = button.onActivated,
							icon = {
								name = button.icon,
								variant = button.iconVariant or Regular
							},
							size = InputSize.Small,
							isDisabled = button.isDisabled,
							BackgroundColor3 = BackgroundColor3,
							BackgroundTransparency = if BackgroundTransparency == nil then 1 else BackgroundTransparency
						}),
						CountBadge = if IsBadgeCountAbove then ReactModule.createElement(Badge, {
							ZIndex = 2,
							text = if BadgeCount > 99 then "99+" else tostring(BadgeCount),
							variant = BadgeVariant.Contrast,
							AnchorPoint = Vector2.new(1, 0),
							Position = if UseTokensResult then UDim2.new(1, UseTokensResult.Gap.XXSmall, 0, -UseTokensResult.Gap.XXSmall) else UDim2.new(1, 0, 0, -4)
						}) else nil
					})
				else
					Elements[ButtonName] = ReactModule.createElement(IconButton, {
						onActivated = button.onActivated,
						LayoutOrder = LayoutOrder,
						icon = { name = button.icon, variant = IconVariant.Filled },
						size = InputSize.Small,
						isDisabled = button.isDisabled,
						BackgroundColor3 = BackgroundColor3,
						BackgroundTransparency = if BackgroundTransparency == nil then 1 else BackgroundTransparency
					})
				end
			end
		end
		return Elements
	end, {
		Frame.buttons,
		BackgroundColor3,
		BackgroundTransparency,
		UseTokensResult
	})))
end

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagAXResetSubcategoryRowOnCategoryChange (copy), CategoryMenuButtonsLocationEnumModule (copy), View (copy), Layout1 (copy), Layout (copy), CategoryMenuButtonGroup (copy), FlexItem (copy), TabGroupModule (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ControllerRef = nil
	
	if FFlagAXResetSubcategoryRowOnCategoryChange then
		local UseRefResult1 = ReactModule.useRef(nil)
		ControllerRef = UseRefResult1
		local UseRefResult2 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
			if not UseRefResult2.current then
				UseRefResult2.current = true
				
				return
			end
			local Current = UseRefResult1.current
			
			if Current then
				Current.setOffset(0)
			end
		end, { Frame.activeCategoryId })
	end
	local ActiveTooltipIdx = Frame.activeTooltipIdx
	local Tooltips = Frame.tooltips
	local Tooltip = if ActiveTooltipIdx and Tooltips then Tooltips[ActiveTooltipIdx] else nil
	local CategoryBackgroundStyle = if Frame.categoryBackgroundStyle then Frame.categoryBackgroundStyle else UseTokensResult.Color.Common.NavigationBar
	local SubcategoryBackgroundStyle = if Frame.subcategoryBackgroundStyle then Frame.subcategoryBackgroundStyle else UseTokensResult.Color.Common.NavigationBar
	local ButtonsLocation = if Frame.buttonsLocation then Frame.buttonsLocation else CategoryMenuButtonsLocationEnumModule.SubcategoriesStart
	local v1: boolean = if Frame.buttons then #Frame.buttons > 0 else false
	local Subcategories = Frame.subcategories
	local v2: boolean = if Subcategories then #Subcategories > 0 else false
	
	return ReactModule.createElement(View, {
		ref = Ref,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		layout = Layout1
	}, {
		CategoryRow = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = Layout
		}, {
			ButtonsStart = if v1 and ButtonsLocation == CategoryMenuButtonsLocationEnumModule.CategoriesStart then ReactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = Frame.buttons,
				BackgroundColor3 = CategoryBackgroundStyle.Color3,
				BackgroundTransparency = CategoryBackgroundStyle.Transparency
			}) else nil,
			Categories = ReactModule.createElement(View, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = FlexItem
			}, {
				TabGroup = ReactModule.createElement(TabGroupModule, {
					items = ReactModule.useMemo(function()
						-- upvalues: Tooltip (copy), Frame (copy), UseRefResult (copy)
						local List = {}
						
						if not Tooltip then
							return Frame.categories
						end
						for _, category in Frame.categories do
							if category.id == Tooltip.anchorId then
								local Copy = table.clone(category)
								Copy.ref = UseRefResult
								table.insert(List, Copy)
							else
								table.insert(List, category)
							end
						end
						return List
					end, { Frame.categories, Tooltip }),
					activeTabId = Frame.activeCategoryId,
					onTabActivated = Frame.onCategoryActivated,
					tabFontStyle = Frame.categoryFontStyle,
					tabPadding = Frame.categoryPadding,
					tabTextStyle = Frame.categoryTextStyle,
					tabActiveTextStyle = Frame.categoryActiveTextStyle,
					BackgroundColor3 = CategoryBackgroundStyle.Color3,
					BackgroundTransparency = CategoryBackgroundStyle.Transparency
				})
			}),
			ButtonsEnd = if v1 and ButtonsLocation == CategoryMenuButtonsLocationEnumModule.CategoriesEnd then ReactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = Frame.buttons,
				BackgroundColor3 = CategoryBackgroundStyle.Color3,
				BackgroundTransparency = CategoryBackgroundStyle.Transparency
			}) else nil
		}),
		SubcategoryRow = if v2 or v1 then ReactModule.createElement(View, {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = Layout
		}, {
			ButtonsStart = if v1 and ButtonsLocation == CategoryMenuButtonsLocationEnumModule.SubcategoriesStart then ReactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 1,
				buttons = Frame.buttons,
				BackgroundColor3 = SubcategoryBackgroundStyle.Color3,
				BackgroundTransparency = SubcategoryBackgroundStyle.Transparency
			}) else nil,
			Subcategories = if v2 then ReactModule.createElement(View, {
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				flexItem = FlexItem
			}, {
				TabGroup = ReactModule.createElement(TabGroupModule, {
					items = Subcategories or {},
					activeTabId = Frame.activeSubcategoryId,
					onTabActivated = Frame.onSubcategoryActivated,
					tabFontStyle = Frame.subcategoryFontStyle,
					tabPadding = Frame.subcategoryPadding,
					tabTextStyle = Frame.subcategoryTextStyle,
					tabActiveTextStyle = Frame.subcategoryActiveTextStyle,
					BackgroundColor3 = SubcategoryBackgroundStyle.Color3,
					BackgroundTransparency = SubcategoryBackgroundStyle.Transparency,
					controllerRef = ControllerRef
				})
			}) else nil,
			ButtonsEnd = if v1 and ButtonsLocation == CategoryMenuButtonsLocationEnumModule.SubcategoriesEnd then ReactModule.createElement(CategoryMenuButtonGroup, {
				LayoutOrder = 3,
				buttons = Frame.buttons,
				BackgroundColor3 = SubcategoryBackgroundStyle.Color3,
				BackgroundTransparency = SubcategoryBackgroundStyle.Transparency
			}) else nil
		}) else nil,
		ToolTip = if Tooltip then ReactModule.createElement(Coachmark, {
			LayoutOrder = 3,
			title = Tooltip.title,
			text = Tooltip.text,
			isOpen = Tooltip.isOpen,
			side = Tooltip.side or PopoverSide.Bottom,
			align = Tooltip.align or PopoverAlign.Center,
			anchorRef = UseRefResult,
			onClose = Tooltip.onClose,
			actions = Tooltip.actions
		}) else nil
	})
end)
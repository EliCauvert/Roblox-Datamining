local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local linkVariantModule = require(foundation.Enums.LinkVariant)
local iconModule = require(foundation.Components.Icon)
local iconButtonModule = require(foundation.Components.IconButton)
local linkModule = require(foundation.Components.Link)
local menuModule = require(foundation.Components.Menu)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local breadcrumbAccessoryModule = require(script.Parent.BreadcrumbAccessory)
local useBreadcrumbVariantsModule = require(script.Parent.useBreadcrumbVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	testId = "--foundation-breadcrumb",
	size = inputSizeModule.Medium
}

local function BreadcrumbItem(p1)
	-- upvalues: reactModule (ref), textModule (ref), linkModule (ref), linkVariantModule (ref), viewModule (ref), breadcrumbAccessoryModule (ref), iconModule (ref), icon (ref)
	local item = p1.item
	local variantProps = p1.variantProps
	local testId = p1.testId
	local _ = nil
	
	return reactModule.createElement(viewModule, {
		tag = variantProps.item.tag,
		ref = item.ref,
		onActivated = if p1.hasDropdown then p1.onDropdownActivated else nil,
		LayoutOrder = p1.LayoutOrder,
		testId = testId
	}, {
		Leading = if item.leading ~= nil then nil else reactModule.createElement(breadcrumbAccessoryModule, {
			LayoutOrder = 1,
			config = item.leading,
			variant = variantProps.accessory,
			testId = `{testId}--leading`
		}),
		ItemText = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = variantProps.itemText.tag }, {
			Text = if p1.isCurrent or item.onActivated == nil then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				Text = item.text,
				tag = if p1.isCurrent then variantProps.current.tag else variantProps.label.tag,
				testId = `{testId}--text`
			}) else reactModule.createElement(linkModule, {
				hasUnderline = false,
				LayoutOrder = 1,
				text = item.text,
				onActivated = item.onActivated,
				variant = linkVariantModule.Standard,
				size = p1.size,
				testId = `{testId}--link`
			}),
			Chevron = if p1.hasDropdown then reactModule.createElement(iconModule, {
				LayoutOrder = 2,
				name = icon.ChevronLargeDown,
				size = variantProps.accessory.iconSize,
				style = variantProps.accessory.style,
				testId = `{testId}--chevron`
			}) else nil
		})
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useBreadcrumbVariantsModule (ref), reactModule (ref), iconButtonModule (ref), icon (ref), buttonVariantModule (ref), BreadcrumbItem (ref), viewModule (ref), textModule (ref), menuModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useBreadcrumbVariantsModule(useTokensModule(), var1.size)
	local itemsCount = #var1.items
	local var3 = itemsCount > 4
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var6 (ref)
		if not var3 then
			var6(false)
		end
	end, { var3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(function(p3)
			return not p3
		end)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, {})
	local var9 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), var1 (ref)
		var6(false)
		local var10 = var1.items[p3]
		
		if var10 and var10.onActivated then
			var10.onActivated()
		end
	end, { var1.items })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var1 (ref), itemsCount (ref)
		if var3 then
			return {
				{ index = 1, item = var1.items[1] },
				{ overflow = true },
				{ item = var1.items[itemsCount], index = itemsCount }
			}
		end
		local t = {}
		
		for i, v in var1.items do
			table.insert(t, { item = v, index = i })
		end
		return t
	end, { var1.items, itemsCount, var3 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), itemsCount (ref), var1 (ref)
		local t = {}
		
		if var3 then
			for i = 2, itemsCount - 1 do
				local var12 = var1.items[i]
				table.insert(t, {
					id = i,
					text = var12.text,
					isDisabled = var12.onActivated == nil
				})
			end
		end
		return t
	end, { var1.items, itemsCount, var3 })
	local t_1 = {}
	
	for i, v in var10 do
		if v.overflow then
			t_1.Overflow = reactModule.createElement(iconButtonModule, {
				icon = icon.ThreeDotsHorizontal,
				onActivated = var7,
				ref = var4,
				size = var2.overflow.size,
				variant = buttonVariantModule.Standard,
				LayoutOrder = 2 * i - 1,
				testId = `{var1.testId}--overflow`
			})
		else
			local item = v.item
			local index = v.index
			local var13 = index == itemsCount
			t_1[`Item{index}`] = reactModule.createElement(BreadcrumbItem, {
				item = item,
				isCurrent = var13,
				hasDropdown = var13 and var1.onDropdownActivated ~= nil,
				onDropdownActivated = if var13 then var1.onDropdownActivated else nil,
				size = var1.size,
				variantProps = var2,
				LayoutOrder = 2 * i - 1,
				testId = item.testId or `{var1.testId}--item-{index}`
			})
		end
		if i ~= #var10 then
			local var14 = if v.overflow then "overflow" else v.index
			t_1[`Separator{var14}`] = reactModule.createElement(viewModule, {
				tag = var2.separator.tag,
				LayoutOrder = 2 * i,
				testId = `{var1.testId}--separator-{var32}`
			}, {
				Slash = reactModule.createElement(textModule, {
					Text = "/",
					LayoutOrder = 1,
					tag = var2.separator.textTag,
					testId = `{var1.testId}--separator-{var32}--text`
				})
			})
		end
	end
	if var3 then
		t_1.OverflowMenu = reactModule.createElement(menuModule, {
			isOpen = var5,
			items = var11,
			size = var1.size,
			anchorRef = var4,
			onActivated = var9,
			onPressedOutside = var8,
			LayoutOrder = #var10 * 2,
			testId = `{var1.testId}--overflow-menu`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var2.container.tag, ref = p2 }), t_1)
end))
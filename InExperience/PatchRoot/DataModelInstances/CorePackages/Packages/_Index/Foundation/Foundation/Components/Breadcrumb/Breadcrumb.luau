local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local linkVariantModule = require(foundation.Enums.LinkVariant)
local iconButtonModule = require(foundation.Components.IconButton)
local linkModule = require(foundation.Components.Link)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local devAssertModule = require(foundation.Utility.devAssert)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local breadcrumbAccessoryModule = require(script.Parent.BreadcrumbAccessory)
local useBreadcrumbVariantsModule = require(script.Parent.useBreadcrumbVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	separator = "/",
	maxItems = 8,
	itemsBeforeCollapse = 1,
	itemsAfterCollapse = 1,
	testId = "--foundation-breadcrumb",
	size = inputSizeModule.Medium
}

local function BreadcrumbItem(p1)
	-- upvalues: reactModule (ref), textModule (ref), linkModule (ref), linkVariantModule (ref), viewModule (ref), breadcrumbAccessoryModule (ref)
	local item = p1.item
	local variantProps = p1.variantProps
	local testId = p1.testId
	local _ = nil
	
	return reactModule.createElement(viewModule, {
		tag = variantProps.item.tag,
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
				textStyle = if p1.isCurrent then variantProps.current.style else variantProps.label.style,
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
			Trailing = if item.trailing ~= nil then nil else reactModule.createElement(breadcrumbAccessoryModule, {
				LayoutOrder = 2,
				config = item.trailing,
				variant = variantProps.accessory,
				testId = `{testId}--trailing`
			})
		})
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useBreadcrumbVariantsModule (ref), devAssertModule (ref), reactModule (ref), iconButtonModule (ref), icon (ref), buttonVariantModule (ref), BreadcrumbItem (ref), viewModule (ref), textModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useBreadcrumbVariantsModule(useTokensModule(), var1.size)
	devAssertModule(#var1.items > 0, "Breadcrumb: `items` must contain at least one item.")
	local itemsCount = #var1.items
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(true)
	end, {})
	local var6 = reactModule.useRef(itemsCount)
	
	if var6.current ~= itemsCount then
		var6.current = itemsCount
		var4(false)
	end
	local var7 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var3 (ref), itemsCount (ref)
		local itemsBeforeCollapse = var1.itemsBeforeCollapse
		local itemsAfterCollapse = var1.itemsAfterCollapse
		local t = {}
		
		if var3 or var1.maxItems >= itemsCount or itemsBeforeCollapse + itemsAfterCollapse >= itemsCount then
			for i_2, v in var1.items do
				table.insert(t, { item = v, index = i_2 })
			end
			return t
		else
			for i = 1, itemsBeforeCollapse do
				table.insert(t, { item = var1.items[i], index = i })
			end
			table.insert(t, { overflow = true })
			
			for i_1 = itemsCount - itemsAfterCollapse + 1, itemsCount do
				table.insert(t, { item = var1.items[i_1], index = i_1 })
			end
			return t
		end
	end, {
		var1.items, var1.maxItems, var1.itemsBeforeCollapse,
		var1.itemsAfterCollapse, var3, itemsCount
	})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var2.container.tag, ref = p2 }), reactModule.useMemo(function()
		-- upvalues: var7 (ref), reactModule (copy), iconButtonModule (copy), icon (copy), var5 (ref), var2 (ref), buttonVariantModule (copy), var1 (ref), BreadcrumbItem (copy), itemsCount (ref), viewModule (copy), textModule (copy)
		local t = {}
		
		for i, v in var7 do
			if v.overflow then
				t.Overflow = reactModule.createElement(iconButtonModule, {
					icon = icon.ThreeDotsHorizontal,
					onActivated = var5,
					size = var2.overflow.size,
					variant = buttonVariantModule.Standard,
					LayoutOrder = 2 * i - 1,
					testId = `{var1.testId}--overflow`
				})
			else
				local item = v.item
				local index = v.index
				t[`Item{index}`] = reactModule.createElement(BreadcrumbItem, {
					item = item,
					isCurrent = index == itemsCount,
					size = var1.size,
					variantProps = var2,
					LayoutOrder = 2 * i - 1,
					testId = item.testId or `{var1.testId}--item-{index}`
				})
			end
			if i ~= #var7 then
				local var8 = if v.overflow then "overflow" else v.index
				t[`Separator{var8}`] = reactModule.createElement(viewModule, {
					tag = var2.separator.tag,
					LayoutOrder = 2 * i,
					testId = `{var1.testId}--separator-{var27}`
				}, {
					Slash = reactModule.createElement(textModule, {
						LayoutOrder = 1,
						Text = var1.separator,
						tag = var2.separator.textTag,
						textStyle = var2.separator.style,
						testId = `{var1.testId}--separator-{var27}--text`
					})
				})
			end
		end
		return t
	end, {
		var7, var2, var1.size, var1.separator, var1.testId, var5, itemsCount
	}))
end))
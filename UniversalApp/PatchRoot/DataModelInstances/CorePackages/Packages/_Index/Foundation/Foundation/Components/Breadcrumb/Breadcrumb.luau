local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Icon = require(Parent.BuilderIcons).Icon
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local LinkVariantModule = require(Foundation.Enums.LinkVariant)
local IconModule = require(Foundation.Components.Icon)
local IconButtonModule = require(Foundation.Components.IconButton)
local LinkModule = require(Foundation.Components.Link)
local MenuModule = require(Foundation.Components.Menu)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local BreadcrumbAccessoryModule = require(script.Parent.BreadcrumbAccessory)
local UseBreadcrumbVariantsModule = require(script.Parent.useBreadcrumbVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	testId = "--foundation-breadcrumb",
	size = require(Foundation.Enums.InputSize).Medium
}

local function BreadcrumbItem(Frame) --[[ Line: 90 ]]
	-- upvalues: ReactModule (copy), TextModule (copy), LinkModule (copy), LinkVariantModule (copy), ViewModule (copy), BreadcrumbAccessoryModule (copy), IconModule (copy), Icon (copy)
	local Item = Frame.item
	local VariantProps = Frame.variantProps
	local TestId = Frame.testId
	
	return ReactModule.createElement(ViewModule, {
		tag = VariantProps.item.tag,
		ref = Item.ref,
		onActivated = if Frame.hasDropdown then Frame.onDropdownActivated else nil,
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, {
		Leading = if Item.leading == nil then nil else ReactModule.createElement(BreadcrumbAccessoryModule, {
			LayoutOrder = 1,
			config = Item.leading,
			variant = VariantProps.accessory,
			testId = `{TestId}--leading`
		}),
		ItemText = ReactModule.createElement(ViewModule, { LayoutOrder = 2, tag = VariantProps.itemText.tag }, {
			Text = if Frame.isCurrent or Item.onActivated == nil then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				Text = Item.text,
				tag = if Frame.isCurrent then VariantProps.current.tag else VariantProps.label.tag,
				testId = `{TestId}--text`
			}) else ReactModule.createElement(LinkModule, {
				hasUnderline = false,
				LayoutOrder = 1,
				text = Item.text,
				onActivated = Item.onActivated,
				variant = LinkVariantModule.Standard,
				size = Frame.size,
				testId = `{TestId}--link`
			}),
			Chevron = if Frame.hasDropdown then ReactModule.createElement(IconModule, {
				LayoutOrder = 2,
				name = Icon.ChevronLargeDown,
				size = VariantProps.accessory.iconSize,
				style = VariantProps.accessory.style,
				testId = `{TestId}--chevron`
			}) else nil
		})
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 148 | Named "Breadcrumb" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseBreadcrumbVariantsModule (copy), ReactModule (copy), IconButtonModule (copy), Icon (copy), ButtonVariantModule (copy), BreadcrumbItem (copy), ViewModule (copy), TextModule (copy), MenuModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseBreadcrumbVariantsModuleResult = UseBreadcrumbVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	local CountItems = #WithDefaultsModuleResult.items
	local IsCountItemsAbove = CountItems > 4
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 158 ]]
		-- upvalues: IsCountItemsAbove (copy), UseStateResult2 (copy)
		if not IsCountItemsAbove then
			UseStateResult2(false)
		end
	end, { IsCountItemsAbove })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 164 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean --[[ Line: 165 ]]
			return not p2
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 169 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 173 ]]
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(false)
		local Item = WithDefaultsModuleResult.items[p2]
		
		if Item and Item.onActivated then
			Item.onActivated()
		end
	end, { WithDefaultsModuleResult.items })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 181 ]]
		-- upvalues: IsCountItemsAbove (copy), WithDefaultsModuleResult (copy), CountItems (copy)
		if IsCountItemsAbove then
			return {
				{ index = 1, item = WithDefaultsModuleResult.items[1] },
				{ overflow = true },
				{
					item = WithDefaultsModuleResult.items[CountItems],
					index = CountItems
				}
			}
		end
		local List = {}
		
		for Index, item in WithDefaultsModuleResult.items do
			table.insert(List, { item = item, index = Index })
		end
		return List
	end, {
		WithDefaultsModuleResult.items,
		CountItems,
		IsCountItemsAbove
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 196 ]]
		-- upvalues: IsCountItemsAbove (copy), CountItems (copy), WithDefaultsModuleResult (copy)
		local List = {}
		
		if IsCountItemsAbove then
			for i = 2, CountItems - 1 do
				local Item = WithDefaultsModuleResult.items[i]
				table.insert(List, {
					id = i,
					text = Item.text,
					isDisabled = Item.onActivated == nil
				})
			end
		end
		return List
	end, {
		WithDefaultsModuleResult.items,
		CountItems,
		IsCountItemsAbove
	})
	local Elements = {}
	
	for i, value in UseMemoResult do
		if value.overflow then
			Elements.Overflow = ReactModule.createElement(IconButtonModule, {
				icon = Icon.ThreeDotsHorizontal,
				onActivated = UseResult,
				ref = UseRefResult,
				size = UseBreadcrumbVariantsModuleResult.overflow.size,
				variant = ButtonVariantModule.Standard,
				LayoutOrder = 2 * i - 1,
				testId = `{WithDefaultsModuleResult.testId}--overflow`
			})
		else
			local Item = value.item
			local Index = value.index
			local IsIndexMatch = Index == CountItems
			Elements[`Item{Index}`] = ReactModule.createElement(BreadcrumbItem, {
				item = Item,
				isCurrent = IsIndexMatch,
				hasDropdown = IsIndexMatch and WithDefaultsModuleResult.onDropdownActivated ~= nil,
				onDropdownActivated = if IsIndexMatch then WithDefaultsModuleResult.onDropdownActivated else nil,
				size = WithDefaultsModuleResult.size,
				variantProps = UseBreadcrumbVariantsModuleResult,
				LayoutOrder = 2 * i - 1,
				testId = Item.testId or `{WithDefaultsModuleResult.testId}--item-{Index}`
			})
		end
		if i ~= #UseMemoResult then
			local Overflow = if value.overflow then "overflow" else value.index
			Elements[`Separator{Overflow}`] = ReactModule.createElement(ViewModule, {
				tag = UseBreadcrumbVariantsModuleResult.separator.tag,
				LayoutOrder = 2 * i,
				testId = `{WithDefaultsModuleResult.testId}--separator-{Overflow}`
			}, {
				Slash = ReactModule.createElement(TextModule, {
					Text = "/",
					LayoutOrder = 1,
					tag = UseBreadcrumbVariantsModuleResult.separator.textTag,
					testId = `{WithDefaultsModuleResult.testId}--separator-{Overflow}--text`
				})
			})
		end
	end
	if IsCountItemsAbove then
		Elements.OverflowMenu = ReactModule.createElement(MenuModule, {
			isOpen = UseStateResult,
			items = UseMemoResult1,
			size = WithDefaultsModuleResult.size,
			anchorRef = UseRefResult,
			onActivated = UseResult2,
			onPressedOutside = UseResult1,
			LayoutOrder = #UseMemoResult * 2,
			testId = `{WithDefaultsModuleResult.testId}--overflow-menu`
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseBreadcrumbVariantsModuleResult.container.tag,
		ref = Ref
	}), Elements)
end))
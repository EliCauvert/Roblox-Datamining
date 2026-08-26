local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local components = foundation.Components
local checkboxModule = require(components.Checkbox)
local dividerModule = require(components.Divider)
local flagsModule = require(foundation.Utility.Flags)
local iconModule = require(components.Icon)
local inputSizeModule = require(foundation.Enums.InputSize)
local listItemInputTypeModule = require(foundation.Enums.ListItemInputType)
local radioGroupModule = require(components.RadioGroup)
local textModule = require(components.Text)
local toggleModule = require(components.Toggle)
local _ = require(foundation.Components.Types)
local viewModule = require(components.View)
local devAssertModule = require(foundation.Utility.devAssert)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useListItemVariantsModule = require(script.Parent.useListItemVariants)
local listAccessoryModule = require(script.Parent.ListAccessory)
local useListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local useListModule = require(script.Parent.Parent.useList)
local t = {
	[inputSizeModule.XSmall] = "gap-xxsmall",
	[inputSizeModule.Small] = "gap-xxsmall",
	[inputSizeModule.Medium] = "gap-xsmall",
	[inputSizeModule.Large] = "gap-xsmall"
}
local t_1 = {}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), flagsModule (ref), devAssertModule (ref), useListModule (ref), inputSizeModule (ref), useTokensModule (ref), useListItemVariantsModule (ref), useListAccessoryVariantsModule (ref), t (ref), reactModule (ref), listItemInputTypeModule (ref), viewModule (ref), listAccessoryModule (ref), textModule (ref), escapeRichTextModule (ref), iconModule (ref), builderIconsModule (ref), radioGroupModule (ref), checkboxModule (ref), toggleModule (ref), dividerModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	
	if flagsModule.FoundationListItemDecoupledInput then
		devAssertModule(not (var1.onActivated ~= nil and (typeof(var1.input) == "table" and var1.input.onActivated ~= nil)), "ListItem: set `onActivated` on the item or on `input`, not both.")
	end
	local var2
	local var3 = useListModule()
	local size = var3.size or inputSizeModule.Medium
	local var4 = useTokensModule()
	local var5 = useListItemVariantsModule(var4, size)
	local var6 = useListAccessoryVariantsModule(var4, size, "Icon")
	local var7 = if flagsModule.FoundationListItemTypographySpacing then t[size] else "gap-small"
	local var8 = typeof(var1.onActivated) == "table" and var1.onActivated.onActivated ~= nil
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var1 (ref)
		return if var8 then var1.onActivated.onActivated elseif var1.onActivated == nil then nil else var1.onActivated
	end, { var1.onActivated, var8 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var1 (ref), var8 (ref), listItemInputTypeModule (copy)
		if not flagsModule.FoundationListItemDecoupledInput then
			return nil
		elseif var1.input == nil then
			if var8 then
				local onActivated = var1.onActivated
				
				return {
					type = onActivated.inputType or listItemInputTypeModule.Chevron,
					isChecked = onActivated.isChecked
				}
			end
			return if var1.onActivated == nil then nil else { type = listItemInputTypeModule.Chevron }
		elseif typeof(var1.input) == "table" then
			local input = var1.input
			
			return {
				type = input.type,
				isChecked = input.isChecked,
				onActivated = input.onActivated
			}
		end
		return { type = var1.input }
	end, { var1.onActivated, var1.input, var8 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var1 (ref)
		return if var8 then var1.onActivated.inputType else nil
	end, { var1.onActivated, var8 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var1 (ref)
		return if var8 then var1.onActivated.isChecked else nil
	end, { var1.onActivated, var8 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if typeof(var1.title) == "string" then var1.title elseif typeof(var1.title) == "table" then var1.title.title else nil
	end, { var1.title })
	local var14 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if typeof(var1.title) == "table" then if var1.title.title == nil then nil else var1.title.metadata else nil
	end, { var1.title })
	var1.testId = if var1.testId then var1.testId else `{var3.testId}--item-{reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		return var13 and string.gsub(var13, "%s+", "-") or ""
	end, { var35 })}`
	
	if flagsModule.FoundationListItemDecoupledInput then
		var37 = false
		
		if var32 ~= nil then
			local _ = var32.type ~= listItemInputTypeModule.None
		end
	else
		var37 = var23.onActivated ~= nil
	end
	local var1
	local var2 = if flagsModule.FoundationListItemDecoupledInput then if var32 then var32.type else nil else var33
	local var3 = if flagsModule.FoundationListItemDecoupledInput then if var32 then var32.isChecked else nil else var34
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: flagsModule (copy), var32 (ref), var31 (ref)
		if flagsModule.FoundationListItemDecoupledInput and var32 and var32.onActivated then
			var32.onActivated(p1)
			
			return
		elseif var31 then
			var31()
		end
	end, { var32, var31 })
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref)
		var4(p1 == "radio")
	end, { var4 })
	local createElement = reactModule.createElement
	local t_2 = {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var23.LayoutOrder,
		ref = p1
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local t_4 = {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = 1,
		padding = if var24.isContained then var26.Padding.Small else {
			left = UDim.new(0, if var24.hasMargin then var26.Padding.Small else -var26.Padding.Small),
			right = UDim.new(0, if var24.hasMargin then var26.Padding.Small else -var26.Padding.Small)
		}
	}
	local t_5 = {}
	local createElement_2 = reactModule.createElement
	local var6 = viewModule
	local t_6 = {
		onActivated = var31,
		tag = {
			["size-full-0 auto-y radius-medium"] = true,
			["margin-x-small"] = var24.hasMargin,
			["padding-x-small"] = not var24.hasMargin
		}
	}
	local t_7 = {}
	local createElement_3 = reactModule.createElement
	local var7 = viewModule
	local t_8 = {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
		testId = var23.testId
	}
	local t_9 = {
		LeadingContainer = if var23.leading then reactModule.createElement(listAccessoryModule, {
			LayoutOrder = 0,
			config = var23.leading,
			size = size,
			testId = `{var23.testId}--leading-accessory`
		}) else nil
	}
	local createElement_4 = reactModule.createElement
	local t_10 = {
		tag = "row flex-between align-x-center align-y-center fill gap-medium auto-y",
		LayoutOrder = 1
	}
	local t_11 = {
		TextContainer = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = {
				["col fill auto-y padding-y-xsmall"] = true,
				[var29] = true
			}
		}, {
			TitleContainer = if var35 then reactModule.createElement(viewModule, {
				LayoutOrder = 0,
				tag = {
					["col auto-xy"] = true,
					["gap-xsmall"] = not flagsModule.FoundationListItemTypographySpacing
				}
			}, {
				Title = if var35 then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 0,
					Text = escapeRichTextModule(var35),
					tag = var27.title.tag
				}) else nil,
				Metadata = if var36 then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 1,
					Text = var36,
					tag = var27.metadata.tag
				}) else nil
			}) else nil,
			Description = var23.description and reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 1,
				Text = var23.description,
				tag = var27.description.tag
			})
		}),
		TrailingContainer = if var23.trailing then reactModule.createElement(viewModule, {
			tag = "align-x-center align-y-center auto-xy",
			LayoutOrder = 2
		}, var23.trailing) else nil
	}
	
	if var37 then
		var1 = reactModule.createElement
		var1 = var1(viewModule, {
			tag = "align-x-center align-y-center auto-xy",
			LayoutOrder = 3
		}, {
			ActivatedIcon = if var2 == nil or flagsModule.FoundationListItemDecoupledInput and var2 == listItemInputTypeModule.Chevron then reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.ChevronLargeRight,
				size = var27.icon.size,
				testId = `{var23.testId}--activated-icon`
			}) elseif var2 == listItemInputTypeModule.Radio then reactModule.createElement(radioGroupModule.Root, {
				Selectable = false,
				value = if var3 then "radio" else "",
				onValueChanged = var5
			}, reactModule.createElement(radioGroupModule.Item, { value = "radio", label = "", size = size })) else reactModule.createElement(if var2 == listItemInputTypeModule.Checkbox then checkboxModule else toggleModule, {
				label = "",
				Selectable = false,
				onActivated = var4,
				isChecked = var3,
				size = size
			})
		})
	else
		var1 = nil
	end
	t_11.ActivatedIconContainer = var1
	t_9.Content = createElement_4(viewModule, t_10, t_11)
	t_7.ListItem = createElement_3(var7, t_8, t_9)
	t_5.ListItemContainer = createElement_2(var6, t_6, t_7)
	t_3.HoverWrapper = createElement_1(viewModule, t_4, t_5)
	t_3.Divider = if var24.hasDivider and var23.LayoutOrder ~= var24.lastLayoutOrder then if var24.isInset then reactModule.createElement(viewModule, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
		LeadingSpacer = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			Size = UDim2.fromOffset((if var24.hasMargin then var26.Padding.Small + var26.Margin.Small else 0) + (if var23.leading then var28.container.Size.X.Offset + var26.Gap.Medium else 0), 0)
		}),
		DividerLine = reactModule.createElement(viewModule, { tag = "fill auto-y", LayoutOrder = 1 }, reactModule.createElement(dividerModule))
	}) else reactModule.createElement(dividerModule, { LayoutOrder = 2 }) else nil
	
	return createElement(viewModule, t_2, t_3)
end))
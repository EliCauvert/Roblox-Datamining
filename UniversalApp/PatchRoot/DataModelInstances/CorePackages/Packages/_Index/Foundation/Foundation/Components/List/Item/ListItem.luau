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
local t = {}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 84 | named "ListItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), devAssertModule (ref), useListModule (ref), inputSizeModule (ref), useTokensModule (ref), useListItemVariantsModule (ref), useListAccessoryVariantsModule (ref), reactModule (ref), listItemInputTypeModule (ref), viewModule (ref), listAccessoryModule (ref), textModule (ref), escapeRichTextModule (ref), iconModule (ref), builderIconsModule (ref), radioGroupModule (ref), checkboxModule (ref), toggleModule (ref), dividerModule (ref)
	local var22 = withDefaultsModule(p0, t)
	
	if flagsModule.FoundationListItemDecoupledInput then
		devAssertModule(not (var22.onActivated ~= nil and (typeof(var22.input) == "table" and var22.input.onActivated ~= nil)), "ListItem: set `onActivated` on the item or on `input`, not both.")
	end
	local var35
	local var23 = useListModule()
	local size = var23.size or inputSizeModule.Medium
	local var25 = useTokensModule()
	local var26 = useListItemVariantsModule(var25, size)
	local var27 = useListAccessoryVariantsModule(var25, size, "Icon")
	local var28 = typeof(var22.onActivated) == "table" and var22.onActivated.onActivated ~= nil
	local var29 = reactModule.useMemo(function() --[[ line: 109 ]]
		-- upvalues: var28 (ref), var22 (ref)
		return if var28 then var22.onActivated.onActivated elseif var22.onActivated == nil then nil else var22.onActivated
	end, { var22.onActivated, var28 })
	local var30 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: flagsModule (copy), var22 (ref), var28 (ref), listItemInputTypeModule (copy)
		if not flagsModule.FoundationListItemDecoupledInput then
			return nil
		elseif var22.input == nil then
			if var28 then
				local onActivated = var22.onActivated
				
				return {
					type = onActivated.inputType or listItemInputTypeModule.Chevron,
					isChecked = onActivated.isChecked
				}
			end
			return if var22.onActivated == nil then nil else { type = listItemInputTypeModule.Chevron }
		elseif typeof(var22.input) == "table" then
			local input = var22.input
			
			return {
				type = input.type,
				isChecked = input.isChecked,
				onActivated = input.onActivated
			}
		end
		return { type = var22.input }
	end, { var22.onActivated, var22.input, var28 })
	local var31 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: var28 (ref), var22 (ref)
		return if var28 then var22.onActivated.inputType else nil
	end, { var22.onActivated, var28 })
	local var32 = reactModule.useMemo(function() --[[ line: 149 ]]
		-- upvalues: var28 (ref), var22 (ref)
		return if var28 then var22.onActivated.isChecked else nil
	end, { var22.onActivated, var28 })
	local var33 = reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: var22 (ref)
		return if typeof(var22.title) == "string" then var22.title elseif typeof(var22.title) == "table" then var22.title.title else nil
	end, { var22.title })
	local var34 = reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: var22 (ref)
		return if typeof(var22.title) == "table" then if var22.title.title == nil then nil else var22.title.metadata else nil
	end, { var22.title })
	var22.testId = if var22.testId then var22.testId else `{var23.testId}--item-{reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: var33 (ref)
		return var33 and string.gsub(var33, "%s+", "-") or ""
	end, { var33 })}`
	
	if flagsModule.FoundationListItemDecoupledInput then
		var35 = false
		
		if var30 ~= nil then
			local _ = var30.type ~= listItemInputTypeModule.None
		end
	else
		var35 = var22.onActivated ~= nil
	end
	local var52
	local var36 = if flagsModule.FoundationListItemDecoupledInput then if var30 then var30.type else nil else var31
	local var37 = if flagsModule.FoundationListItemDecoupledInput then if var30 then var30.isChecked else nil else var32
	local var38 = reactModule.useCallback(function(p2) --[[ line: 190 ]]
		-- upvalues: flagsModule (copy), var30 (ref), var29 (ref)
		if flagsModule.FoundationListItemDecoupledInput and var30 and var30.onActivated then
			var30.onActivated(p2)
			
			return
		elseif var29 then
			var29()
		end
	end, { var30, var29 })
	local var39 = reactModule.useCallback(function(p3) --[[ line: 198 ]]
		-- upvalues: var38 (ref)
		var38(p3 == "radio")
	end, { var38 })
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var22.LayoutOrder,
		ref = p1
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = 1,
		padding = if var23.isContained then var25.Padding.Small else {
			left = UDim.new(0, if var23.hasMargin then var25.Padding.Small else -var25.Padding.Small),
			right = UDim.new(0, if var23.hasMargin then var25.Padding.Small else -var25.Padding.Small)
		}
	}
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local var44 = viewModule
	local t_5 = {
		onActivated = var29,
		tag = {
			["size-full-0 auto-y radius-medium"] = true,
			["margin-x-small"] = var23.hasMargin,
			["padding-x-small"] = not var23.hasMargin
		}
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local var47 = viewModule
	local t_7 = {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
		testId = var22.testId
	}
	local t_8 = {
		LeadingContainer = if var22.leading then reactModule.createElement(listAccessoryModule, {
			LayoutOrder = 0,
			config = var22.leading,
			size = size,
			testId = `{var22.testId}--leading-accessory`
		}) else nil
	}
	local createElement_4 = reactModule.createElement
	local t_9 = {
		tag = "row flex-between align-x-center align-y-center fill gap-medium auto-y",
		LayoutOrder = 1
	}
	local t_10 = {
		TextContainer = reactModule.createElement(viewModule, {
			tag = "col fill gap-small auto-y padding-y-xsmall",
			LayoutOrder = 1
		}, {
			TitleContainer = if var33 then reactModule.createElement(viewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 0 }, {
				Title = if var33 then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 0,
					Text = escapeRichTextModule(var33),
					tag = var26.title.tag
				}) else nil,
				Metadata = if var34 then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 1,
					Text = var34,
					tag = var26.metadata.tag
				}) else nil
			}) else nil,
			Description = var22.description and reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 1,
				Text = var22.description,
				tag = var26.description.tag
			})
		}),
		TrailingContainer = if var22.trailing then reactModule.createElement(viewModule, {
			tag = "align-x-center align-y-center auto-xy",
			LayoutOrder = 2
		}, var22.trailing) else nil
	}
	
	if var35 then
		var52 = reactModule.createElement
		var52 = var52(viewModule, {
			tag = "align-x-center align-y-center auto-xy",
			LayoutOrder = 3
		}, {
			ActivatedIcon = if var36 == nil or flagsModule.FoundationListItemDecoupledInput and var36 == listItemInputTypeModule.Chevron then reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.ChevronLargeRight,
				size = var26.icon.size,
				testId = `{var22.testId}--activated-icon`
			}) elseif var36 == listItemInputTypeModule.Radio then reactModule.createElement(radioGroupModule.Root, {
				Selectable = false,
				value = if var37 then "radio" else "",
				onValueChanged = var39
			}, reactModule.createElement(radioGroupModule.Item, { value = "radio", label = "", size = size })) else reactModule.createElement(if var36 == listItemInputTypeModule.Checkbox then checkboxModule else toggleModule, {
				label = "",
				Selectable = false,
				onActivated = var38,
				isChecked = var37,
				size = size
			})
		})
	else
		var52 = nil
	end
	t_10.ActivatedIconContainer = var52
	t_8.Content = createElement_4(viewModule, t_9, t_10)
	t_6.ListItem = createElement_3(var47, t_7, t_8)
	t_4.ListItemContainer = createElement_2(var44, t_5, t_6)
	t_2.HoverWrapper = createElement_1(viewModule, t_3, t_4)
	t_2.Divider = if var23.hasDivider and var22.LayoutOrder ~= var23.lastLayoutOrder then if var23.isInset then reactModule.createElement(viewModule, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
		LeadingSpacer = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			Size = UDim2.fromOffset((if var23.hasMargin then var25.Padding.Small + var25.Margin.Small else 0) + (if var22.leading then var27.container.Size.X.Offset + var25.Gap.Medium else 0), 0)
		}),
		DividerLine = reactModule.createElement(viewModule, { tag = "fill auto-y", LayoutOrder = 1 }, reactModule.createElement(dividerModule))
	}) else reactModule.createElement(dividerModule, { LayoutOrder = 2 }) else nil
	
	return createElement(viewModule, t_1, t_2)
end))
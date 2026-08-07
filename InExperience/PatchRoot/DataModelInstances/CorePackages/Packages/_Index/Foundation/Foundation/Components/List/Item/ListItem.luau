local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local components = foundation.Components
local checkboxModule = require(components.Checkbox)
local dividerModule = require(components.Divider)
local iconModule = require(components.Icon)
local inputSizeModule = require(foundation.Enums.InputSize)
local listItemInputTypeModule = require(foundation.Enums.ListItemInputType)
local radioGroupModule = require(components.RadioGroup)
local textModule = require(components.Text)
local toggleModule = require(components.Toggle)
local _ = require(foundation.Components.Types)
local viewModule = require(components.View)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useListItemVariantsModule = require(script.Parent.useListItemVariants)
local listAccessoryModule = require(script.Parent.ListAccessory)
local useListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local useListModule = require(script.Parent.Parent.useList)
local t = {}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 56 | named "ListItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useListModule (ref), inputSizeModule (ref), useTokensModule (ref), useListItemVariantsModule (ref), useListAccessoryVariantsModule (ref), reactModule (ref), viewModule (ref), listAccessoryModule (ref), textModule (ref), escapeRichTextModule (ref), iconModule (ref), builderIconsModule (ref), listItemInputTypeModule (ref), radioGroupModule (ref), checkboxModule (ref), toggleModule (ref), dividerModule (ref)
	local var20 = withDefaultsModule(p0, t)
	local var21 = useListModule()
	local size = var21.size or inputSizeModule.Medium
	local var23 = useTokensModule()
	local var24 = useListItemVariantsModule(var23, size)
	local var25 = useListAccessoryVariantsModule(var23, size, "Icon")
	local var26 = typeof(var20.onActivated) == "table" and var20.onActivated.onActivated ~= nil
	local var27 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: var26 (ref), var20 (ref)
		return if var26 then var20.onActivated.onActivated elseif var20.onActivated == nil then nil else var20.onActivated
	end, { var20.onActivated, var26 })
	local var28 = reactModule.useMemo(function() --[[ line: 77 ]]
		-- upvalues: var26 (ref), var20 (ref)
		return if var26 then var20.onActivated.inputType else nil
	end, { var20.onActivated, var26 })
	local var29 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: var26 (ref), var20 (ref)
		return if var26 then var20.onActivated.isChecked else nil
	end, { var20.onActivated, var26 })
	local var30 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: var20 (ref)
		return if typeof(var20.title) == "string" then var20.title elseif typeof(var20.title) == "table" then var20.title.title else nil
	end, { var20.title })
	local var31 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: var20 (ref)
		return if typeof(var20.title) == "table" then if var20.title.title == nil then nil else var20.title.metadata else nil
	end, { var20.title })
	var20.testId = if var20.testId then var20.testId else `{var21.testId}--item-{reactModule.useMemo(function() --[[ line: 108 ]]
		-- upvalues: var30 (ref)
		return var30 and string.gsub(var30, "%s+", "-") or ""
	end, { var30 })}`
	local var32 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: var27 (ref)
		if var27 then
			var27()
		end
	end, { var27 })
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var20.LayoutOrder,
		ref = p1
	}, {
		HoverWrapper = reactModule.createElement(viewModule, {
			tag = "size-full-0 auto-y padding-y-xsmall",
			LayoutOrder = 1,
			padding = if var21.isContained then var23.Padding.Small else {
				left = UDim.new(0, if var21.hasMargin then var23.Padding.Small else -var23.Padding.Small),
				right = UDim.new(0, if var21.hasMargin then var23.Padding.Small else -var23.Padding.Small)
			}
		}, {
			ListItemContainer = reactModule.createElement(viewModule, {
				onActivated = var27,
				tag = {
					["size-full-0 auto-y radius-medium"] = true,
					["margin-x-small"] = var21.hasMargin,
					["padding-x-small"] = not var21.hasMargin
				}
			}, {
				ListItem = reactModule.createElement(viewModule, {
					tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
					testId = var20.testId
				}, {
					LeadingContainer = if var20.leading then reactModule.createElement(listAccessoryModule, {
						LayoutOrder = 0,
						config = var20.leading,
						size = size,
						testId = `{var20.testId}--leading-accessory`
					}) else nil,
					Content = reactModule.createElement(viewModule, {
						tag = "row flex-between align-x-center align-y-center fill gap-medium auto-y",
						LayoutOrder = 1
					}, {
						TextContainer = reactModule.createElement(viewModule, {
							tag = "col fill gap-small auto-y padding-y-xsmall",
							LayoutOrder = 1
						}, {
							TitleContainer = if var30 then reactModule.createElement(viewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 0 }, {
								Title = if var30 then reactModule.createElement(textModule, {
									RichText = true,
									LayoutOrder = 0,
									Text = escapeRichTextModule(var30),
									tag = var24.title.tag
								}) else nil,
								Metadata = if var31 then reactModule.createElement(textModule, {
									RichText = true,
									LayoutOrder = 1,
									Text = var31,
									tag = var24.metadata.tag
								}) else nil
							}) else nil,
							Description = var20.description and reactModule.createElement(textModule, {
								RichText = true,
								LayoutOrder = 1,
								Text = var20.description,
								tag = var24.description.tag
							})
						}),
						TrailingContainer = if var20.trailing then reactModule.createElement(viewModule, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 2
						}, var20.trailing) else nil,
						ActivatedIconContainer = if var20.onActivated then reactModule.createElement(viewModule, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 3
						}, {
							ActivatedIcon = if var28 == nil then reactModule.createElement(iconModule, {
								name = builderIconsModule.Icon.ChevronLargeRight,
								size = var24.icon.size,
								testId = `{var20.testId}--activated-icon`
							}) elseif var28 == listItemInputTypeModule.Radio then reactModule.createElement(radioGroupModule.Root, {
								Selectable = false,
								value = if var29 then "radio" else "",
								onValueChanged = var32
							}, reactModule.createElement(radioGroupModule.Item, { value = "radio", label = "", size = size })) else reactModule.createElement(if var28 == listItemInputTypeModule.Checkbox then checkboxModule else toggleModule, {
								label = "",
								Selectable = false,
								onActivated = var32,
								isChecked = var29,
								size = size
							})
						}) else nil
					})
				})
			})
		}),
		Divider = if var21.hasDivider and var20.LayoutOrder ~= var21.lastLayoutOrder then if var21.isInset then reactModule.createElement(viewModule, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
			LeadingSpacer = reactModule.createElement(viewModule, {
				LayoutOrder = 0,
				Size = UDim2.fromOffset((if var21.hasMargin then var23.Padding.Small + var23.Margin.Small else 0) + (if var20.leading then var25.container.Size.X.Offset + var23.Gap.Medium else 0), 0)
			}),
			DividerLine = reactModule.createElement(viewModule, { tag = "fill auto-y", LayoutOrder = 1 }, reactModule.createElement(dividerModule))
		}) else reactModule.createElement(dividerModule, { LayoutOrder = 2 }) else nil
	})
end))
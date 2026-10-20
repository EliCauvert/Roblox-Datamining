local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local CheckboxModule = require(Components.Checkbox)
local DividerModule = require(Components.Divider)
local FlagsModule = require(Foundation.Utility.Flags)
local IconModule = require(Components.Icon)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ListItemInputTypeModule = require(Foundation.Enums.ListItemInputType)
local RadioGroupModule = require(Components.RadioGroup)
local TextModule = require(Components.Text)
local ToggleModule = require(Components.Toggle)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Components.View)
local DevAssertModule = require(Foundation.Utility.devAssert)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseListItemVariantsModule = require(script.Parent.useListItemVariants)
local ListAccessoryModule = require(script.Parent.ListAccessory)
local UseListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local UseListModule = require(script.Parent.Parent.useList)
local config = {
	[InputSizeModule.XSmall] = "gap-xxsmall",
	[InputSizeModule.Small] = "gap-xxsmall",
	[InputSizeModule.Medium] = "gap-xsmall",
	[InputSizeModule.Large] = "gap-xsmall"
}
local t = {}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), t (copy), FlagsModule (copy), DevAssertModule (copy), UseListModule (copy), InputSizeModule (copy), UseTokensModule (copy), UseListItemVariantsModule (copy), UseListAccessoryVariantsModule (copy), config (copy), ReactModule (copy), ListItemInputTypeModule (copy), ViewModule (copy), ListAccessoryModule (copy), TextModule (copy), EscapeRichTextModule (copy), IconModule (copy), BuilderIconsModule (copy), RadioGroupModule (copy), CheckboxModule (copy), ToggleModule (copy), DividerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, t)
	
	if FlagsModule.FoundationListItemDecoupledInput then
		local HasOnActivated: boolean = typeof(WithDefaultsModuleResult.input) == "table" and WithDefaultsModuleResult.input.onActivated ~= nil
		DevAssertModule(not (WithDefaultsModuleResult.onActivated ~= nil and HasOnActivated), "ListItem: set `onActivated` on the item or on `input`, not both.")
	end
	local UseListModuleResult = UseListModule()
	local Size = UseListModuleResult.size or InputSizeModule.Medium
	local UseTokensModuleResult = UseTokensModule()
	local UseListItemVariantsModuleResult = UseListItemVariantsModule(UseTokensModuleResult, Size)
	local Icon = UseListAccessoryVariantsModule(UseTokensModuleResult, Size, "Icon")
	local Entry = if FlagsModule.FoundationListItemTypographySpacing then config[Size] else "gap-small"
	local HasOnActivated: boolean = typeof(WithDefaultsModuleResult.onActivated) == "table" and WithDefaultsModuleResult.onActivated.onActivated ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.onActivated elseif WithDefaultsModuleResult.onActivated == nil then nil else WithDefaultsModuleResult.onActivated
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FlagsModule (upval), WithDefaultsModuleResult (copy), HasOnActivated (copy), ListItemInputTypeModule (upval)
		if not FlagsModule.FoundationListItemDecoupledInput then
			return nil
		elseif WithDefaultsModuleResult.input == nil then
			if HasOnActivated then
				local OnActivated = WithDefaultsModuleResult.onActivated
				
				return {
					type = OnActivated.inputType or ListItemInputTypeModule.Chevron,
					isChecked = OnActivated.isChecked
				}
			else
				return if WithDefaultsModuleResult.onActivated == nil then nil else { type = ListItemInputTypeModule.Chevron }
			end
		elseif typeof(WithDefaultsModuleResult.input) == "table" then
			local Input = WithDefaultsModuleResult.input
			
			return {
				type = Input.type,
				isChecked = Input.isChecked,
				onActivated = Input.onActivated
			}
		else
			return { type = WithDefaultsModuleResult.input }
		end
	end, {
		WithDefaultsModuleResult.onActivated,
		WithDefaultsModuleResult.input,
		HasOnActivated
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.inputType else nil
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.isChecked else nil
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		return if typeof(WithDefaultsModuleResult.title) == "string" then WithDefaultsModuleResult.title elseif typeof(WithDefaultsModuleResult.title) == "table" then WithDefaultsModuleResult.title.title else nil
	end, { WithDefaultsModuleResult.title })
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		return if typeof(WithDefaultsModuleResult.title) == "table" then if WithDefaultsModuleResult.title.title == nil then nil else WithDefaultsModuleResult.title.metadata else nil
	end, { WithDefaultsModuleResult.title })
	local UseMemoResult6 = ReactModule.useMemo(function(): string
		-- upvalues: UseMemoResult4 (copy)
		return UseMemoResult4 and string.gsub(UseMemoResult4, "%s+", "-") or ""
	end, { UseMemoResult4 })
	WithDefaultsModuleResult.testId = if WithDefaultsModuleResult.testId then WithDefaultsModuleResult.testId else `{UseListModuleResult.testId}--item-{UseMemoResult6}`
	local Type = if FlagsModule.FoundationListItemDecoupledInput then if UseMemoResult1 then UseMemoResult1.type else nil else UseMemoResult2
	local IsChecked = if FlagsModule.FoundationListItemDecoupledInput then if UseMemoResult1 then UseMemoResult1.isChecked else nil else UseMemoResult3
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: FlagsModule (upval), UseMemoResult1 (copy), UseMemoResult (copy)
		if FlagsModule.FoundationListItemDecoupledInput and UseMemoResult1 and UseMemoResult1.onActivated then
			UseMemoResult1.onActivated(p2)
			
			return
		end
		if UseMemoResult then
			UseMemoResult()
		end
	end, { UseMemoResult1, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult (copy)
		UseResult(p2 == "radio")
	end, { UseResult })
	
	return ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		ref = Ref
	}, {
		HoverWrapper = ReactModule.createElement(ViewModule, {
			tag = "size-full-0 auto-y padding-y-xsmall",
			LayoutOrder = 1,
			padding = if UseListModuleResult.isContained then UseTokensModuleResult.Padding.Small else {
				left = UDim.new(0, if UseListModuleResult.hasMargin then UseTokensModuleResult.Padding.Small else -UseTokensModuleResult.Padding.Small),
				right = UDim.new(0, if UseListModuleResult.hasMargin then UseTokensModuleResult.Padding.Small else -UseTokensModuleResult.Padding.Small)
			}
		}, {
			ListItemContainer = ReactModule.createElement(ViewModule, {
				onActivated = UseMemoResult,
				onSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated,
				tag = {
					["size-full-0 auto-y radius-medium"] = true,
					["margin-x-small"] = UseListModuleResult.hasMargin,
					["padding-x-small"] = not UseListModuleResult.hasMargin
				}
			}, {
				ListItem = ReactModule.createElement(ViewModule, {
					tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
					testId = WithDefaultsModuleResult.testId
				}, {
					LeadingContainer = if WithDefaultsModuleResult.leading then ReactModule.createElement(ListAccessoryModule, {
						LayoutOrder = 0,
						config = WithDefaultsModuleResult.leading,
						size = Size,
						testId = `{WithDefaultsModuleResult.testId}--leading-accessory`
					}) else nil,
					Content = ReactModule.createElement(ViewModule, {
						tag = "row flex-between align-x-center align-y-center fill gap-medium auto-y",
						LayoutOrder = 1
					}, {
						TextContainer = ReactModule.createElement(ViewModule, {
							LayoutOrder = 1,
							tag = {
								["col fill auto-y padding-y-xsmall"] = true,
								[Entry] = true
							}
						}, {
							TitleContainer = if UseMemoResult4 then ReactModule.createElement(ViewModule, {
								LayoutOrder = 0,
								tag = {
									["col auto-xy"] = true,
									["gap-xsmall"] = not FlagsModule.FoundationListItemTypographySpacing
								}
							}, {
								Title = if UseMemoResult4 then ReactModule.createElement(TextModule, {
									RichText = true,
									LayoutOrder = 0,
									Text = EscapeRichTextModule(UseMemoResult4),
									tag = UseListItemVariantsModuleResult.title.tag
								}) else nil,
								Metadata = if UseMemoResult5 then ReactModule.createElement(TextModule, {
									RichText = true,
									LayoutOrder = 1,
									Text = UseMemoResult5,
									tag = UseListItemVariantsModuleResult.metadata.tag
								}) else nil
							}) else nil,
							Description = WithDefaultsModuleResult.description and ReactModule.createElement(TextModule, {
								RichText = true,
								LayoutOrder = 1,
								Text = WithDefaultsModuleResult.description,
								tag = UseListItemVariantsModuleResult.description.tag
							})
						}),
						TrailingContainer = if WithDefaultsModuleResult.trailing then ReactModule.createElement(ViewModule, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 2
						}, WithDefaultsModuleResult.trailing) else nil,
						ActivatedIconContainer = if if FlagsModule.FoundationListItemDecoupledInput then UseMemoResult1 ~= nil and UseMemoResult1.type ~= ListItemInputTypeModule.None else WithDefaultsModuleResult.onActivated ~= nil then ReactModule.createElement(ViewModule, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 3
						}, {
							ActivatedIcon = if Type == nil or FlagsModule.FoundationListItemDecoupledInput and Type == ListItemInputTypeModule.Chevron then ReactModule.createElement(IconModule, {
								name = BuilderIconsModule.Icon.ChevronLargeRight,
								size = UseListItemVariantsModuleResult.icon.size,
								testId = `{WithDefaultsModuleResult.testId}--activated-icon`
							}) elseif Type == ListItemInputTypeModule.Radio then ReactModule.createElement(RadioGroupModule.Root, {
								Selectable = false,
								value = if IsChecked then "radio" else "",
								onValueChanged = UseResult1
							}, ReactModule.createElement(RadioGroupModule.Item, { value = "radio", label = "", size = Size })) else ReactModule.createElement(if Type == ListItemInputTypeModule.Checkbox then CheckboxModule else ToggleModule, {
								label = "",
								Selectable = false,
								onActivated = UseResult,
								isChecked = IsChecked,
								size = Size
							})
						}) else nil
					})
				})
			})
		}),
		Divider = if UseListModuleResult.hasDivider and WithDefaultsModuleResult.LayoutOrder ~= UseListModuleResult.lastLayoutOrder then if UseListModuleResult.isInset then ReactModule.createElement(ViewModule, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
			LeadingSpacer = ReactModule.createElement(ViewModule, {
				LayoutOrder = 0,
				Size = UDim2.fromOffset((if UseListModuleResult.hasMargin then UseTokensModuleResult.Padding.Small + UseTokensModuleResult.Margin.Small else 0) + (if WithDefaultsModuleResult.leading then Icon.container.Size.X.Offset + UseTokensModuleResult.Gap.Medium else 0), 0)
			}),
			DividerLine = ReactModule.createElement(ViewModule, { tag = "fill auto-y", LayoutOrder = 1 }, ReactModule.createElement(DividerModule))
		}) else ReactModule.createElement(DividerModule, { LayoutOrder = 2 }) else nil
	})
end))
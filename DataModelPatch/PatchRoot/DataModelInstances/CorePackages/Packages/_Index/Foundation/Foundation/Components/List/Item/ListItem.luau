local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local CheckboxModule = require(Components.Checkbox)
local DividerModule = require(Components.Divider)
local IconModule = require(Components.Icon)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ListItemInputTypeModule = require(Foundation.Enums.ListItemInputType)
local RadioGroupModule = require(Components.RadioGroup)
local TextModule = require(Components.Text)
local ToggleModule = require(Components.Toggle)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Components.View)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseListItemVariantsModule = require(script.Parent.useListItemVariants)
local ListAccessoryModule = require(script.Parent.ListAccessory)
local UseListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local UseListModule = require(script.Parent.Parent.useList)
local t = {}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), t (copy), UseListModule (copy), InputSizeModule (copy), UseTokensModule (copy), UseListItemVariantsModule (copy), UseListAccessoryVariantsModule (copy), ReactModule (copy), ViewModule (copy), ListAccessoryModule (copy), TextModule (copy), EscapeRichTextModule (copy), IconModule (copy), BuilderIconsModule (copy), ListItemInputTypeModule (copy), RadioGroupModule (copy), CheckboxModule (copy), ToggleModule (copy), DividerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, t)
	local UseListModuleResult = UseListModule()
	local Size = UseListModuleResult.size or InputSizeModule.Medium
	local UseTokensModuleResult = UseTokensModule()
	local UseListItemVariantsModuleResult = UseListItemVariantsModule(UseTokensModuleResult, Size)
	local Icon = UseListAccessoryVariantsModule(UseTokensModuleResult, Size, "Icon")
	local HasOnActivated: boolean = typeof(WithDefaultsModuleResult.onActivated) == "table" and WithDefaultsModuleResult.onActivated.onActivated ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.onActivated elseif WithDefaultsModuleResult.onActivated == nil then nil else WithDefaultsModuleResult.onActivated
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.inputType else nil
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: HasOnActivated (copy), WithDefaultsModuleResult (copy)
		return if HasOnActivated then WithDefaultsModuleResult.onActivated.isChecked else nil
	end, { WithDefaultsModuleResult.onActivated, HasOnActivated })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		return if typeof(WithDefaultsModuleResult.title) == "string" then WithDefaultsModuleResult.title elseif typeof(WithDefaultsModuleResult.title) == "table" then WithDefaultsModuleResult.title.title else nil
	end, { WithDefaultsModuleResult.title })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		return if typeof(WithDefaultsModuleResult.title) == "table" then if WithDefaultsModuleResult.title.title == nil then nil else WithDefaultsModuleResult.title.metadata else nil
	end, { WithDefaultsModuleResult.title })
	local UseMemoResult5 = ReactModule.useMemo(function(): string
		-- upvalues: UseMemoResult3 (copy)
		return UseMemoResult3 and string.gsub(UseMemoResult3, "%s+", "-") or ""
	end, { UseMemoResult3 })
	WithDefaultsModuleResult.testId = if WithDefaultsModuleResult.testId then WithDefaultsModuleResult.testId else `{UseListModuleResult.testId}--item-{UseMemoResult5}`
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		if UseMemoResult then
			UseMemoResult()
		end
	end, { UseMemoResult })
	
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
							tag = "col fill gap-small auto-y padding-y-xsmall",
							LayoutOrder = 1
						}, {
							TitleContainer = if UseMemoResult3 then ReactModule.createElement(ViewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 0 }, {
								Title = if UseMemoResult3 then ReactModule.createElement(TextModule, {
									RichText = true,
									LayoutOrder = 0,
									Text = EscapeRichTextModule(UseMemoResult3),
									tag = UseListItemVariantsModuleResult.title.tag
								}) else nil,
								Metadata = if UseMemoResult4 then ReactModule.createElement(TextModule, {
									RichText = true,
									LayoutOrder = 1,
									Text = UseMemoResult4,
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
						ActivatedIconContainer = if WithDefaultsModuleResult.onActivated then ReactModule.createElement(ViewModule, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 3
						}, {
							ActivatedIcon = if UseMemoResult1 == nil then ReactModule.createElement(IconModule, {
								name = BuilderIconsModule.Icon.ChevronLargeRight,
								size = UseListItemVariantsModuleResult.icon.size,
								testId = `{WithDefaultsModuleResult.testId}--activated-icon`
							}) elseif UseMemoResult1 == ListItemInputTypeModule.Radio then ReactModule.createElement(RadioGroupModule.Root, {
								Selectable = false,
								value = if UseMemoResult2 then "radio" else "",
								onValueChanged = UseResult
							}, ReactModule.createElement(RadioGroupModule.Item, { value = "radio", label = "", size = Size })) else ReactModule.createElement(if UseMemoResult1 == ListItemInputTypeModule.Checkbox then CheckboxModule else ToggleModule, {
								label = "",
								Selectable = false,
								onActivated = UseResult,
								isChecked = UseMemoResult2,
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
local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local DividerModule = require(Foundation.Components.Divider)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseAccordionModule = require(script.Parent.Parent.useAccordion)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Providers.Style.Tokens)
local UseAccordionItemVariantsModule = require(script.Parent.Parent.useAccordionItemVariants)
local config = { hasDivider = true, isExpanded = false }

local function _(p1)
	return {
		easingStyle = p1.Ease.StandardOut,
		duration = p1.Time.Time_300
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), ReactOtterModule (copy), UseAccordionModule (copy), UseAccordionItemVariantsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), TextModule (copy), DividerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_300
		}
	end, { UseTokensModuleResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isExpanded)
	local UseRefResult = ReactModule.useRef(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			UseStateResult2(false)
			UseRefResult.current = false
		end
	end)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2 (copy), UseStateResult2 (copy), UseRefResult (copy), UseMemoResult (copy)
		if ReducedMotion then
			UseAnimatedBindingResult2_1((ReactOtterModule.instant(0)))
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
			UseStateResult2(false)
			UseRefResult.current = false
			
			return
		else
			UseRefResult.current = true
			UseAnimatedBindingResult2_1(ReactOtterModule.ease(0, UseMemoResult))
			UseAnimatedBindingResult2(ReactOtterModule.ease(0, UseMemoResult))
		end
	end, { ReducedMotion, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseMemoResult (copy)
		if UseRefResult1 and UseRefResult1.current and UseStateResult then
			if ReducedMotion then
				UseAnimatedBindingResult2_1((ReactOtterModule.instant(UseRefResult1.current.AbsoluteSize.Y)))
				
				return
			end
			UseAnimatedBindingResult2_1(ReactOtterModule.ease(UseRefResult1.current.AbsoluteSize.Y, UseMemoResult))
		end
	end, {
		UseRefResult1,
		UseStateResult,
		ReducedMotion,
		UseMemoResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), UseResult (copy), UseStateResult2 (copy)
		if UseStateResult and not WithDefaultsModuleResult.isExpanded then
			UseResult()
			
			return
		else
			UseStateResult2(WithDefaultsModuleResult.isExpanded)
		end
	end, { WithDefaultsModuleResult.isExpanded })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ReducedMotion (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy)
		if UseStateResult then
			if ReducedMotion then
				UseAnimatedBindingResult2((ReactOtterModule.instant(-180)))
				
				return
			end
			UseAnimatedBindingResult2(ReactOtterModule.ease(-180, UseMemoResult))
		end
	end, { UseStateResult, ReducedMotion, UseMemoResult })
	local UseAccordionModuleResult = UseAccordionModule()
	local OnAccordionItemActivatedFunction = UseAccordionModuleResult.onAccordionItemActivated
	local UseAccordionItemVariantsModuleResult = UseAccordionItemVariantsModule(UseTokensModuleResult, UseAccordionModuleResult.itemSize, false)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseResult (copy), UseStateResult2 (copy)
		if UseStateResult then
			UseResult()
			
			return
		else
			UseStateResult2(true)
		end
	end, { UseStateResult })
	local OnActivated = if WithDefaultsModuleResult.onActivated then WithDefaultsModuleResult.onActivated elseif OnAccordionItemActivatedFunction then OnAccordionItemActivatedFunction(WithDefaultsModuleResult.id, UseStateResult) else UseResult2
	WithDefaultsModuleResult.testId = `{UseAccordionModuleResult.testId}--item-{WithDefaultsModuleResult.id}`
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseAccordionItemVariantsModuleResult.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = UseAccordionItemVariantsModuleResult.container.stateLayer,
		ref = Ref
	}), {
		Header = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseAccordionItemVariantsModuleResult.header.tag,
			onActivated = OnActivated,
			testId = `{WithDefaultsModuleResult.testId}--header`
		}, {
			LeadingIcon = if WithDefaultsModuleResult.leadingIcon then ReactModule.createElement(IconModule, {
				LayoutOrder = 1,
				name = if type(WithDefaultsModuleResult.leadingIcon) == "table" then WithDefaultsModuleResult.leadingIcon.name else WithDefaultsModuleResult.leadingIcon,
				variant = if type(WithDefaultsModuleResult.leadingIcon) == "table" then WithDefaultsModuleResult.leadingIcon.variant else nil,
				style = UseAccordionItemVariantsModuleResult.icon.style,
				size = UseAccordionItemVariantsModuleResult.icon.size,
				testId = `{WithDefaultsModuleResult.testId}--leading-icon`
			}) else nil,
			Title = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = WithDefaultsModuleResult.text,
				tag = UseAccordionItemVariantsModuleResult.text.tag,
				testId = `{WithDefaultsModuleResult.testId}--title`
			}),
			CollapseIcon = ReactModule.createElement(ViewModule, { tag = "auto-xy", LayoutOrder = 3 }, {
				Icon = ReactModule.createElement(IconModule, {
					name = "chevron-large-down",
					Rotation = UseAnimatedBindingResult,
					style = UseAccordionItemVariantsModuleResult.icon.style,
					size = UseAccordionItemVariantsModuleResult.icon.size,
					testId = `{WithDefaultsModuleResult.testId}--collapse-icon`
				})
			})
		}),
		Content = if UseStateResult then ReactModule.createElement(ViewModule, {
			tag = "col",
			LayoutOrder = 2,
			ClipsDescendants = true,
			testId = `{WithDefaultsModuleResult.testId}--content`,
			Size = if UseAnimatedBindingResult1 then UseAnimatedBindingResult1:map(function(YOffset): UDim2
				return UDim2.new(1, 0, 0, YOffset)
			end) else nil
		}, {
			AnimatedContainer = ReactModule.createElement(ViewModule, {
				tag = UseAccordionItemVariantsModuleResult.content.tag,
				ref = UseRefResult1,
				onAbsoluteSizeChanged = UseResult1,
				flexItem = { FlexMode = Enum.UIFlexMode.None },
				testId = `{WithDefaultsModuleResult.testId}--animated-content`
			}, { WithDefaultsModuleResult.children })
		}) else nil,
		Divider = if WithDefaultsModuleResult.hasDivider then ReactModule.createElement(DividerModule, {
			LayoutOrder = 3,
			testId = `{WithDefaultsModuleResult.testId}--divider`
		}) else nil
	})
end))
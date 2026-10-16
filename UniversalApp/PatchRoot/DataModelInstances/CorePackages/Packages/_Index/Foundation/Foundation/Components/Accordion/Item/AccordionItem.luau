local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = require(Parent.BuilderIcons).Icon
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
local InputPlacementModule = require(Foundation.Enums.InputPlacement)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Providers.Style.Tokens)
local FlagsModule = require(Foundation.Utility.Flags)
local UseAccordionItemVariantsModule = require(script.Parent.Parent.useAccordionItemVariants)
local config = { hasDivider = true, isExpanded = false }

local function _(p1) --[[ Line: 66 | Named "getCommonEaseConfig" ]]
	return {
		easingStyle = p1.Ease.StandardOut,
		duration = p1.Time.Time_300
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 73 | Named "AccordionItem" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), ReactOtterModule (copy), UseAccordionModule (copy), UseAccordionItemVariantsModule (copy), InputPlacementModule (copy), TextModule (copy), ViewModule (copy), WithCommonPropsModule (copy), FlagsModule (copy), IconModule (copy), Icon (copy), DividerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 78 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_300
		}
	end, { UseTokensModuleResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isExpanded)
	local UseRefResult = ReactModule.useRef(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0, function() --[[ Line: 86 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			UseStateResult2(false)
			UseRefResult.current = false
		end
	end)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 93 ]]
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
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 107 ]]
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
	ReactModule.useEffect(function() --[[ Line: 117 ]]
		-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), UseResult (copy), UseStateResult2 (copy)
		if UseStateResult and not WithDefaultsModuleResult.isExpanded then
			UseResult()
			
			return
		else
			UseStateResult2(WithDefaultsModuleResult.isExpanded)
		end
	end, { WithDefaultsModuleResult.isExpanded })
	ReactModule.useEffect(function() --[[ Line: 125 ]]
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
	local ChevronPosition = UseAccordionModuleResult.chevronPosition
	local UseAccordionItemVariantsModuleResult = UseAccordionItemVariantsModule(UseTokensModuleResult, UseAccordionModuleResult.itemSize, UseAccordionModuleResult.isContained)
	local IsChevronPositionMatch = ChevronPosition == InputPlacementModule.Start
	local LayoutOrder: number = if IsChevronPositionMatch then 3 else 1
	local LayoutOrder1: number = if IsChevronPositionMatch then 1 else 3
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 145 ]]
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
	local HasDescription = WithDefaultsModuleResult.description ~= nil
	local Element = ReactModule.createElement(TextModule, {
		LayoutOrder = 2,
		Text = WithDefaultsModuleResult.text,
		tag = {
			[UseAccordionItemVariantsModuleResult.text.tag] = true,
			grow = not HasDescription,
			["size-full-0"] = HasDescription
		},
		testId = `{WithDefaultsModuleResult.testId}--title`
	})
	local Icon1 = if WithDefaultsModuleResult.icon then WithDefaultsModuleResult.icon else WithDefaultsModuleResult.leadingIcon
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseAccordionItemVariantsModuleResult.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = UseAccordionItemVariantsModuleResult.container.stateLayer,
		ref = Ref
	}), {
		Header = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseAccordionItemVariantsModuleResult.header.tag,
			AutomaticSize = if HasDescription then Enum.AutomaticSize.Y else nil,
			onActivated = OnActivated,
			testId = `{WithDefaultsModuleResult.testId}--header`
		}, {
			Icon = if FlagsModule.FoundationAccordionBeta and Icon1 then ReactModule.createElement(IconModule, {
				LayoutOrder = LayoutOrder,
				name = if type(Icon1) == "table" then Icon1.name else Icon1,
				variant = if type(Icon1) == "table" then Icon1.variant else nil,
				style = UseAccordionItemVariantsModuleResult.icon.style,
				size = UseAccordionItemVariantsModuleResult.icon.size,
				testId = `{WithDefaultsModuleResult.testId}--leading-icon`
			}) else nil,
			LeadingIcon = if FlagsModule.FoundationAccordionBeta then nil elseif Icon1 then ReactModule.createElement(IconModule, {
				LayoutOrder = LayoutOrder,
				name = if type(Icon1) == "table" then Icon1.name else Icon1,
				variant = if type(Icon1) == "table" then Icon1.variant else nil,
				style = UseAccordionItemVariantsModuleResult.icon.style,
				size = UseAccordionItemVariantsModuleResult.icon.size,
				testId = `{WithDefaultsModuleResult.testId}--leading-icon`
			}) else nil,
			Title = if HasDescription then nil else Element,
			TextContainer = if HasDescription then ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = UseAccordionItemVariantsModuleResult.textContainer.tag,
				testId = `{WithDefaultsModuleResult.testId}--text-container`
			}, {
				Title = Element,
				Description = ReactModule.createElement(TextModule, {
					LayoutOrder = 3,
					TextWrapped = false,
					Text = WithDefaultsModuleResult.description,
					TextTruncate = Enum.TextTruncate.AtEnd,
					tag = UseAccordionItemVariantsModuleResult.description.tag,
					testId = `{WithDefaultsModuleResult.testId}--description`
				})
			}) else nil,
			CollapseIcon = ReactModule.createElement(ViewModule, {
				tag = "auto-xy",
				LayoutOrder = LayoutOrder1,
				testId = `{WithDefaultsModuleResult.testId}--collapse-icon-container`
			}, {
				Icon = ReactModule.createElement(IconModule, {
					name = Icon.ChevronLargeDown,
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
			Size = if UseAnimatedBindingResult1 then UseAnimatedBindingResult1:map(function(YOffset): UDim2 --[[ Line: 253 ]]
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
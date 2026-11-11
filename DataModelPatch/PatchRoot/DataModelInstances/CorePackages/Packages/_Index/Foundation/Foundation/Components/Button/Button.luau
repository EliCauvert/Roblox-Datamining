local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local MotionModule = require(Parent.Motion)
local UseMotionFunction = MotionModule.useMotion
local AnimatePresence = MotionModule.AnimatePresence
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SpinnerModule = require(script.Parent.Spinner)
local EndAlignedIconsModule = require(script.Parent.endAlignedIcons)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local ControlStateModule = require(Foundation.Enums.ControlState)
local ButtonIconModule = require(script.Parent.ButtonIcon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseButtonMotionStatesModule = require(script.Parent.useButtonMotionStates)
local UseButtonVariantsModule = require(script.Parent.useButtonVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local config = {
	[ButtonVariantModule.Link] = {
		format = "<u>%s</u>",
		controlState = { ControlStateModule.Hover, ControlStateModule.Pressed }
	}
}

local function onProgressChange(p1: number): NumberSequence
	-- upvalues: ConstantsModule (copy)
	return NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(math.max(0, p1 - 0.0001), 0),
		NumberSequenceKeypoint.new(math.min(1, p1 + 0.0001), ConstantsModule.DISABLED_TRANSPARENCY),
		NumberSequenceKeypoint.new(1, ConstantsModule.DISABLED_TRANSPARENCY)
	})
end

local function _(p1, p2)
	return p2:map(function(p3)
		-- upvalues: p1 (copy)
		return if p1 == nil then p3 else p1 + (1 - p1) * p3
	end)
end

local config1 = {
	isDisabled = false,
	isLoading = false,
	inputDelay = 0,
	testId = "--foundation-button",
	variant = ButtonVariantModule.Standard,
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(0, 0)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), ReactModule (copy), ControlStateModule (copy), ReactOtterModule (copy), EndAlignedIconsModule (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), UseButtonVariantsModule (copy), UseButtonMotionStatesModule (copy), ConstantsModule (copy), UseMotionFunction (copy), config (copy), ViewModule (copy), WithCommonPropsModule (copy), FlagsModule (copy), FillBehaviorModule (copy), AnimatePresence (copy), SpinnerModule (copy), ButtonIconModule (copy), TextModule (copy), onProgressChange (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local InputDelay: number = WithDefaultsModuleResult.inputDelay
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlStateModule.Initialize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(InputDelay > 0)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	local EndAlignedIconsModuleEntry = WithDefaultsModuleResult.icon and EndAlignedIconsModule[WithDefaultsModuleResult.icon]
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if UseStateResult == false then
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), InputDelay (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if UseStateResult then
			UseStateResult2(false)
		end
		if InputDelay > 0 then
			UseStateResult2(true)
			UseAnimatedBindingResult2((ReactOtterModule.ease(1, {
				duration = InputDelay,
				easingStyle = Enum.EasingStyle.Quad
			})))
		end
	end, { InputDelay })
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseButtonVariantsModuleResult = UseButtonVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, if UsePresentationContextResult then UsePresentationContextResult.colorMode else nil)
	local UseButtonMotionStatesModuleResult = UseButtonMotionStatesModule(UseButtonVariantsModuleResult.content.style.Transparency, ConstantsModule.DISABLED_TRANSPARENCY)
	local UseMotionResult, UseMotionResult2 = UseMotionFunction(UseButtonMotionStatesModuleResult.Default)
	local UseMotionResult1, UseMotionResult2_1 = UseMotionFunction(UseButtonMotionStatesModuleResult.Default)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseMotionResult2_1 (copy), UseButtonMotionStatesModuleResult (copy)
		if WithDefaultsModuleResult.isLoading then
			UseMotionResult2_1(UseButtonMotionStatesModuleResult.Loading)
			
			return
		else
			UseMotionResult2_1(UseButtonMotionStatesModuleResult.Default)
		end
	end, { WithDefaultsModuleResult.isLoading })
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseMotionResult2 (copy), UseButtonMotionStatesModuleResult (copy)
		if WithDefaultsModuleResult.isDisabled then
			UseMotionResult2(UseButtonMotionStatesModuleResult.Disabled)
			
			return
		else
			UseMotionResult2(UseButtonMotionStatesModuleResult.Default)
		end
	end, { WithDefaultsModuleResult.isDisabled })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseButtonVariantsModuleResult (copy), UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, UseButtonVariantsModuleResult.container.radius),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, {
		UseTokensModuleResult,
		UseButtonVariantsModuleResult.container.radius
	})
	local IsNotTextMatch: boolean = WithDefaultsModuleResult.text and WithDefaultsModuleResult.text ~= ""
	local UseResult = ReactModule.useCallback(function(Value)
		-- upvalues: config (upval), WithDefaultsModuleResult (copy), IsNotTextMatch (copy)
		local Entry = config[WithDefaultsModuleResult.variant]
		
		return if IsNotTextMatch and Entry and table.find(Entry.controlState, Value) then Entry.format:format(WithDefaultsModuleResult.text) else WithDefaultsModuleResult.text
	end, {
		WithDefaultsModuleResult.text,
		WithDefaultsModuleResult.variant,
		IsNotTextMatch
	})
	local CreateElementFunction = ReactModule.createElement
	local config2 = {
		AutomaticSize = if FlagsModule.FoundationButtonFillBehaviorEqualSize and WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill then nil elseif WithDefaultsModuleResult.width.Scale == 0 and WithDefaultsModuleResult.width.Offset == 0 then Enum.AutomaticSize.X else nil,
		cornerRadius = UDim.new(0, UseButtonVariantsModuleResult.container.radius)
	}
	local MapResult = nil
	
	if UseButtonVariantsModuleResult.container.style then
		local Transparency = UseButtonVariantsModuleResult.container.style.Transparency
		MapResult = UseMotionResult.transparency:map(function(p2)
			-- upvalues: Transparency (copy)
			return if Transparency == nil then p2 else Transparency + (1 - Transparency) * p2
		end):map(function(Transparency)
			-- upvalues: UseButtonVariantsModuleResult (copy)
			return {
				Color3 = UseButtonVariantsModuleResult.container.style.Color3,
				Transparency = Transparency
			}
		end)
	else
		MapResult = nil
	end
	config2.backgroundStyle = MapResult
	config2.flexItem = if WithDefaultsModuleResult.fillBehavior then {
		FlexMode = if WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
	} else nil
	local Stroke = nil
	
	if UseButtonVariantsModuleResult.container.stroke then
		local Transparency1 = UseButtonVariantsModuleResult.container.stroke.Transparency
		Stroke = {
			Color = UseButtonVariantsModuleResult.container.stroke.Color,
			Transparency = UseMotionResult.transparency:map(function(p2)
				-- upvalues: Transparency1 (copy)
				return if Transparency1 == nil then p2 else Transparency1 + (1 - Transparency1) * p2
			end)
		}
	else
		Stroke = nil
	end
	config2.stroke = Stroke
	config2.Size = UDim2.new(if WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill then 1 else WithDefaultsModuleResult.width.Scale, if WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill then 0 else WithDefaultsModuleResult.width.Offset, 0, UseButtonVariantsModuleResult.container.height)
	config2.selection = {
		Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
		NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
	}
	config2.cursor = UseMemoResult
	config2.onActivated = WithDefaultsModuleResult.onActivated
	config2.onStateChanged = UseBindingResult2
	config2.isDisabled = WithDefaultsModuleResult.isDisabled or (WithDefaultsModuleResult.isLoading or UseStateResult)
	config2.stateLayer = UseButtonVariantsModuleResult.container.stateLayer
	config2.tag = UseButtonVariantsModuleResult.container.tag
	config2.ref = Ref
	
	return CreateElementFunction(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, config2), {
		Loading = if WithDefaultsModuleResult.isLoading then ReactModule.createElement("Folder", {}, {
			PresenceWrapper = ReactModule.createElement(AnimatePresence, {}, {
				Spinner = ReactModule.createElement(SpinnerModule, {
					Size = UseButtonVariantsModuleResult.icon.size - (if FlagsModule.FoundationUsePath2DSpinner then UDim2.fromOffset(UseTokensModuleResult.Padding.XSmall, UseTokensModuleResult.Padding.XSmall) else UDim2.fromOffset(0, 0)),
					style = UseMotionResult.transparency:map(function(Transparency)
						-- upvalues: UseButtonVariantsModuleResult (copy)
						return {
							Color3 = UseButtonVariantsModuleResult.content.style.Color3,
							Transparency = Transparency
						}
					end),
					testId = `{WithDefaultsModuleResult.testId}--spinner`
				})
			})
		}) else nil,
		IconWrapper = if WithDefaultsModuleResult.icon then ReactModule.createElement(ViewModule, {
			Size = if WithDefaultsModuleResult.icon then UseButtonVariantsModuleResult.icon.size else nil,
			LayoutOrder = if WithDefaultsModuleResult.icon then if EndAlignedIconsModuleEntry then 3 else 1 else nil,
			testId = if WithDefaultsModuleResult.icon then `{WithDefaultsModuleResult.testId}--icon-wrapper` else nil
		}, {
			Icon = ReactModule.createElement(ButtonIconModule, {
				icon = WithDefaultsModuleResult.icon,
				isLoading = WithDefaultsModuleResult.isLoading,
				variant = WithDefaultsModuleResult.variant,
				size = WithDefaultsModuleResult.size,
				disabledTransparencyBinding = UseMotionResult.transparency,
				textTransparencyBinding = UseMotionResult1.textTransparency,
				testId = WithDefaultsModuleResult.testId
			})
		}) else nil,
		Text = if IsNotTextMatch then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = UseBindingResult:map(UseResult),
			RichText = config[WithDefaultsModuleResult.variant] ~= nil,
			tag = UseButtonVariantsModuleResult.text.tag,
			textStyle = ReactModule.joinBindings({
				UseMotionResult.transparency,
				UseMotionResult1.textTransparency
			}):map(function(Entry)
				-- upvalues: UseButtonVariantsModuleResult (copy)
				return {
					Color3 = UseButtonVariantsModuleResult.content.style.Color3,
					Transparency = Entry[2] + Entry[1]
				}
			end),
			testId = `{WithDefaultsModuleResult.testId}--text`
		}) else nil,
		Gradient = if UseStateResult then ReactModule.createElement("UIGradient", {
			Transparency = UseAnimatedBindingResult:map(onProgressChange)
		}) else nil
	})
end))
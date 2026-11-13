local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(script.Parent.SettingsTextInputFieldView)
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local EventMap = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

return function(Frame)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), NavigateBack (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy), ReactFocusNavigationModule (copy), ResponsiveModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Frame.value)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Frame.value)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2_1 (copy), UseBindingResult2 (copy)
		UseStateResult2_1(p1)
		UseBindingResult2(p1)
	end, { UseBindingResult2 })
	local Length = utf8.len(UseStateResult1)
	local NoLength: boolean = Length == nil or (Length == 0 or Frame.maxLength < Length)
	local IsNotUseStateResultMatch: boolean = not NoLength and UseStateResult1 ~= Frame.value
	local UseLocalizationResult = UseLocalizationFunction({
		save = "CommonUI.Controls.Action.Confirm",
		cancel = "CommonUI.Controls.Action.Cancel"
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), Frame (copy), UseStateResult2 (copy)
		UseResult(Frame.value)
		UseStateResult2(true)
	end, { Frame.value, UseResult })
	local UseResult2 = ReactModule.useCallback(function(Text: string)
		-- upvalues: Frame (copy), UseResult (copy)
		local Length = utf8.len(Text)
		
		if Length and Frame.maxLength < Length then
			Text = string.sub(Text, 1, utf8.offset(Text, Frame.maxLength + 1) - 1)
		end
		UseResult(Text)
	end, { Frame.maxLength, UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), IsNotUseStateResultMatch (copy), Frame (copy), UseStateResult1 (copy), UseStateResult2 (copy)
		if UseStateResult and IsNotUseStateResultMatch then
			Frame.onChange(UseStateResult1)
			UseStateResult2(false)
			
			return
		end
	end, {
		UseStateResult,
		IsNotUseStateResultMatch,
		UseStateResult1,
		Frame.onChange
	})
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((FocusNavigationUtilsModule.useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = UseStateResult,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult3 (copy)
			return {
				[NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: UseResult3 (upval)
						UseResult3()
						p1:cancel()
					end)
				}
			}
		end, { UseResult3 })
	})))
	
	return {
		title = Frame.title,
		value = Frame.value,
		description = Frame.description,
		isEditing = UseStateResult,
		draft = UseBindingResult,
		hasError = NoLength,
		canSave = IsNotUseStateResultMatch,
		saveText = UseLocalizationResult.save,
		cancelText = UseLocalizationResult.cancel,
		remainingCharacters = Frame.maxLength - (Length or 0),
		hideCloseButton = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional,
		dialogRef = UseDefaultFocusBehaviorResult2,
		inputRef = UseDefaultFocusBehaviorResult,
		onOpen = UseResult1,
		onCancel = UseResult3,
		onDraftChanged = UseResult2,
		onSave = UseResult4,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--settings-text-input-field"
	}
end
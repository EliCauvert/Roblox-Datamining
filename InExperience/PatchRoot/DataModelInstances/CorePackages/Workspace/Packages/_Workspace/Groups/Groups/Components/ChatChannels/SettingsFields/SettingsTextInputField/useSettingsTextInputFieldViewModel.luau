local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(script.Parent.SettingsTextInputFieldView)
local UseSettingsTextInputDraftModule = require(script.Parent.useSettingsTextInputDraft)
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local EventMap = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

return function(Frame)
	-- upvalues: ReactModule (copy), UseSettingsTextInputDraftModule (copy), UseLocalizationFunction (copy), NavigateBack (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy), ReactFocusNavigationModule (copy), ResponsiveModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSettingsTextInputDraftModuleResult = UseSettingsTextInputDraftModule(Frame.value, Frame.maxLength)
	local SetDraftFunction = UseSettingsTextInputDraftModuleResult.setDraft
	local DraftValue = UseSettingsTextInputDraftModuleResult.draftValue
	local CanSave = UseSettingsTextInputDraftModuleResult.canSave
	local UseLocalizationResult = UseLocalizationFunction({
		save = "CommonUI.Controls.Action.Confirm",
		cancel = "CommonUI.Controls.Action.Cancel"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetDraftFunction (copy), Frame (copy), UseStateResult2 (copy)
		SetDraftFunction(Frame.value)
		UseStateResult2(true)
	end, { Frame.value, SetDraftFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), CanSave (copy), Frame (copy), DraftValue (copy), UseStateResult2 (copy)
		if UseStateResult and CanSave then
			Frame.onChange(DraftValue)
			UseStateResult2(false)
			
			return
		end
	end, { UseStateResult, CanSave, DraftValue, Frame.onChange })
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((FocusNavigationUtilsModule.useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = UseStateResult,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult1 (copy)
			return {
				[NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: UseResult1 (upval)
						UseResult1()
						p1:cancel()
					end)
				}
			}
		end, { UseResult1 })
	})))
	
	return {
		title = Frame.title,
		value = Frame.value,
		description = Frame.description,
		isEditing = UseStateResult,
		draft = UseSettingsTextInputDraftModuleResult.draft,
		hasError = UseSettingsTextInputDraftModuleResult.hasError,
		canSave = CanSave,
		saveText = UseLocalizationResult.save,
		cancelText = UseLocalizationResult.cancel,
		remainingCharacters = UseSettingsTextInputDraftModuleResult.remainingCharacters,
		hideCloseButton = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional,
		dialogRef = UseDefaultFocusBehaviorResult2,
		inputRef = UseDefaultFocusBehaviorResult,
		onOpen = UseResult,
		onCancel = UseResult1,
		onDraftChanged = UseSettingsTextInputDraftModuleResult.onDraftChanged,
		onSave = UseResult2,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--settings-text-input-field"
	}
end
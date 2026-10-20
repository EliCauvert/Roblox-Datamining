local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local CountCharsModule = require(AppChat.Utils.countChars)
local IsOverLengthModule = require(AppChat.Utils.isOverLength)
local _ = require(script.Parent.InputDialogView)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), CountCharsModule (copy), IsOverLengthModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.inputText or "")
	local MaxCharacters = p1.maxCharacters
	local CountCharsModuleResult = CountCharsModule(UseStateResult)
	local IsOverLengthModule1 = IsOverLengthModule(UseStateResult, MaxCharacters, p1.maxUtf16Units)
	local IsLoading = p1.isLoading
	local OnModalCloseFunction = p1.onModalClose
	local OnActivatedFunction = p1.onActivated
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsLoading (copy), OnModalCloseFunction (copy)
		if not IsLoading and OnModalCloseFunction then
			OnModalCloseFunction()
		end
	end, { OnModalCloseFunction, IsLoading })
	
	return {
		titleText = p1.titleText,
		cancelText = p1.cancelText,
		confirmText = p1.confirmText,
		placeholderText = p1.placeholderText,
		warningText = p1.warningText,
		text = UseStateResult,
		counterText = `{CountCharsModuleResult}/{MaxCharacters}`,
		isOverLimit = IsOverLengthModule1,
		isLoading = IsLoading,
		onTextChanged = UseStateResult2,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: IsOverLengthModule1 (copy), IsLoading (copy), OnActivatedFunction (copy), UseStateResult (copy), OnModalCloseFunction (copy)
			if IsOverLengthModule1 or IsLoading then return end
			if (not OnActivatedFunction or not OnActivatedFunction({ InputBox = UseStateResult })) and OnModalCloseFunction then
				OnModalCloseFunction()
			end
		end, {
			OnActivatedFunction,
			OnModalCloseFunction,
			UseStateResult,
			IsOverLengthModule1,
			IsLoading
		}),
		onCancel = UseResult,
		dialogRef = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: UseResult (upval)
							UseResult()
							p2:cancel()
						end)
					}
				}
			end, { UseResult })
		})
	}
end
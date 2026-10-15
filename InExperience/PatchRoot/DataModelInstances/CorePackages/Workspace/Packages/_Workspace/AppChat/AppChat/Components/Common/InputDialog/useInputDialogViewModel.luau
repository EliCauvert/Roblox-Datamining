local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.ReactFocusNavigation)
local countCharsModule = require(appChat.Utils.countChars)
local isOverLengthModule = require(appChat.Utils.isOverLength)
local _ = require(script.Parent.InputDialogView)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: reactModule (ref), countCharsModule (ref), isOverLengthModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref)
	local var1, var2 = reactModule.useState(p1.inputText or "")
	local maxCharacters = p1.maxCharacters
	local var3 = countCharsModule(var1)
	local var4 = isOverLengthModule(var1, maxCharacters, p1.maxUtf16Units)
	local isLoading = p1.isLoading
	local onModalClose = p1.onModalClose
	local onActivated = p1.onActivated
	local var5 = reactModule.useCallback(function()
		-- upvalues: isLoading (ref), onModalClose (ref)
		if not isLoading and onModalClose then
			onModalClose()
		end
	end, { onModalClose, isLoading })
	
	return {
		titleText = p1.titleText,
		cancelText = p1.cancelText,
		confirmText = p1.confirmText,
		placeholderText = p1.placeholderText,
		warningText = p1.warningText,
		text = var1,
		counterText = `{var3}/{maxCharacters}`,
		isOverLimit = var4,
		isLoading = isLoading,
		onTextChanged = var2,
		onConfirm = reactModule.useCallback(function()
			-- upvalues: var4 (ref), isLoading (ref), onActivated (ref), var1 (ref), onModalClose (ref)
			if var4 or isLoading then return end
			if (not onActivated or not onActivated({ InputBox = var1 })) and onModalClose then
				onModalClose()
			end
		end, {
			onActivated,
			onModalClose,
			var1,
			var4,
			isLoading
		}),
		onCancel = var5,
		dialogRef = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var5 (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: var5 (copy)
							var5()
							p2:cancel()
						end)
					}
				}
			end, { var5 })
		})
	}
end
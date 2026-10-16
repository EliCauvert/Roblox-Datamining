local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(InlineRichText.Types)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), NotificationModalsManagerModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		errorToastText = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local ErrorToastTextOverride = if p1.errorToastTextOverride and p1.errorToastTextOverride ~= "" then p1.errorToastTextOverride else UseLocalizationResult.errorToastText
	
	return ReactModule.useCallback(function() --[[ Line: 22 ]]
		-- upvalues: NotificationModalsManagerModule (upval), ErrorToastTextOverride (copy)
		NotificationModalsManagerModule.SetUIBloxToast({
			toastTitle = ErrorToastTextOverride,
			sequenceNumber = DateTime.now().UnixTimestamp
		})
	end, { ErrorToastTextOverride })
end
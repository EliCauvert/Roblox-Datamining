local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(inlineRichText.Types)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), notificationModalsManagerModule (ref)
	local var1 = if p1.errorToastTextOverride and p1.errorToastTextOverride ~= "" then p1.errorToastTextOverride else useLocalization({
		errorToastText = "CommonUI.Messages.Response.SomethingWentWrong"
	}).errorToastText
	
	return reactModule.useCallback(function()
		-- upvalues: notificationModalsManagerModule (copy), var1 (ref)
		notificationModalsManagerModule.SetUIBloxToast({
			toastTitle = var1,
			sequenceNumber = DateTime.now().UnixTimestamp
		})
	end, { var1 })
end
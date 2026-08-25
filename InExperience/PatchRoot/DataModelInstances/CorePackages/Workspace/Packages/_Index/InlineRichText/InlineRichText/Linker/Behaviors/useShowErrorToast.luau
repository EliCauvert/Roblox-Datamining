local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(inlineRichText.Types)

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), notificationModalsManagerModule (ref)
	local var3 = if p0.errorToastTextOverride and p0.errorToastTextOverride ~= "" then p0.errorToastTextOverride else useLocalization({
		errorToastText = "CommonUI.Messages.Response.SomethingWentWrong"
	}).errorToastText
	
	return reactModule.useCallback(function()
		-- upvalues: notificationModalsManagerModule (copy), var3 (ref)
		notificationModalsManagerModule.SetUIBloxToast({
			toastTitle = var3,
			sequenceNumber = DateTime.now().UnixTimestamp
		})
	end, { var3 })
end
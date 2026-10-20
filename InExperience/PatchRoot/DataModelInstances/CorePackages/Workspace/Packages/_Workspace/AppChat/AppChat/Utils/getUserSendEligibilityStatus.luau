local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local GetChatModerationStatusDataHydrationModule = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local GetEffectiveChatTimeoutDetailsModule = require(AppChat.Utils.getEffectiveChatTimeoutDetails)
local ToTimeoutEntryModule = require(AppChat.Utils.toTimeoutEntry)

return function(p1): string
	-- upvalues: GetChatModerationStatusDataHydrationModule (copy), DataHydrationModule (copy), GetEffectiveChatTimeoutDetailsModule (copy), ToTimeoutEntryModule (copy)
	if p1.isAvailable then
		local UserStatus = GetChatModerationStatusDataHydrationModule().getUserStatus()
		local StatusResult = UserStatus.status(p1.scope)
		
		return if StatusResult == DataHydrationModule.DataStatus.NotReady then "loading" elseif StatusResult == DataHydrationModule.DataStatus.Failed or not GetEffectiveChatTimeoutDetailsModule(ToTimeoutEntryModule(UserStatus.data(p1.scope)), nil, nil, p1.currentTimestamp).isTimedOut then "eligible" else "ineligible"
	else
		return "ineligible"
	end
end
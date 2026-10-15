local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local getEffectiveChatTimeoutDetailsModule = require(appChat.Utils.getEffectiveChatTimeoutDetails)
local toTimeoutEntryModule = require(appChat.Utils.toTimeoutEntry)

return function(p1)
	-- upvalues: getChatModerationStatusDataHydrationModule (ref), dataHydrationModule (ref), getEffectiveChatTimeoutDetailsModule (ref), toTimeoutEntryModule (ref)
	if not p1.isAvailable then
		return "ineligible"
	end
	local userStatus = getChatModerationStatusDataHydrationModule().getUserStatus()
	local var1 = userStatus.status(p1.scope)
	
	return if var1 == dataHydrationModule.DataStatus.NotReady then "loading" elseif var1 == dataHydrationModule.DataStatus.Failed or not getEffectiveChatTimeoutDetailsModule(toTimeoutEntryModule(userStatus.data(p1.scope)), nil, nil, p1.currentTimestamp).isTimedOut then "eligible" else "ineligible"
end
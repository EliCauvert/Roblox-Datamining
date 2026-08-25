local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.AppChatNetworking)

return function(p0)
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p1)
		-- upvalues: p0 (ref), getDeepValueModule (copy)
		return if p0 then (getDeepValueModule(p1, "ChatAppReducer.Modals.conversationTopModals") or {})[p0] else nil
	end)
end
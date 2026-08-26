local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.AppChatNetworking)

return function(p1)
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref), getDeepValueModule (copy)
		return if p1 then (getDeepValueModule(p2, "ChatAppReducer.Modals.conversationTopModals") or {})[p1] else nil
	end)
end
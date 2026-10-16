local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Parent.AppChatNetworking)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 13 ]]
		-- upvalues: p1 (copy), GetDeepValueModule (upval)
		return if p1 then (GetDeepValueModule(p2, "ChatAppReducer.Modals.conversationTopModals") or {})[p1] else nil
	end)
end
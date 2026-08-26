local parent = script:FindFirstAncestor("ExpChat").Parent
local friendsChatFocusModule = require(parent.FriendsChat.FriendsChatFocus)
local tabTypes = require(parent.ExpChatShared).TabTypes
local t = {
	shouldProceed = false,
	onFocusKeyPressed = function(_)
		return Enum.ContextActionResult.Pass
	end
}

return function(p1)
	-- upvalues: friendsChatFocusModule (ref), t (ref), tabTypes (ref)
	return if p1 == "FriendsChat" then {
		shouldProceed = friendsChatFocusModule.canFocus(),
		onFocusKeyPressed = friendsChatFocusModule.focus
	} elseif p1 == "TextChat" then t elseif p1 == "UniverseChat" then t else tabTypes.unreachable(p1)
end
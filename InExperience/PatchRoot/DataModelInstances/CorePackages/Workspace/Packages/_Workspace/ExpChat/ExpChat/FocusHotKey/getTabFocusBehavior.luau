local parent = script:FindFirstAncestor("ExpChat").Parent
local friendsChatFocusModule = require(parent.FriendsChat.FriendsChatFocus)
local tabTypes = require(parent.ExpChatShared).TabTypes
local t = {
	shouldProceed = false,
	onFocusKeyPressed = function(_)
		return Enum.ContextActionResult.Pass
	end
}

return function(p0)
	-- upvalues: friendsChatFocusModule (ref), t (ref), tabTypes (ref)
	return if p0 == "FriendsChat" then {
		shouldProceed = friendsChatFocusModule.canFocus(),
		onFocusKeyPressed = friendsChatFocusModule.focus
	} elseif p0 == "TextChat" then t elseif p0 == "UniverseChat" then t else tabTypes.unreachable(p0)
end
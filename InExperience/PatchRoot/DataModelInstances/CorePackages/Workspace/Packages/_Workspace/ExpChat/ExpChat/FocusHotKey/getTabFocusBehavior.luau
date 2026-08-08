local parent = script:FindFirstAncestor("ExpChat").Parent
local friendsChatFocusModule = require(parent.FriendsChat.FriendsChatFocus)
local tabTypes = require(parent.ExpChatShared).TabTypes
local t = {
	shouldProceed = false,
	onFocusKeyPressed = function(_) --[[ line: 35 ]]
		return Enum.ContextActionResult.Pass
	end
}

return function(p0) --[[ line: 45 | named "getTabFocusBehavior" ]]
	-- upvalues: friendsChatFocusModule (ref), t (ref), tabTypes (ref)
	return if p0 == "FriendsChat" then {
		shouldProceed = friendsChatFocusModule.canFocus(),
		onFocusKeyPressed = friendsChatFocusModule.focus
	} elseif p0 == "TextChat" then t elseif p0 == "UniverseChat" then t else tabTypes.unreachable(p0)
end
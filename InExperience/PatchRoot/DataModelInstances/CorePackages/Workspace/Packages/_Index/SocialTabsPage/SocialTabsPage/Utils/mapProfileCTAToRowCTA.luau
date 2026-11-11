local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ButtonTypes = require(Parent.UserList).Enums.ButtonTypes
local _ = require(SocialTabsPage.Common.Types)
local FFlagUserListActionsV2 = require(Parent.SharedFlags).FFlagUserListActionsV2

local function v5() end

local config = {
	JoinExperience = ButtonTypes.Join,
	Chat = ButtonTypes.Chat,
	AddFriend = ButtonTypes.Add,
	AcceptFriendRequest = ButtonTypes.Accept,
	PendingFriendRequest = ButtonTypes.Pending
}

return function(p1, p2, p3)
	-- upvalues: config (copy), ButtonTypes (copy), FFlagUserListActionsV2 (copy), v5 (copy)
	if not p1 or not p1.buttons then
		return nil
	end
	local Entry = nil
	for _, button in p1.buttons do
		Entry = config[button.type]
		
		if Entry then
			local Callback = p2[Entry]
			
			return {
				type = Entry,
				onActivated = if Callback then function()
					-- upvalues: Callback (copy), p3 (copy)
					Callback(p3)
				end else v5,
				isDisabled = FFlagUserListActionsV2 and button.disabledReason ~= nil or (Entry == ButtonTypes.Pending or nil),
				disabledReason = button.disabledReason
			}
		end
	end
	return nil
end
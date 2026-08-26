local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local buttonTypes = require(socialTabsPage.Parent.UserList).Enums.ButtonTypes
local _ = require(socialTabsPage.Common.Types)

local var1 = function() end

local t = {
	JoinExperience = buttonTypes.Join,
	Chat = buttonTypes.Chat,
	AddFriend = buttonTypes.Add,
	AcceptFriendRequest = buttonTypes.Accept,
	PendingFriendRequest = buttonTypes.Pending
}

return function(p1, p2, p3)
	-- upvalues: t (ref), var1 (ref), buttonTypes (ref)
	if not p1 or not p1.buttons then
		return nil
	end
	for i, v in p1.buttons do
		local type = t[v.type]
		
		if type then
			local var2 = p2[type]
			
			return {
				type = type,
				onActivated = if var2 then function()
					-- upvalues: var2 (ref), p3 (ref)
					var2(p3)
				end else var1,
				isDisabled = type == buttonTypes.Pending or nil,
				disabledReason = v.disabledReason
			}
		end
	end
	return nil
end
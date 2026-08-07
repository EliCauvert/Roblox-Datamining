local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local buttonTypes = require(socialTabsPage.Parent.UserList).Enums.ButtonTypes
local _ = require(socialTabsPage.Common.Types)

local var1 = function() --[[ line: 13 ]] end

local t = {
	JoinExperience = buttonTypes.Join,
	Chat = buttonTypes.Chat,
	AddFriend = buttonTypes.Add,
	AcceptFriendRequest = buttonTypes.Accept,
	PendingFriendRequest = buttonTypes.Pending
}

return function(p0, p1, p2) --[[ line: 23 | named "mapProfileCTAToRowCTA" ]]
	-- upvalues: t (ref), var1 (ref), buttonTypes (ref)
	if not p0 or not p0.buttons then
		return nil
	end
	for i, v in p0.buttons do
		local type = t[v.type]
		
		if type then
			local var3 = p1[type]
			
			return {
				type = type,
				onActivated = if var3 then function() --[[ line: 39 ]]
					-- upvalues: var3 (ref), p2 (ref)
					var3(p2)
				end else var1,
				isDisabled = type == buttonTypes.Pending or nil,
				disabledReason = v.disabledReason
			}
		end
	end
	return nil
end
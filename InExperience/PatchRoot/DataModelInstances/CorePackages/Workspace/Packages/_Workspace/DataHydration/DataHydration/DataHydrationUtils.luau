local parent = script:FindFirstAncestor("DataHydration").Parent
local playersService = game:GetService("Players")
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local var1 = if fFlagAddFriendsPageTrustedFriendRequestSection then require(parent.Cryo) else nil

return {
	areAllKeysPresent = function(p0, p1)
		if p0 == nil or type(p0) ~= "table" then
			return #p1 == 0
		end
		for i, v in p1 do
			if p0[v] == nil then
				return false
			end
		end
		return true
	end,
	getLocalPlayerUserId = function()
		-- upvalues: playersService (ref)
		local var2 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
		
		return if var2 == nil or var2 <= 0 then nil else var2
	end,
	mergeListsWithoutDuplicates = if fFlagAddFriendsPageTrustedFriendRequestSection then function(p2, p3, p4)
		-- upvalues: var1 (ref)
		if p3 and #p3 ~= 0 then
			if p2 and #p2 ~= 0 then
				local var3 = var1.List.toSet(var1.List.map(p2, function(p5)
					-- upvalues: p4 (ref)
					return if p4 then p5[p4] else p5
				end))
				
				return var1.List.join(table.clone(p2), var1.List.filter(p3, function(p6)
					-- upvalues: p4 (ref), var3 (ref)
					return not var3[if p4 then p6[p4] else p6]
				end))
			end
			return p3
		else
			return p2 or {}
		end
	end else nil
}
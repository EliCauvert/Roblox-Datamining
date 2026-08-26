local parent = script:FindFirstAncestor("DataHydration").Parent
local playersService = game:GetService("Players")
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagFriendsRequestsMergeListsWithoutDuplicates = require(parent.SharedFlags).FFlagFriendsRequestsMergeListsWithoutDuplicates
local var1 = if fFlagAddFriendsPageTrustedFriendRequestSection or fFlagFriendsRequestsMergeListsWithoutDuplicates then require(parent.Cryo) else nil

return {
	areAllKeysPresent = function(p1, p2)
		if p1 == nil or type(p1) ~= "table" then
			return #p2 == 0
		end
		for i, v in p2 do
			if p1[v] == nil then
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
	mergeListsWithoutDuplicates = if fFlagAddFriendsPageTrustedFriendRequestSection or fFlagFriendsRequestsMergeListsWithoutDuplicates then function(p3, p4, p5)
		-- upvalues: var1 (ref)
		if p4 and #p4 ~= 0 then
			if p3 and #p3 ~= 0 then
				local var2 = var1.List.toSet(var1.List.map(p3, function(p6)
					-- upvalues: p5 (ref)
					return if p5 then p6[p5] else p6
				end))
				
				return var1.List.join(table.clone(p3), var1.List.filter(p4, function(p6)
					-- upvalues: p5 (ref), var2 (ref)
					return not var2[if p5 then p6[p5] else p6]
				end))
			end
			return p4
		else
			return p3 or {}
		end
	end else nil
}
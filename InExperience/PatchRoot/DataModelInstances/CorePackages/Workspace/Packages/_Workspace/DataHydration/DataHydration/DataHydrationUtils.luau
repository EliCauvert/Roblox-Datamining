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
	observeLocalPlayerUserId = function(p3)
		-- upvalues: playersService (ref)
		local var2 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
		local var3 = if var2 == nil or var2 <= 0 then nil else var2
		var2 = nil
		local _ = nil
		local var4 = false
		
		local function notifyIfChanged()
			-- upvalues: playersService (copy), var3 (write), p3 (ref)
			local var5 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
			local var6 = if var5 == nil or var5 <= 0 then nil else var5
			
			if var6 == var3 then
				return
			end
			var3 = var6
			p3(var6)
		end
		
		local function _()
			-- upvalues: var2 (write), playersService (copy), notifyIfChanged (ref)
			if var2 ~= nil then
				var2:Disconnect()
				var2 = nil
			end
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer ~= nil then
				var2 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
			end
		end
		
		if var2 ~= nil then
			var2:Disconnect()
			var2 = nil
		end
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer ~= nil then
			var2 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
		end
		local var5 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: var2 (write), playersService (copy), notifyIfChanged (ref), var3 (write), p3 (ref)
			if var2 ~= nil then
				var2:Disconnect()
				var2 = nil
			end
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer ~= nil then
				var2 = localPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
			end
			local var6 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
			local var7 = if var6 == nil or var6 <= 0 then nil else var6
			
			if var7 == var3 then
				return
			end
			var3 = var7
			p3(var7)
		end)
		
		return function()
			-- upvalues: var4 (write), var2 (write), var5 (write)
			if var4 then return end
			var4 = true
			
			if var2 ~= nil then
				var2:Disconnect()
				var2 = nil
			end
			if var5 ~= nil then
				var5:Disconnect()
				var5 = nil
			end
		end
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
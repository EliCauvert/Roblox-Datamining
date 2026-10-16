local Parent = script:FindFirstAncestor("DataHydration").Parent
local Players = game:GetService("Players")
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local FFlagFriendsRequestsMergeListsWithoutDuplicates = require(Parent.SharedFlags).FFlagFriendsRequestsMergeListsWithoutDuplicates
local CryoModule = if FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates then require(Parent.Cryo) else nil

local function mergeListsWithoutDuplicates(Tbl, p1, p2) --[[ Line: 86 ]]
	-- upvalues: CryoModule (copy)
	if not p1 or #p1 == 0 then
		return if Tbl then Tbl else {}
	elseif Tbl and #Tbl ~= 0 then
		local Set = CryoModule.List.toSet(CryoModule.List.map(Tbl, function(p3) --[[ Line: 94 ]]
			-- upvalues: p2 (copy)
			return if p2 then p3[p2] else p3
		end))
		
		return CryoModule.List.join(table.clone(Tbl), (CryoModule.List.filter(p1, function(p3): boolean --[[ Line: 99 ]]
			-- upvalues: p2 (copy), Set (copy)
			return not Set[if p2 then p3[p2] else p3]
		end)))
	else
		return p1
	end
end

return {
	areAllKeysPresent = function(p3, List): boolean --[[ Line: 74 ]]
		if p3 == nil or type(p3) ~= "table" then
			return #List == 0
		end
		for _, value in List do
			if p3[value] == nil then
				return false
			end
		end
		return true
	end,
	getLocalPlayerUserId = function() --[[ Line: 15 ]]
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		
		return if UserId == nil or UserId <= 0 then nil else UserId
	end,
	observeLocalPlayerUserId = function(Callback) --[[ Line: 24 ]]
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		local UserId1 = if UserId == nil or UserId <= 0 then nil else UserId
		local Connection = nil
		local Connection1 = nil
		local Flag = false
		
		local function notifyIfChanged() --[[ Line: 30 ]]
			-- upvalues: Players (upval), UserId1 (ref), Callback (copy)
			local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
			local UserId2 = if UserId == nil or UserId <= 0 then nil else UserId
			
			if UserId2 ~= UserId1 then
				UserId1 = UserId2
				Callback(UserId2)
				
				return
			end
		end
		
		local function _() --[[ Line: 39 | Named "bindLocalPlayer" ]]
			-- upvalues: Connection (ref), Players (upval), notifyIfChanged (copy)
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer ~= nil then
				Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
			end
		end
		
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer ~= nil then
			Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
		end
		Connection1 = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 52 ]]
			-- upvalues: Connection (ref), Players (upval), notifyIfChanged (copy), UserId1 (ref), Callback (copy)
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer ~= nil then
				Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(notifyIfChanged)
			end
			local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
			local UserId2 = if UserId == nil or UserId <= 0 then nil else UserId
			
			if UserId2 ~= UserId1 then
				UserId1 = UserId2
				Callback(UserId2)
				
				return
			end
		end)
		
		return function() --[[ Line: 57 ]]
			-- upvalues: Flag (ref), Connection (ref), Connection1 (ref)
			if Flag then return end
			Flag = true
			
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			if Connection1 ~= nil then
				Connection1:Disconnect()
				Connection1 = nil
			end
		end
	end,
	mergeListsWithoutDuplicates = if FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates then mergeListsWithoutDuplicates else nil
}
local Players = game:GetService("Players")
local CryoModule = require(script:FindFirstAncestor("DataHydration").Parent.Cryo)

return {
	areAllKeysPresent = function(p1, List): boolean
		if p1 == nil or type(p1) ~= "table" then
			return #List == 0
		end
		for _, value in List do
			if p1[value] == nil then
				return false
			end
		end
		return true
	end,
	getLocalPlayerUserId = function()
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		
		return if UserId == nil or UserId <= 0 then nil else UserId
	end,
	observeLocalPlayerUserId = function(Callback)
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		local UserId1 = if UserId == nil or UserId <= 0 then nil else UserId
		local Connection = nil
		local Connection1 = nil
		local Flag = false
		
		local function notifyIfChanged()
			-- upvalues: Players (upval), UserId1 (ref), Callback (copy)
			local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
			local UserId2 = if UserId == nil or UserId <= 0 then nil else UserId
			
			if UserId2 ~= UserId1 then
				UserId1 = UserId2
				Callback(UserId2)
				
				return
			end
		end
		
		local function _()
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
		Connection1 = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
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
		
		return function()
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
	mergeListsWithoutDuplicates = function(Tbl, p2, p3)
		-- upvalues: CryoModule (copy)
		if not p2 or #p2 == 0 then
			return if Tbl then Tbl else {}
		elseif Tbl and #Tbl ~= 0 then
			local Set = CryoModule.List.toSet(CryoModule.List.map(Tbl, function(p4)
				-- upvalues: p3 (copy)
				return if p3 then p4[p3] else p4
			end))
			
			return CryoModule.List.join(table.clone(Tbl), (CryoModule.List.filter(p2, function(p4): boolean
				-- upvalues: p3 (copy), Set (copy)
				return not Set[if p3 then p4[p3] else p4]
			end)))
		else
			return p2
		end
	end
}
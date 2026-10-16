local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Url = require(script:FindFirstAncestor("BlockingUtility").Parent.Http).Url
local BlockingUtilityModule = {}
BlockingUtilityModule.__index = BlockingUtilityModule
local UpdatePlayerBlockList = nil
spawn(function() --[[ Line: 19 ]]
	-- upvalues: UpdatePlayerBlockList (ref), RobloxReplicatedStorage (copy)
	UpdatePlayerBlockList = RobloxReplicatedStorage:WaitForChild("UpdatePlayerBlockList", 1e999)
end)
local BindableEvent = Instance.new("BindableEvent")
local BindableEvent1 = Instance.new("BindableEvent")
local BindableEvent2 = Instance.new("BindableEvent")
local Flag = false
local BindableEvent3 = Instance.new("BindableEvent")
local t = {}
local t1 = {}

local function _() --[[ Line: 32 | Named "getBlockedUserIdsFromBlockedList" ]]
	-- upvalues: t (ref)
	local List = {}
	
	for i, _ in t do
		table.insert(List, i)
	end
	return List
end

local function getBlockedUserIds() --[[ Line: 40 ]]
	-- upvalues: Players (copy), Flag (ref), t (ref)
	if Players.LocalPlayer.UserId > 0 then
		local NewElapsed = 0
		while true do
			if Flag then break end
			NewElapsed += wait()
			
			if NewElapsed > 5 then
				return {}
			end
		end
	end
	return {}
end

local _ = function(p1): boolean --[[ Line: 57 | Named "isBlocked" ]]
	-- upvalues: t (ref)
	return if t[p1] then true else false
end

local _ = function(p1): boolean --[[ Line: 64 | Named "isMuted" ]]
	-- upvalues: t1 (copy)
	return t1[p1] ~= nil and t1[p1] == true
end

local function BlockPlayerAsync(Player: Player) --[[ Line: 71 ]]
	-- upvalues: Players (copy), t (ref), BindableEvent (copy), Url (copy), HttpRbxApiService (copy), HttpService (copy), UpdatePlayerBlockList (ref), BindableEvent1 (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if Player and LocalPlayer ~= Player then
		local UserId: number = Player.UserId
		
		if UserId > 0 then
			if if t[UserId] then true else false then
				return true
			end
			t[UserId] = true
			BindableEvent:Fire(UserId, true)
			local Success, Result = pcall(function() --[[ Line: 81 ]]
				-- upvalues: Url (upval), Player (copy), HttpRbxApiService (upval), HttpService (upval)
				local PostAsyncFullUrlResult = HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(Player.UserId) .. "/block-user", "")
				
				if not PostAsyncFullUrlResult then return end
				return (HttpService:JSONDecode(PostAsyncFullUrlResult))
			end)
			
			if Success and Result then
				if UpdatePlayerBlockList then
					UpdatePlayerBlockList:FireServer(UserId, true)
				end
				BindableEvent1:Fire(UserId, true)
			else
				t[UserId] = nil
				BindableEvent:Fire(UserId, false)
			end
			return Success and Result
		end
	end
	return false
end

local function UnblockPlayerAsync(Player: Player) --[[ Line: 115 ]]
	-- upvalues: t (ref), BindableEvent (copy), Url (copy), HttpRbxApiService (copy), HttpService (copy), UpdatePlayerBlockList (ref), BindableEvent1 (copy)
	if not Player then
		return false
	end
	local UserId = Player.UserId
	
	if not (if t[UserId] then true else false) then
		return true
	end
	t[UserId] = nil
	BindableEvent:Fire(UserId, false)
	local Success, Result = pcall(function(): boolean? --[[ Line: 124 ]]
		-- upvalues: Url (upval), Player (copy), HttpRbxApiService (upval), HttpService (upval)
		local PostAsyncFullUrlResult = HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(Player.UserId) .. "/unblock-user", "")
		
		if not PostAsyncFullUrlResult then return end
		local Data = HttpService:JSONDecode(PostAsyncFullUrlResult)
		
		return Data and not Data.errors
	end)
	
	if Success and Result then
		if UpdatePlayerBlockList then
			UpdatePlayerBlockList:FireServer(UserId, false)
		end
		BindableEvent1:Fire(UserId, false)
	else
		t[UserId] = true
		BindableEvent:Fire(UserId, true)
	end
	return Success and Result
end

local function AddPlayerToBlockList(Player): boolean --[[ Line: 161 ]]
	-- upvalues: Players (copy), t (ref), BindableEvent (copy), UpdatePlayerBlockList (ref), BindableEvent1 (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if Player and LocalPlayer ~= Player then
		local UserId: number = Player.UserId
		
		if UserId > 0 then
			if not (if t[UserId] then true else false) then
				t[UserId] = true
				BindableEvent:Fire(UserId, true)
				
				if UpdatePlayerBlockList then
					UpdatePlayerBlockList:FireServer(UserId, true)
				end
				if BindableEvent1 then
					BindableEvent1:Fire(UserId, true)
				end
			end
			return true
		end
	end
	return false
end

local function RemovePlayerFromBlockList(Player): boolean --[[ Line: 189 ]]
	-- upvalues: t (ref), BindableEvent (copy), UpdatePlayerBlockList (ref), BindableEvent1 (copy)
	if not Player then
		return false
	end
	local UserId = Player.UserId
	
	if if t[UserId] then true else false then
		t[UserId] = nil
		BindableEvent:Fire(UserId, false)
		
		if UpdatePlayerBlockList then
			UpdatePlayerBlockList:FireServer(UserId, false)
		end
		if BindableEvent1 then
			BindableEvent1:Fire(UserId, false)
		end
	end
	return true
end

local function MutePlayer(Player) --[[ Line: 211 ]]
	-- upvalues: Players (copy), t1 (copy), BindableEvent2 (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if Player and LocalPlayer ~= Player then
		local UserId: number = Player.UserId
		
		if UserId > 0 and (t1[UserId] == nil or t1[UserId] ~= true) then
			t1[UserId] = true
			BindableEvent2:Fire(UserId, true)
		end
	end
end

local function UnmutePlayer(Player) --[[ Line: 224 ]]
	-- upvalues: t1 (copy), BindableEvent2 (copy)
	if Player then
		local UserId = Player.UserId
		t1[UserId] = nil
		BindableEvent2:Fire(UserId, false)
	end
end

local BindableEvent4 = Instance.new("BindableEvent")
local BindableEvent5 = Instance.new("BindableEvent")
local BindableEvent6 = Instance.new("BindableEvent")
local BindableEvent7 = Instance.new("BindableEvent")
BindableEvent.Event:Connect(function(UserId, p1) --[[ Line: 239 | Named "blockedStatusChanged" ]]
	-- upvalues: Players (copy), BindableEvent4 (copy), BindableEvent5 (copy)
	local Player = Players:GetPlayerByUserId(UserId)
	
	if Player then
		if p1 then
			BindableEvent4:Fire(Player)
			
			return
		end
		BindableEvent5:Fire(Player)
	end
end)
BindableEvent2.Event:Connect(function(UserId, p1) --[[ Line: 252 | Named "muteStatusChanged" ]]
	-- upvalues: Players (copy), BindableEvent6 (copy), BindableEvent7 (copy)
	local Player = Players:GetPlayerByUserId(UserId)
	
	if Player then
		if p1 then
			BindableEvent6:Fire(Player)
			
			return
		end
		BindableEvent7:Fire(Player)
	end
end)
StarterGui:RegisterGetCore("PlayerBlockedEvent", function() --[[ Line: 265 ]]
	-- upvalues: BindableEvent4 (copy)
	return BindableEvent4
end)
StarterGui:RegisterGetCore("PlayerUnblockedEvent", function() --[[ Line: 268 ]]
	-- upvalues: BindableEvent5 (copy)
	return BindableEvent5
end)
StarterGui:RegisterGetCore("PlayerMutedEvent", function() --[[ Line: 271 ]]
	-- upvalues: BindableEvent6 (copy)
	return BindableEvent6
end)
StarterGui:RegisterGetCore("PlayerUnmutedEvent", function() --[[ Line: 274 ]]
	-- upvalues: BindableEvent7 (copy)
	return BindableEvent7
end)
task.spawn(function() --[[ Line: 278 ]]
	-- upvalues: t (ref), Flag (ref), BindableEvent (copy), BindableEvent3 (copy)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(List) --[[ Line: 281 ]]
		-- upvalues: t (upval), Flag (upval), BindableEvent (upval), BindableEvent3 (upval)
		local t2 = {}
		
		for i, _ in List do
			t2[tonumber(i)] = true
		end
		local t3 = t
		t = t2
		Flag = true
		
		for i1 in t2 do
			if not t3[i1] then
				BindableEvent:Fire(i1, true)
			end
		end
		for i2 in t3 do
			if not t2[i2] then
				BindableEvent:Fire(i2, false)
			end
		end
		BindableEvent3:Fire()
	end)
end)
task.spawn(function() --[[ Line: 306 ]]
	-- upvalues: t (ref), BindableEvent (copy)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(Key, p1) --[[ Line: 310 ]]
		-- upvalues: t (upval), BindableEvent (upval)
		t[Key] = if p1 then true else nil
		BindableEvent:Fire(Key, p1)
	end)
end)

function BlockingUtilityModule:BlockPlayerAsync(Player) --[[ Line: 316 ]]
	-- upvalues: BlockPlayerAsync (copy)
	return (BlockPlayerAsync(Player))
end

function BlockingUtilityModule:UnblockPlayerAsync(Player) --[[ Line: 320 ]]
	-- upvalues: UnblockPlayerAsync (copy)
	return (UnblockPlayerAsync(Player))
end

function BlockingUtilityModule:MutePlayer(Player) --[[ Line: 324 ]]
	-- upvalues: MutePlayer (copy)
	return MutePlayer(Player)
end

function BlockingUtilityModule:UnmutePlayer(Player) --[[ Line: 328 ]]
	-- upvalues: UnmutePlayer (copy)
	return UnmutePlayer(Player)
end

function BlockingUtilityModule:IsPlayerBlockedByUserId(p1): boolean --[[ Line: 332 ]]
	-- upvalues: t (ref)
	return if t[p1] then true else false
end

function BlockingUtilityModule:GetBlockedStatusChangedEvent() --[[ Line: 336 ]]
	-- upvalues: BindableEvent (copy)
	return BindableEvent.Event
end

function BlockingUtilityModule:GetAfterBlockedStatusChangedEvent() --[[ Line: 342 ]]
	-- upvalues: BindableEvent1 (copy)
	return BindableEvent1.Event
end

function BlockingUtilityModule:GetMutedStatusChangedEvent() --[[ Line: 346 ]]
	-- upvalues: BindableEvent2 (copy)
	return BindableEvent2.Event
end

function BlockingUtilityModule:IsPlayerMutedByUserId(p1): boolean --[[ Line: 350 ]]
	-- upvalues: t2 (copy)
	return t2[p1] ~= nil and t2[p1] == true
end

function BlockingUtilityModule:GetBlockedUserIdsAsync() --[[ Line: 354 ]]
	-- upvalues: getBlockedUserIds (copy)
	return (getBlockedUserIds())
end

function BlockingUtilityModule:AddPlayerToBlockList(Player) --[[ Line: 358 ]]
	-- upvalues: AddPlayerToBlockList (copy)
	return (AddPlayerToBlockList(Player))
end

function BlockingUtilityModule:RemovePlayerFromBlockList(Player) --[[ Line: 362 ]]
	-- upvalues: RemovePlayerFromBlockList (copy)
	return (RemovePlayerFromBlockList(Player))
end

return BlockingUtilityModule
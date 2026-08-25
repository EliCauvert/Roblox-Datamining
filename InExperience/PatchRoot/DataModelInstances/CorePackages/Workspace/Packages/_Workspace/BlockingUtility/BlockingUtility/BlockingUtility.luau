local parent = script:FindFirstAncestor("BlockingUtility").Parent
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local starterGuiService = game:GetService("StarterGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local url = require(parent.Http).Url
local blockingUtilityClearUnblockedFromBlockedList = game:DefineFastFlag("BlockingUtilityClearUnblockedFromBlockedList", false)
local blockingUtilityRefireOnReplace = game:DefineFastFlag("BlockingUtilityRefireOnReplace", false)
local t = {}
t.__index = t
local var8 = nil
spawn(function()
	-- upvalues: var8 (write), robloxReplicatedStorageService (ref)
	var8 = robloxReplicatedStorageService:WaitForChild("UpdatePlayerBlockList", 1e999)
end)
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
local bindableEvent_2 = Instance.new("BindableEvent")
local var12 = false
local bindableEvent_3 = Instance.new("BindableEvent")
local t_1 = {}
local t_2 = {}

local function _()
	-- upvalues: t_1 (write)
	local t = {}
	
	for i, v in t_1 do
		table.insert(t, i)
	end
	return t
end

local function getBlockedUserIds()
	-- upvalues: playersService (ref), var12 (write), t_1 (write)
	if playersService.LocalPlayer.UserId > 0 then
		local var28 = 0
		while true do
			if not var12 then
				var28 += wait()
				
				if var28 > 5 then
					return {}
				end
			end
			local t = {}
			
			for i, v in t_1 do
				table.insert(t, i)
			end
			return t
		end
	end
	return {}
end

local _ = function(p0)
	-- upvalues: t_1 (write)
	return t_1[p0]
end

local _ = function(p1)
	-- upvalues: t_2 (ref)
	return t_2[p1] == nil or t_2[p1] ~= true
end

local function BlockPlayerAsync(p2)
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), url (ref), httpRbxApiService (ref), httpService (ref), var8 (write), bindableEvent_1 (ref)
	if p2 and playersService.LocalPlayer ~= p2 then
		local userId = p2.UserId
		
		if userId <= 0 then
			return false
		end
		if if t_1[userId] then true else false then
			return true
		end
		t_1[userId] = true
		bindableEvent:Fire(userId, true)
		local _ = nil
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: url (copy), p2 (ref), httpRbxApiService (copy), httpService (copy)
			local var32 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p2.UserId) .. "/block-user", "")
			
			if var32 then
				return httpService:JSONDecode(var32)
			end
		end)
		local var30 = ok
		local var31 = status
		
		if var30 and var31 then
			if var8 then
				var8:FireServer(userId, true)
			end
			bindableEvent_1:Fire(userId, true)
		else
			t_1[userId] = nil
			bindableEvent:Fire(userId, false)
		end
		return var30 and var31
	end
end

local function UnblockPlayerAsync(p3)
	-- upvalues: t_1 (write), bindableEvent (ref), url (ref), httpRbxApiService (ref), httpService (ref), var8 (write), bindableEvent_1 (ref)
	if not p3 then
		return false
	end
	local userId = p3.UserId
	
	if not (if t_1[userId] then true else false) then
		return true
	end
	t_1[userId] = nil
	bindableEvent:Fire(userId, false)
	local _ = nil
	local _ = nil
	local ok, status = pcall(function()
		-- upvalues: url (copy), p3 (ref), httpRbxApiService (copy), httpService (copy)
		local var35 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p3.UserId) .. "/unblock-user", "")
		
		if var35 then
			var35 = httpService:JSONDecode(var35)
			
			return var35 and not var35.errors
		end
	end)
	local var33 = ok
	local var34 = status
	
	if var33 and var34 then
		if var8 then
			var8:FireServer(userId, false)
		end
		bindableEvent_1:Fire(userId, false)
	else
		t_1[userId] = true
		bindableEvent:Fire(userId, true)
	end
	return var33 and var34
end

local function AddPlayerToBlockList(p4)
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), var8 (write), bindableEvent_1 (ref)
	if p4 and playersService.LocalPlayer ~= p4 then
		local userId = p4.UserId
		
		if userId <= 0 then
			return false
		end
		if not (if t_1[userId] then true else false) then
			t_1[userId] = true
			bindableEvent:Fire(userId, true)
			
			if var8 then
				var8:FireServer(userId, true)
			end
			if bindableEvent_1 then
				bindableEvent_1:Fire(userId, true)
			end
		end
		return true
	end
end

local function RemovePlayerFromBlockList(p5)
	-- upvalues: t_1 (write), bindableEvent (ref), var8 (write), bindableEvent_1 (ref)
	if not p5 then
		return false
	end
	local userId = p5.UserId
	
	if if t_1[userId] then true else false then
		t_1[userId] = nil
		bindableEvent:Fire(userId, false)
		
		if var8 then
			var8:FireServer(userId, false)
		end
		if bindableEvent_1 then
			bindableEvent_1:Fire(userId, false)
		end
	end
	return true
end

local function MutePlayer(p6)
	-- upvalues: playersService (ref), t_2 (ref), bindableEvent_2 (ref)
	if p6 and playersService.LocalPlayer ~= p6 then
		local userId = p6.UserId
		
		if userId > 0 then
			local var36
			if t_2[userId] ~= nil then
				var36 = t_2[userId] ~= true
			end
			if not var36 then
				t_2[userId] = true
				bindableEvent_2:Fire(userId, true)
			end
		end
	end
end

local function UnmutePlayer(p7)
	-- upvalues: t_2 (ref), bindableEvent_2 (ref)
	if p7 then
		local userId = p7.UserId
		t_2[userId] = nil
		bindableEvent_2:Fire(userId, false)
	end
end

local bindableEvent_4 = Instance.new("BindableEvent")
local bindableEvent_5 = Instance.new("BindableEvent")
local bindableEvent_6 = Instance.new("BindableEvent")
local bindableEvent_7 = Instance.new("BindableEvent")
bindableEvent.Event:Connect(function(p8, p9)
	-- upvalues: playersService (ref), bindableEvent_4 (ref), bindableEvent_5 (ref)
	local var37 = playersService:GetPlayerByUserId(p8)
	
	if var37 then
		if p9 then
			bindableEvent_4:Fire(var37)
			
			return
		end
		bindableEvent_5:Fire(var37)
	end
end)
bindableEvent_2.Event:Connect(function(p10, p11)
	-- upvalues: playersService (ref), bindableEvent_6 (ref), bindableEvent_7 (ref)
	local var38 = playersService:GetPlayerByUserId(p10)
	
	if var38 then
		if p11 then
			bindableEvent_6:Fire(var38)
			
			return
		end
		bindableEvent_7:Fire(var38)
	end
end)
starterGuiService:RegisterGetCore("PlayerBlockedEvent", function()
	-- upvalues: bindableEvent_4 (ref)
	return bindableEvent_4
end)
starterGuiService:RegisterGetCore("PlayerUnblockedEvent", function()
	-- upvalues: bindableEvent_5 (ref)
	return bindableEvent_5
end)
starterGuiService:RegisterGetCore("PlayerMutedEvent", function()
	-- upvalues: bindableEvent_6 (ref)
	return bindableEvent_6
end)
starterGuiService:RegisterGetCore("PlayerUnmutedEvent", function()
	-- upvalues: bindableEvent_7 (ref)
	return bindableEvent_7
end)
task.spawn(function()
	-- upvalues: blockingUtilityRefireOnReplace (ref), t_1 (write), var12 (write), bindableEvent (ref), bindableEvent_3 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(p12)
		-- upvalues: blockingUtilityRefireOnReplace (copy), t_1 (copy), var12 (copy), bindableEvent (copy), bindableEvent_3 (copy)
		local t = {}
		
		for i, v in p12 do
			t[tonumber(i)] = true
		end
		if blockingUtilityRefireOnReplace then
			local var40 = t_1
			t_1 = t
			var12 = true
			
			for i_1 in t do
				if not var40[i_1] then
					bindableEvent:Fire(i_1, true)
				end
			end
			for i_2 in var40 do
				if not t[i_2] then
					bindableEvent:Fire(i_2, false)
				end
			end
		else
			t_1 = t
			var12 = true
		end
		bindableEvent_3:Fire()
	end)
end)
task.spawn(function()
	-- upvalues: blockingUtilityClearUnblockedFromBlockedList (ref), t_1 (write), bindableEvent (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(p13, p14)
		-- upvalues: blockingUtilityClearUnblockedFromBlockedList (copy), t_1 (copy), bindableEvent (copy)
		if blockingUtilityClearUnblockedFromBlockedList then
			t_1[p13] = if p14 then true else nil
		else
			t_1[p13] = p14
		end
		bindableEvent:Fire(p13, p14)
	end)
end)

function t.BlockPlayerAsync(_, p15)
	-- upvalues: BlockPlayerAsync (ref)
	return BlockPlayerAsync(p15)
end

function t.UnblockPlayerAsync(_, p16)
	-- upvalues: UnblockPlayerAsync (ref)
	return UnblockPlayerAsync(p16)
end

function t.MutePlayer(_, p17)
	-- upvalues: MutePlayer (ref)
	return MutePlayer(p17)
end

function t.UnmutePlayer(_, p18)
	-- upvalues: UnmutePlayer (ref)
	return UnmutePlayer(p18)
end

function t.IsPlayerBlockedByUserId(_, p19)
	-- upvalues: t_1 (write)
	return t_1[p19]
end

function t.GetBlockedStatusChangedEvent(_)
	-- upvalues: bindableEvent (ref)
	return bindableEvent.Event
end

function t.GetAfterBlockedStatusChangedEvent(_)
	-- upvalues: bindableEvent_1 (ref)
	return bindableEvent_1.Event
end

function t.GetMutedStatusChangedEvent(_)
	-- upvalues: bindableEvent_2 (ref)
	return bindableEvent_2.Event
end

function t.IsPlayerMutedByUserId(_, p20)
	-- upvalues: t_2 (ref)
	return t_2[p20] == nil or t_2[p20] ~= true
end

function t.GetBlockedUserIdsAsync(_)
	-- upvalues: getBlockedUserIds (ref)
	return getBlockedUserIds()
end

function t.AddPlayerToBlockList(_, p21)
	-- upvalues: AddPlayerToBlockList (ref)
	return AddPlayerToBlockList(p21)
end

function t.RemovePlayerFromBlockList(_, p22)
	-- upvalues: RemovePlayerFromBlockList (ref)
	return RemovePlayerFromBlockList(p22)
end

return t
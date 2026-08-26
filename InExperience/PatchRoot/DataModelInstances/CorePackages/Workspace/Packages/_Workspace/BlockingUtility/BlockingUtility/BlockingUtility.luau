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
local var1 = nil
spawn(function()
	-- upvalues: var1 (write), robloxReplicatedStorageService (ref)
	var1 = robloxReplicatedStorageService:WaitForChild("UpdatePlayerBlockList", 1e999)
end)
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
local bindableEvent_2 = Instance.new("BindableEvent")
local var2 = false
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
	-- upvalues: playersService (ref), var2 (write), t_1 (write)
	if playersService.LocalPlayer.UserId > 0 then
		local var3 = 0
		while true do
			if not var2 then
				var3 += wait()
				
				if var3 > 5 then
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

local _ = function(p1)
	-- upvalues: t_1 (write)
	return t_1[p1]
end

local _ = function(p1)
	-- upvalues: t_2 (ref)
	return t_2[p1] == nil or t_2[p1] ~= true
end

local function BlockPlayerAsync(p1)
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), url (ref), httpRbxApiService (ref), httpService (ref), var1 (write), bindableEvent_1 (ref)
	if p1 and playersService.LocalPlayer ~= p1 then
		local userId = p1.UserId
		
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
			-- upvalues: url (copy), p1 (ref), httpRbxApiService (copy), httpService (copy)
			local var4 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p1.UserId) .. "/block-user", "")
			
			if var4 then
				return httpService:JSONDecode(var4)
			end
		end)
		local var4 = ok
		local var5 = status
		
		if var4 and var5 then
			if var1 then
				var1:FireServer(userId, true)
			end
			bindableEvent_1:Fire(userId, true)
		else
			t_1[userId] = nil
			bindableEvent:Fire(userId, false)
		end
		return var4 and var5
	end
end

local function UnblockPlayerAsync(p1)
	-- upvalues: t_1 (write), bindableEvent (ref), url (ref), httpRbxApiService (ref), httpService (ref), var1 (write), bindableEvent_1 (ref)
	if not p1 then
		return false
	end
	local userId = p1.UserId
	
	if not (if t_1[userId] then true else false) then
		return true
	end
	t_1[userId] = nil
	bindableEvent:Fire(userId, false)
	local _ = nil
	local _ = nil
	local ok, status = pcall(function()
		-- upvalues: url (copy), p1 (ref), httpRbxApiService (copy), httpService (copy)
		local var4 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p1.UserId) .. "/unblock-user", "")
		
		if var4 then
			var4 = httpService:JSONDecode(var4)
			
			return var4 and not var4.errors
		end
	end)
	local var4 = ok
	local var5 = status
	
	if var4 and var5 then
		if var1 then
			var1:FireServer(userId, false)
		end
		bindableEvent_1:Fire(userId, false)
	else
		t_1[userId] = true
		bindableEvent:Fire(userId, true)
	end
	return var4 and var5
end

local function AddPlayerToBlockList(p1)
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), var1 (write), bindableEvent_1 (ref)
	if p1 and playersService.LocalPlayer ~= p1 then
		local userId = p1.UserId
		
		if userId <= 0 then
			return false
		end
		if not (if t_1[userId] then true else false) then
			t_1[userId] = true
			bindableEvent:Fire(userId, true)
			
			if var1 then
				var1:FireServer(userId, true)
			end
			if bindableEvent_1 then
				bindableEvent_1:Fire(userId, true)
			end
		end
		return true
	end
end

local function RemovePlayerFromBlockList(p1)
	-- upvalues: t_1 (write), bindableEvent (ref), var1 (write), bindableEvent_1 (ref)
	if not p1 then
		return false
	end
	local userId = p1.UserId
	
	if if t_1[userId] then true else false then
		t_1[userId] = nil
		bindableEvent:Fire(userId, false)
		
		if var1 then
			var1:FireServer(userId, false)
		end
		if bindableEvent_1 then
			bindableEvent_1:Fire(userId, false)
		end
	end
	return true
end

local function MutePlayer(p1)
	-- upvalues: playersService (ref), t_2 (ref), bindableEvent_2 (ref)
	if p1 and playersService.LocalPlayer ~= p1 then
		local userId = p1.UserId
		
		if userId > 0 then
			local var4
			if t_2[userId] ~= nil then
				var4 = t_2[userId] ~= true
			end
			if not var4 then
				t_2[userId] = true
				bindableEvent_2:Fire(userId, true)
			end
		end
	end
end

local function UnmutePlayer(p1)
	-- upvalues: t_2 (ref), bindableEvent_2 (ref)
	if p1 then
		local userId = p1.UserId
		t_2[userId] = nil
		bindableEvent_2:Fire(userId, false)
	end
end

local bindableEvent_4 = Instance.new("BindableEvent")
local bindableEvent_5 = Instance.new("BindableEvent")
local bindableEvent_6 = Instance.new("BindableEvent")
local bindableEvent_7 = Instance.new("BindableEvent")
bindableEvent.Event:Connect(function(p1, p2)
	-- upvalues: playersService (ref), bindableEvent_4 (ref), bindableEvent_5 (ref)
	local var4 = playersService:GetPlayerByUserId(p1)
	
	if var4 then
		if p2 then
			bindableEvent_4:Fire(var4)
			
			return
		end
		bindableEvent_5:Fire(var4)
	end
end)
bindableEvent_2.Event:Connect(function(p1, p2)
	-- upvalues: playersService (ref), bindableEvent_6 (ref), bindableEvent_7 (ref)
	local var4 = playersService:GetPlayerByUserId(p1)
	
	if var4 then
		if p2 then
			bindableEvent_6:Fire(var4)
			
			return
		end
		bindableEvent_7:Fire(var4)
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
	-- upvalues: blockingUtilityRefireOnReplace (ref), t_1 (write), var2 (write), bindableEvent (ref), bindableEvent_3 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(p1)
		-- upvalues: blockingUtilityRefireOnReplace (copy), t_1 (copy), var2 (copy), bindableEvent (copy), bindableEvent_3 (copy)
		local t = {}
		
		for i, v in p1 do
			t[tonumber(i)] = true
		end
		if blockingUtilityRefireOnReplace then
			local var4 = t_1
			t_1 = t
			var2 = true
			
			for i_1 in t do
				if not var4[i_1] then
					bindableEvent:Fire(i_1, true)
				end
			end
			for i_2 in var4 do
				if not t[i_2] then
					bindableEvent:Fire(i_2, false)
				end
			end
		else
			t_1 = t
			var2 = true
		end
		bindableEvent_3:Fire()
	end)
end)
task.spawn(function()
	-- upvalues: blockingUtilityClearUnblockedFromBlockedList (ref), t_1 (write), bindableEvent (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(p2, p3)
		-- upvalues: blockingUtilityClearUnblockedFromBlockedList (copy), t_1 (copy), bindableEvent (copy)
		if blockingUtilityClearUnblockedFromBlockedList then
			t_1[p2] = if p3 then true else nil
		else
			t_1[p2] = p3
		end
		bindableEvent:Fire(p2, p3)
	end)
end)

function t.BlockPlayerAsync(_, p2)
	-- upvalues: BlockPlayerAsync (ref)
	return BlockPlayerAsync(p2)
end

function t.UnblockPlayerAsync(_, p2)
	-- upvalues: UnblockPlayerAsync (ref)
	return UnblockPlayerAsync(p2)
end

function t.MutePlayer(_, p2)
	-- upvalues: MutePlayer (ref)
	return MutePlayer(p2)
end

function t.UnmutePlayer(_, p2)
	-- upvalues: UnmutePlayer (ref)
	return UnmutePlayer(p2)
end

function t.IsPlayerBlockedByUserId(_, p2)
	-- upvalues: t_1 (write)
	return t_1[p2]
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

function t.IsPlayerMutedByUserId(_, p2)
	-- upvalues: t_2 (ref)
	return t_2[p2] == nil or t_2[p2] ~= true
end

function t.GetBlockedUserIdsAsync(_)
	-- upvalues: getBlockedUserIds (ref)
	return getBlockedUserIds()
end

function t.AddPlayerToBlockList(_, p2)
	-- upvalues: AddPlayerToBlockList (ref)
	return AddPlayerToBlockList(p2)
end

function t.RemovePlayerFromBlockList(_, p2)
	-- upvalues: RemovePlayerFromBlockList (ref)
	return RemovePlayerFromBlockList(p2)
end

return t
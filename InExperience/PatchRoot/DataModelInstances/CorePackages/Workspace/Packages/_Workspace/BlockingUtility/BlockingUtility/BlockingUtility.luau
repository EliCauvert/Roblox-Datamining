local parent = script:FindFirstAncestor("BlockingUtility").Parent
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local starterGuiService = game:GetService("StarterGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local url = require(parent.Http).Url
local blockFireServerAfterHttp = game:DefineFastFlag("BlockFireServerAfterHttp", false)
local blockingUtilityClearUnblockedFromBlockedList = game:DefineFastFlag("BlockingUtilityClearUnblockedFromBlockedList", false)
local blockingUtilityRefireOnReplace = game:DefineFastFlag("BlockingUtilityRefireOnReplace", false)
local t = {}
t.__index = t
local var9 = nil
spawn(function() --[[ line: 24 ]]
	-- upvalues: var9 (write), robloxReplicatedStorageService (ref)
	var9 = robloxReplicatedStorageService:WaitForChild("UpdatePlayerBlockList", 1e999)
end)
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
local bindableEvent_2 = Instance.new("BindableEvent")
local var13 = false
local bindableEvent_3 = Instance.new("BindableEvent")
local t_1 = {}
local t_2 = {}

local function _() --[[ line: 37 | named "getBlockedUserIdsFromBlockedList" ]]
	-- upvalues: t_1 (write)
	local t = {}
	
	for i, v in t_1 do
		table.insert(t, i)
	end
	return t
end

local function getBlockedUserIds() --[[ line: 45 ]]
	-- upvalues: playersService (ref), var13 (write), t_1 (write)
	if playersService.LocalPlayer.UserId > 0 then
		local var29 = 0
		while true do
			if not var13 then
				var29 += wait()
				
				if var29 > 5 then
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

local _ = function(p0) --[[ line: 62 | named "isBlocked" ]]
	-- upvalues: t_1 (write)
	return t_1[p0]
end

local _ = function(p1) --[[ line: 69 | named "isMuted" ]]
	-- upvalues: t_2 (ref)
	return t_2[p1] == nil or t_2[p1] ~= true
end

local function BlockPlayerAsync(p2) --[[ line: 76 ]]
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), blockFireServerAfterHttp (ref), var9 (write), url (ref), httpRbxApiService (ref), httpService (ref), bindableEvent_1 (ref)
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
		
		if not blockFireServerAfterHttp and var9 then
			var9:FireServer(userId, true)
		end
		local _ = nil
		local _ = nil
		local ok, status = pcall(function() --[[ line: 90 ]]
			-- upvalues: url (copy), p2 (ref), httpRbxApiService (copy), httpService (copy)
			local var33 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p2.UserId) .. "/block-user", "")
			
			if var33 then
				return httpService:JSONDecode(var33)
			end
		end)
		local var31 = ok
		local var32 = status
		
		if var31 and var32 then
			if blockFireServerAfterHttp and var9 then
				var9:FireServer(userId, true)
			end
			bindableEvent_1:Fire(userId, true)
		elseif blockFireServerAfterHttp then
			t_1[userId] = nil
			bindableEvent:Fire(userId, false)
		end
		return var31 and var32
	end
end

local function UnblockPlayerAsync(p3) --[[ line: 124 ]]
	-- upvalues: t_1 (write), bindableEvent (ref), blockFireServerAfterHttp (ref), var9 (write), url (ref), httpRbxApiService (ref), httpService (ref), bindableEvent_1 (ref)
	if not p3 then
		return false
	end
	local userId = p3.UserId
	
	if not (if t_1[userId] then true else false) then
		return true
	end
	t_1[userId] = nil
	bindableEvent:Fire(userId, false)
	
	if not blockFireServerAfterHttp and var9 then
		var9:FireServer(userId, false)
	end
	local _ = nil
	local _ = nil
	local ok, status = pcall(function() --[[ line: 137 ]]
		-- upvalues: url (copy), p3 (ref), httpRbxApiService (copy), httpService (copy)
		local var36 = httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(p3.UserId) .. "/unblock-user", "")
		
		if var36 then
			var36 = httpService:JSONDecode(var36)
			
			return var36 and not var36.errors
		end
	end)
	local var34 = ok
	local var35 = status
	
	if var34 and var35 then
		if blockFireServerAfterHttp and var9 then
			var9:FireServer(userId, false)
		end
		bindableEvent_1:Fire(userId, false)
	elseif blockFireServerAfterHttp then
		t_1[userId] = true
		bindableEvent:Fire(userId, true)
	end
	return var34 and var35
end

local function AddPlayerToBlockList(p4) --[[ line: 174 ]]
	-- upvalues: playersService (ref), t_1 (write), bindableEvent (ref), var9 (write), bindableEvent_1 (ref)
	if p4 and playersService.LocalPlayer ~= p4 then
		local userId = p4.UserId
		
		if userId <= 0 then
			return false
		end
		if not (if t_1[userId] then true else false) then
			t_1[userId] = true
			bindableEvent:Fire(userId, true)
			
			if var9 then
				var9:FireServer(userId, true)
			end
			if bindableEvent_1 then
				bindableEvent_1:Fire(userId, true)
			end
		end
		return true
	end
end

local function RemovePlayerFromBlockList(p5) --[[ line: 202 ]]
	-- upvalues: t_1 (write), bindableEvent (ref), var9 (write), bindableEvent_1 (ref)
	if not p5 then
		return false
	end
	local userId = p5.UserId
	
	if if t_1[userId] then true else false then
		t_1[userId] = nil
		bindableEvent:Fire(userId, false)
		
		if var9 then
			var9:FireServer(userId, false)
		end
		if bindableEvent_1 then
			bindableEvent_1:Fire(userId, false)
		end
	end
	return true
end

local function MutePlayer(p6) --[[ line: 224 ]]
	-- upvalues: playersService (ref), t_2 (ref), bindableEvent_2 (ref)
	if p6 and playersService.LocalPlayer ~= p6 then
		local userId = p6.UserId
		
		if userId > 0 then
			local var37
			if t_2[userId] ~= nil then
				var37 = t_2[userId] ~= true
			end
			if not var37 then
				t_2[userId] = true
				bindableEvent_2:Fire(userId, true)
			end
		end
	end
end

local function UnmutePlayer(p7) --[[ line: 237 ]]
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
bindableEvent.Event:Connect(function(p8, p9) --[[ line: 252 | named "blockedStatusChanged" ]]
	-- upvalues: playersService (ref), bindableEvent_4 (ref), bindableEvent_5 (ref)
	local var38 = playersService:GetPlayerByUserId(p8)
	
	if var38 then
		if p9 then
			bindableEvent_4:Fire(var38)
			
			return
		end
		bindableEvent_5:Fire(var38)
	end
end)
bindableEvent_2.Event:Connect(function(p10, p11) --[[ line: 265 | named "muteStatusChanged" ]]
	-- upvalues: playersService (ref), bindableEvent_6 (ref), bindableEvent_7 (ref)
	local var39 = playersService:GetPlayerByUserId(p10)
	
	if var39 then
		if p11 then
			bindableEvent_6:Fire(var39)
			
			return
		end
		bindableEvent_7:Fire(var39)
	end
end)
starterGuiService:RegisterGetCore("PlayerBlockedEvent", function() --[[ line: 278 ]]
	-- upvalues: bindableEvent_4 (ref)
	return bindableEvent_4
end)
starterGuiService:RegisterGetCore("PlayerUnblockedEvent", function() --[[ line: 281 ]]
	-- upvalues: bindableEvent_5 (ref)
	return bindableEvent_5
end)
starterGuiService:RegisterGetCore("PlayerMutedEvent", function() --[[ line: 284 ]]
	-- upvalues: bindableEvent_6 (ref)
	return bindableEvent_6
end)
starterGuiService:RegisterGetCore("PlayerUnmutedEvent", function() --[[ line: 287 ]]
	-- upvalues: bindableEvent_7 (ref)
	return bindableEvent_7
end)
task.spawn(function() --[[ line: 291 ]]
	-- upvalues: blockingUtilityRefireOnReplace (ref), t_1 (write), var13 (write), bindableEvent (ref), bindableEvent_3 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(p12) --[[ line: 294 ]]
		-- upvalues: blockingUtilityRefireOnReplace (copy), t_1 (copy), var13 (copy), bindableEvent (copy), bindableEvent_3 (copy)
		local t = {}
		
		for i, v in p12 do
			t[tonumber(i)] = true
		end
		if blockingUtilityRefireOnReplace then
			local var41 = t_1
			t_1 = t
			var13 = true
			
			for i_1 in t do
				if not var41[i_1] then
					bindableEvent:Fire(i_1, true)
				end
			end
			for i_2 in var41 do
				if not t[i_2] then
					bindableEvent:Fire(i_2, false)
				end
			end
		else
			t_1 = t
			var13 = true
		end
		bindableEvent_3:Fire()
	end)
end)
task.spawn(function() --[[ line: 324 ]]
	-- upvalues: blockingUtilityClearUnblockedFromBlockedList (ref), t_1 (write), bindableEvent (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(p13, p14) --[[ line: 328 ]]
		-- upvalues: blockingUtilityClearUnblockedFromBlockedList (copy), t_1 (copy), bindableEvent (copy)
		if blockingUtilityClearUnblockedFromBlockedList then
			t_1[p13] = if p14 then true else nil
		else
			t_1[p13] = p14
		end
		bindableEvent:Fire(p13, p14)
	end)
end)

function t.BlockPlayerAsync(_, p15) --[[ line: 338 ]]
	-- upvalues: BlockPlayerAsync (ref)
	return BlockPlayerAsync(p15)
end

function t.UnblockPlayerAsync(_, p16) --[[ line: 342 ]]
	-- upvalues: UnblockPlayerAsync (ref)
	return UnblockPlayerAsync(p16)
end

function t.MutePlayer(_, p17) --[[ line: 346 ]]
	-- upvalues: MutePlayer (ref)
	return MutePlayer(p17)
end

function t.UnmutePlayer(_, p18) --[[ line: 350 ]]
	-- upvalues: UnmutePlayer (ref)
	return UnmutePlayer(p18)
end

function t.IsPlayerBlockedByUserId(_, p19) --[[ line: 354 ]]
	-- upvalues: t_1 (write)
	return t_1[p19]
end

function t.GetBlockedStatusChangedEvent(_) --[[ line: 358 ]]
	-- upvalues: bindableEvent (ref)
	return bindableEvent.Event
end

function t.GetAfterBlockedStatusChangedEvent(_) --[[ line: 364 ]]
	-- upvalues: bindableEvent_1 (ref)
	return bindableEvent_1.Event
end

function t.GetMutedStatusChangedEvent(_) --[[ line: 368 ]]
	-- upvalues: bindableEvent_2 (ref)
	return bindableEvent_2.Event
end

function t.IsPlayerMutedByUserId(_, p20) --[[ line: 372 ]]
	-- upvalues: t_2 (ref)
	return t_2[p20] == nil or t_2[p20] ~= true
end

function t.GetBlockedUserIdsAsync(_) --[[ line: 376 ]]
	-- upvalues: getBlockedUserIds (ref)
	return getBlockedUserIds()
end

function t.AddPlayerToBlockList(_, p21) --[[ line: 380 ]]
	-- upvalues: AddPlayerToBlockList (ref)
	return AddPlayerToBlockList(p21)
end

function t.RemovePlayerFromBlockList(_, p22) --[[ line: 384 ]]
	-- upvalues: RemovePlayerFromBlockList (ref)
	return RemovePlayerFromBlockList(p22)
end

return t
local t = {}
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = robloxGui:WaitForChild("Modules")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local _ = UserSettings().GameSettings
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local fFlagInExperienceUserProfileSettingsEnabledModule = require(robloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local fFlagBadgeVisibilitySettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local fFlagInExperienceRequestProfileSettingsModule = require(robloxGui.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings)
local verifiedBadgeDisplayStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.VerifiedBadgeDisplayStore
local fFlagEnableVerifiedBadgeStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.player = p1
	tbl.pendingGroupData = {}
	tbl.pendingCanManage = {}
	tbl.pendingProfileSettings = {}
	tbl.groupData = nil
	tbl.canManage = nil
	tbl.profileSettings = nil
	
	return tbl
end

function t_1:getGroupDataAsync()
	if self.groupData then
		return self.groupData
	end
	table.insert(self.pendingGroupData, coroutine.running())
	coroutine.yield()
	
	return self.groupData
end

function t_1:getCanManageAsync()
	if self.canManage == nil then
		table.insert(self.pendingCanManage, coroutine.running())
		coroutine.yield()
		
		return self.canManage
	end
	return self.canManage
end

function t_1:getProfileSettingsAsync()
	if self.profileSettings == nil then
		table.insert(self.pendingProfileSettings, coroutine.running())
		coroutine.yield()
		
		return self.profileSettings
	end
	return self.profileSettings
end

function t_1:setGroupData(p1)
	self.groupData = p1
	local pendingGroupData = self.pendingGroupData
	self.pendingGroupData = {}
	
	for i, v in pairs(pendingGroupData) do
		coroutine.resume(v)
	end
end

function t_1:setCanManage(p2)
	self.canManage = if p2 then true else false
	local pendingCanManage = self.pendingCanManage
	self.pendingCanManage = {}
	
	for i, v in pairs(pendingCanManage) do
		coroutine.resume(v)
	end
end

function t_1:setProfileSettings(p3)
	self.profileSettings = p3
	local pendingProfileSettings = self.pendingProfileSettings
	self.pendingProfileSettings = {}
	
	for i, v in pairs(pendingProfileSettings) do
		coroutine.resume(v)
	end
end

function t_1:destroy()
	-- upvalues: fFlagInExperienceUserProfileSettingsEnabledModule (ref)
	for i, v in pairs(self.pendingGroupData) do
		coroutine.resume(v)
	end
	for i, v_1 in pairs(self.pendingCanManage) do
		coroutine.resume(v_1)
	end
	if fFlagInExperienceUserProfileSettingsEnabledModule then
		for i, v_2 in pairs(self.pendingProfileSettings) do
			coroutine.resume(v_2)
		end
	end
end

local t_2 = {}

local function _(p4)
	-- upvalues: t_2 (ref), t_1 (ref)
	local var1 = t_2[p4]
	
	if not var1 and p4.Parent ~= nil then
		var1 = t_1.new(p4)
		t_2[p4] = var1
	end
	return var1
end

spawn(function()
	-- upvalues: playersService (ref), t_2 (ref), t_1 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", 1e999).OnClientEvent:Connect(function(...)
		-- upvalues: playersService (copy), t_2 (copy), t_1 (copy)
		local list = { ... }
		
		if #list == 1 then
			for i, v in pairs(list[1]) do
				local var1 = playersService:GetPlayerByUserId(tonumber(i))
				
				if var1 then
					local var2 = t_2[var1]
					
					if not var2 and var1.Parent ~= nil then
						var2 = t_1.new(var1)
						t_2[var1] = var2
					end
					local var3 = var2
					
					if var3 then
						var3:setGroupData(v)
					end
				end
			end
			return
		else
			local var4 = list[2]
			local var5 = playersService:GetPlayerByUserId(tonumber(list[1]))
			
			if var5 then
				local var6 = t_2[var5]
				
				if not var6 and var5.Parent ~= nil then
					var6 = t_1.new(var5)
					t_2[var5] = var6
				end
				local var7 = var6
				
				if var7 then
					var7:setGroupData(var4)
				end
			end
		end
	end)
end)
coroutine.wrap(function()
	-- upvalues: playersService (ref), t_2 (ref), t_1 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", 1e999).OnClientEvent:Connect(function(p4, p5)
		-- upvalues: playersService (copy), t_2 (copy), t_1 (copy)
		local var1 = playersService:GetPlayerByUserId(tonumber(p4))
		
		if var1 then
			local var2 = t_2[var1]
			
			if not var2 and var1.Parent ~= nil then
				var2 = t_1.new(var1)
				t_2[var1] = var2
			end
			local var3 = var2
			
			if var3 then
				var3:setCanManage(p5)
			end
		end
	end)
end)()

if fFlagInExperienceUserProfileSettingsEnabledModule then
	coroutine.wrap(function()
		-- upvalues: playersService (ref), t_2 (ref), t_1 (ref), fFlagEnableVerifiedBadgeStore (ref), verifiedBadgeDisplayStore (ref), fFlagInExperienceRequestProfileSettingsModule (ref)
		local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
		robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p4, p5)
			-- upvalues: playersService (copy), t_2 (copy), t_1 (copy), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy)
			local var1 = playersService:GetPlayerByUserId(tonumber(p4))
			
			if var1 then
				local var2 = t_2[var1]
				
				if not var2 and var1.Parent ~= nil then
					var2 = t_1.new(var1)
					t_2[var1] = var2
				end
				local var3 = var2
				
				if var3 then
					var3:setProfileSettings(p5)
				end
				if fFlagEnableVerifiedBadgeStore and p5.isInExperienceNameEnabled ~= nil then
					verifiedBadgeDisplayStore.get().setBadgeVisibility(var1.UserId, not p5.isInExperienceNameEnabled)
				end
			end
		end)
		
		if fFlagInExperienceRequestProfileSettingsModule then
			robloxReplicatedStorageService:WaitForChild("RequestPlayerProfileSettings", 1e999):FireServer()
		end
	end)()
end
playersService.PlayerRemoving:Connect(function(p4)
	-- upvalues: t_2 (ref)
	if t_2[p4] then
		local var1 = t_2[p4]
		t_2[p4] = nil
		var1:destroy()
	end
end)

local _ = function(p4)
	-- upvalues: t_2 (ref), t_1 (ref)
	return function(p5)
		-- upvalues: t_2 (copy), t_1 (copy), p4 (ref)
		local var1 = t_2[p5]
		
		if not var1 and p5.Parent ~= nil then
			var1 = t_1.new(p5)
			t_2[p5] = var1
		end
		if var1 then
			var1 = var1:getGroupDataAsync()
			
			return var1 and var1[p4]
		end
	end
end

local t_3 = {}
local var1 = "SpanishLocalizationExpert"

local var2 = function(p4)
	-- upvalues: t_2 (ref), t_1 (ref), var1 (ref)
	local var3 = t_2[p4]
	
	if not var3 and p4.Parent ~= nil then
		var3 = t_1.new(p4)
		t_2[p4] = var3
	end
	if var3 then
		var3 = var3:getGroupDataAsync()
		
		return var3 and var3[var1]
	end
end

local var3 = "BrazilianLocalizationExpert"

local var4 = function(p4)
	-- upvalues: t_2 (ref), t_1 (ref), var3 (ref)
	local var5 = t_2[p4]
	
	if not var5 and p4.Parent ~= nil then
		var5 = t_1.new(p4)
		t_2[p4] = var5
	end
	if var5 then
		var5 = var5:getGroupDataAsync()
		
		return var5 and var5[var3]
	end
end

local var5 = "FrenchLocalizationExpert"
local var6 = "GermanLocalizationExpert"
-- Unknown statement at pc 9: <SetList>

local _ = function()
	-- upvalues: t_3 (ref)
	return function(p4)
		-- upvalues: t_3 (copy)
		for i = 1, #t_3 do
			if not t_3[i](p4) then
				continue
			end
			return true
		end
		return false
	end
end

local _ = function()
	-- upvalues: t_2 (ref), t_1 (ref)
	if game.CreatorType == Enum.CreatorType.Group then
		local var7 = "PlaceCreator"
		
		return function(p4)
			-- upvalues: t_2 (copy), t_1 (copy), var7 (ref)
			local var8 = t_2[p4]
			
			if not var8 and p4.Parent ~= nil then
				var8 = t_1.new(p4)
				t_2[p4] = var8
			end
			if var8 then
				var8 = var8:getGroupDataAsync()
				
				return var8 and var8[var7]
			end
		end
	end
	return function(p4)
		return p4.UserId == game.CreatorId
	end
end

local function CanPlayerManagePlace(p4)
	-- upvalues: t_2 (ref), t_1 (ref)
	local var7 = t_2[p4]
	
	if not var7 and p4.Parent ~= nil then
		var7 = t_1.new(p4)
		t_2[p4] = var7
	end
	return if var7 then var7:getCanManageAsync() or false else false
end

local function IsPlayerInExperienceNameEnabled(p4)
	-- upvalues: t_2 (ref), t_1 (ref)
	local var7 = t_2[p4]
	
	if not var7 and p4.Parent ~= nil then
		var7 = t_1.new(p4)
		t_2[p4] = var7
	end
	if var7 then
		var7 = var7:getProfileSettingsAsync()
		
		return if var7 then var7.isInExperienceNameEnabled else false
	end
end

local function SetPlayerInExperienceNameEnabled(_, p4)
	-- upvalues: url (ref), httpService (ref), httpRbxApiService (ref)
	pcall(function()
		-- upvalues: url (copy), httpService (copy), p4 (ref), httpRbxApiService (copy)
		local updatePlayerProfileSettings = game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdatePlayerProfileSettings", 1e999)
		httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-profile-api/v1/user/profiles/settings", httpService:JSONEncode({
			userProfileSettings = { isInExperienceNameEnabled = p4 }
		}), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)
		updatePlayerProfileSettings:FireServer({ isInExperienceNameEnabled = p4 })
	end)
end

local var7 = "Admin"

function t.IsPlayerAdminAsync(p4)
	-- upvalues: t_2 (ref), t_1 (ref), var7 (ref)
	local var8 = t_2[p4]
	
	if not var8 and p4.Parent ~= nil then
		var8 = t_1.new(p4)
		t_2[p4] = var8
	end
	if var8 then
		var8 = var8:getGroupDataAsync()
		
		return var8 and var8[var7]
	end
end

local var8 = "Intern"

function t.IsPlayerInternAsync(p4)
	-- upvalues: t_2 (ref), t_1 (ref), var8 (ref)
	local var9 = t_2[p4]
	
	if not var9 and p4.Parent ~= nil then
		var9 = t_1.new(p4)
		t_2[p4] = var9
	end
	if var9 then
		var9 = var9:getGroupDataAsync()
		
		return var9 and var9[var8]
	end
end

local var9 = "Star"

function t.IsPlayerStarAsync(p4)
	-- upvalues: t_2 (ref), t_1 (ref), var9 (ref)
	local var10 = t_2[p4]
	
	if not var10 and p4.Parent ~= nil then
		var10 = t_1.new(p4)
		t_2[p4] = var10
	end
	if var10 then
		var10 = var10:getGroupDataAsync()
		
		return var10 and var10[var9]
	end
end

function t.IsPlayerLocalizationExpertAsync(p4)
	-- upvalues: t_3 (ref)
	for i = 1, #t_3 do
		if not t_3[i](p4) then
			continue
			continue
		end
		return true
	end
	return false
end

if game.CreatorType == Enum.CreatorType.Group then
	local var10 = "PlaceCreator"
	
	local var11 = function(p5)
		-- upvalues: t_2 (ref), t_1 (ref), var10 (ref)
		local var12 = t_2[p5]
		
		if not var12 and p5.Parent ~= nil then
			var12 = t_1.new(p5)
			t_2[p5] = var12
		end
		if var12 then
			var12 = var12:getGroupDataAsync()
			
			return var12 and var12[var10]
		end
	end
else
	local var11 = function(p5)
		return p5.UserId == game.CreatorId
	end
end
t.IsPlayerPlaceOwnerAsync = var11
t.CanPlayerManagePlaceAsync = CanPlayerManagePlace

if fFlagInExperienceUserProfileSettingsEnabledModule then
	t.IsPlayerInExperienceNameEnabledAsync = IsPlayerInExperienceNameEnabled
end
if fFlagBadgeVisibilitySettingEnabled then
	t.SetPlayerInExperienceNameEnabled = SetPlayerInExperienceNameEnabled
end
return t
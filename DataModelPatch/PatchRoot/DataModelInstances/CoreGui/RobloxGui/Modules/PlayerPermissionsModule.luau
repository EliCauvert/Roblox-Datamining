local t = {}
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = RobloxGui:WaitForChild("Modules")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local _ = UserSettings().GameSettings
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local FFlagInExperienceUserProfileSettingsEnabledModule = require(RobloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local FFlagBadgeVisibilitySettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local FFlagInExperienceRequestProfileSettingsModule = require(RobloxGui.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings)
local VerifiedBadgeDisplayStore = require(CorePackages.Workspace.Packages.UserProfiles).Stores.VerifiedBadgeDisplayStore
local FFlagEnableVerifiedBadgeStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local Module = {}
Module.__index = Module

function Module.new(Player)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.player = Player
	self.pendingGroupData = {}
	self.pendingCanManage = {}
	self.pendingProfileSettings = {}
	self.groupData = nil
	self.canManage = nil
	self.profileSettings = nil
	
	return self
end

function Module:getGroupDataAsync()
	if self.groupData then
		return self.groupData
	else
		table.insert(self.pendingGroupData, (coroutine.running()))
		coroutine.yield()
		
		return self.groupData
	end
end

function Module:getCanManageAsync()
	if self.canManage == nil then
		table.insert(self.pendingCanManage, (coroutine.running()))
		coroutine.yield()
		
		return self.canManage
	else
		return self.canManage
	end
end

function Module:getProfileSettingsAsync()
	if self.profileSettings == nil then
		table.insert(self.pendingProfileSettings, (coroutine.running()))
		coroutine.yield()
		
		return self.profileSettings
	else
		return self.profileSettings
	end
end

function Module:setGroupData(GroupData)
	self.groupData = GroupData
	local PendingGroupData = self.pendingGroupData
	self.pendingGroupData = {}
	
	for _, value in pairs(PendingGroupData) do
		coroutine.resume(value)
	end
end

function Module:setCanManage(p1)
	self.canManage = if p1 then true else false
	local PendingCanManage = self.pendingCanManage
	self.pendingCanManage = {}
	
	for _, value in pairs(PendingCanManage) do
		coroutine.resume(value)
	end
end

function Module:setProfileSettings(ProfileSettings)
	self.profileSettings = ProfileSettings
	local PendingProfileSettings = self.pendingProfileSettings
	self.pendingProfileSettings = {}
	
	for _, pendingProfileSetting in pairs(PendingProfileSettings) do
		coroutine.resume(pendingProfileSetting)
	end
end

function Module.destroy(p2)
	-- upvalues: FFlagInExperienceUserProfileSettingsEnabledModule (copy)
	for _, value in pairs(p2.pendingGroupData) do
		coroutine.resume(value)
	end
	for _, value1 in pairs(p2.pendingCanManage) do
		coroutine.resume(value1)
	end
	if FFlagInExperienceUserProfileSettingsEnabledModule then
		for _, pendingProfileSetting in pairs(p2.pendingProfileSettings) do
			coroutine.resume(pendingProfileSetting)
		end
	end
end

local NewResults = {}

local function _(Player)
	-- upvalues: NewResults (copy), Module (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	return NewResult
end

spawn(function()
	-- upvalues: Players (copy), NewResults (copy), Module (copy)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", 1e999).OnClientEvent:Connect(function(...)
		-- upvalues: Players (upval), NewResults (upval), Module (upval)
		local list = { ... }
		
		if #list == 1 then
			for i, value in pairs(list[1]) do
				local Player1 = Players:GetPlayerByUserId((tonumber(i)))
				
				if Player1 then
					local NewResult = NewResults[Player1]
					
					if not NewResult and Player1.Parent ~= nil then
						NewResult = Module.new(Player1)
						NewResults[Player1] = NewResult
					end
					local NewResult1 = NewResult
					
					if NewResult1 then
						NewResult1:setGroupData(value)
					end
				end
			end
			return
		else
			local Entry = list[2]
			local Player = Players:GetPlayerByUserId((tonumber(list[1])))
			
			if Player then
				local NewResult = NewResults[Player]
				
				if not NewResult and Player.Parent ~= nil then
					NewResult = Module.new(Player)
					NewResults[Player] = NewResult
				end
				local NewResult2 = NewResult
				
				if NewResult2 then
					NewResult2:setGroupData(Entry)
				end
			end
		end
	end)
end)
coroutine.wrap(function()
	-- upvalues: Players (copy), NewResults (copy), Module (copy)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", 1e999).OnClientEvent:Connect(function(p3, p4)
		-- upvalues: Players (upval), NewResults (upval), Module (upval)
		local Player = Players:GetPlayerByUserId((tonumber(p3)))
		
		if Player then
			local NewResult = NewResults[Player]
			
			if not NewResult and Player.Parent ~= nil then
				NewResult = Module.new(Player)
				NewResults[Player] = NewResult
			end
			local NewResult1 = NewResult
			
			if NewResult1 then
				NewResult1:setCanManage(p4)
			end
		end
	end)
end)()

if FFlagInExperienceUserProfileSettingsEnabledModule then
	coroutine.wrap(function()
		-- upvalues: Players (copy), NewResults (copy), Module (copy), FFlagEnableVerifiedBadgeStore (copy), VerifiedBadgeDisplayStore (copy), FFlagInExperienceRequestProfileSettingsModule (copy)
		local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
		RobloxReplicatedStorage:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p3, ProfileSettings)
			-- upvalues: Players (upval), NewResults (upval), Module (upval), FFlagEnableVerifiedBadgeStore (upval), VerifiedBadgeDisplayStore (upval)
			local Player = Players:GetPlayerByUserId((tonumber(p3)))
			
			if Player then
				local NewResult = NewResults[Player]
				
				if not NewResult and Player.Parent ~= nil then
					NewResult = Module.new(Player)
					NewResults[Player] = NewResult
				end
				local NewResult1 = NewResult
				
				if NewResult1 then
					NewResult1:setProfileSettings(ProfileSettings)
				end
				if FFlagEnableVerifiedBadgeStore and ProfileSettings.isInExperienceNameEnabled ~= nil then
					VerifiedBadgeDisplayStore.get().setBadgeVisibility(Player.UserId, not ProfileSettings.isInExperienceNameEnabled)
				end
			end
		end)
		
		if FFlagInExperienceRequestProfileSettingsModule then
			RobloxReplicatedStorage:WaitForChild("RequestPlayerProfileSettings", 1e999):FireServer()
		end
	end)()
end
Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: NewResults (copy)
	if NewResults[Player] then
		NewResults[Player] = nil
		NewResults[Player]:destroy()
	end
end)

local _ = function(p3)
	-- upvalues: NewResults (copy), Module (copy)
	return function(Player): boolean
		-- upvalues: NewResults (upval), Module (upval), p3 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[p3] then
				return true
			end
		end
		return false
	end
end

local v1 = "SpanishLocalizationExpert"
local v2 = "BrazilianLocalizationExpert"
local v3 = "FrenchLocalizationExpert"
local v4 = "GermanLocalizationExpert"
local list = {
	function(Player): boolean
		-- upvalues: NewResults (copy), Module (copy), v1 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[v1] then
				return true
			end
		end
		return false
	end,
	function(Player): boolean
		-- upvalues: NewResults (copy), Module (copy), v2 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[v2] then
				return true
			end
		end
		return false
	end,
	function(Player): boolean
		-- upvalues: NewResults (copy), Module (copy), v3 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[v3] then
				return true
			end
		end
		return false
	end,
	function(Player): boolean
		-- upvalues: NewResults (copy), Module (copy), v4 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[v4] then
				return true
			end
		end
		return false
	end
}

local _ = function()
	-- upvalues: list (copy)
	return function(p3): boolean
		-- upvalues: list (upval)
		for i = 1, #list do
			if list[i](p3) then
				return true
			end
		end
		return false
	end
end

local _ = function()
	-- upvalues: NewResults (copy), Module (copy)
	if game.CreatorType == Enum.CreatorType.Group then
		local v5 = "PlaceCreator"
		
		return function(Player): boolean
			-- upvalues: NewResults (upval), Module (upval), v5 (copy)
			local NewResult = NewResults[Player]
			
			if not NewResult and Player.Parent ~= nil then
				NewResult = Module.new(Player)
				NewResults[Player] = NewResult
			end
			local NewResult1 = NewResult
			
			if NewResult1 then
				local GroupDataAsync = NewResult1:getGroupDataAsync()
				
				if GroupDataAsync and GroupDataAsync[v5] then
					return true
				end
			end
			return false
		end
	else
		return function(Player): boolean
			return Player.UserId == game.CreatorId
		end
	end
end

local function CanPlayerManagePlace(Player)
	-- upvalues: NewResults (copy), Module (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	return NewResult and NewResult:getCanManageAsync() or false
end

local function IsPlayerInExperienceNameEnabled(Player)
	-- upvalues: NewResults (copy), Module (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	local NewResult1 = NewResult
	
	if NewResult1 then
		local ProfileSettingsAsync = NewResult1:getProfileSettingsAsync()
		
		if ProfileSettingsAsync then
			return ProfileSettingsAsync.isInExperienceNameEnabled
		end
	end
	return false
end

local function SetPlayerInExperienceNameEnabled(_, IsInExperienceNameEnabled)
	-- upvalues: Url (copy), HttpService (copy), HttpRbxApiService (copy)
	pcall(function()
		-- upvalues: Url (upval), HttpService (upval), IsInExperienceNameEnabled (copy), HttpRbxApiService (upval)
		local UpdatePlayerProfileSettings = game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdatePlayerProfileSettings", 1e999)
		HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "user-profile-api/v1/user/profiles/settings", HttpService:JSONEncode({
			userProfileSettings = { isInExperienceNameEnabled = IsInExperienceNameEnabled }
		}), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)
		UpdatePlayerProfileSettings:FireServer({ isInExperienceNameEnabled = IsInExperienceNameEnabled })
	end)
end

local v5 = "Admin"

function t.IsPlayerAdminAsync(Player): boolean
	-- upvalues: NewResults (copy), Module (copy), v5 (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	local NewResult1 = NewResult
	
	if NewResult1 then
		local GroupDataAsync = NewResult1:getGroupDataAsync()
		
		if GroupDataAsync and GroupDataAsync[v5] then
			return true
		end
	end
	return false
end

local v6 = "Intern"

function t.IsPlayerInternAsync(Player): boolean
	-- upvalues: NewResults (copy), Module (copy), v6 (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	local NewResult1 = NewResult
	
	if NewResult1 then
		local GroupDataAsync = NewResult1:getGroupDataAsync()
		
		if GroupDataAsync and GroupDataAsync[v6] then
			return true
		end
	end
	return false
end

local v7 = "Star"

function t.IsPlayerStarAsync(Player): boolean
	-- upvalues: NewResults (copy), Module (copy), v7 (copy)
	local NewResult = NewResults[Player]
	
	if not NewResult and Player.Parent ~= nil then
		NewResult = Module.new(Player)
		NewResults[Player] = NewResult
	end
	local NewResult1 = NewResult
	
	if NewResult1 then
		local GroupDataAsync = NewResult1:getGroupDataAsync()
		
		if GroupDataAsync and GroupDataAsync[v7] then
			return true
		end
	end
	return false
end

function t.IsPlayerLocalizationExpertAsync(p3): boolean
	-- upvalues: list (copy)
	for i = 1, #list do
		if list[i](p3) then
			return true
		end
	end
	return false
end

if game.CreatorType == Enum.CreatorType.Group then
	local v8 = "PlaceCreator"
	
	local function IsPlayerPlaceOwnerAsync(Player): boolean
		-- upvalues: NewResults (copy), Module (copy), v8 (copy)
		local NewResult = NewResults[Player]
		
		if not NewResult and Player.Parent ~= nil then
			NewResult = Module.new(Player)
			NewResults[Player] = NewResult
		end
		local NewResult1 = NewResult
		
		if NewResult1 then
			local GroupDataAsync = NewResult1:getGroupDataAsync()
			
			if GroupDataAsync and GroupDataAsync[v8] then
				return true
			end
		end
		return false
	end
else
	local function IsPlayerPlaceOwnerAsync(Player): boolean
		return Player.UserId == game.CreatorId
	end
end
t.IsPlayerPlaceOwnerAsync = IsPlayerPlaceOwnerAsync
t.CanPlayerManagePlaceAsync = CanPlayerManagePlace

if FFlagInExperienceUserProfileSettingsEnabledModule then
	t.IsPlayerInExperienceNameEnabledAsync = IsPlayerInExperienceNameEnabled
end
if FFlagBadgeVisibilitySettingEnabled then
	t.SetPlayerInExperienceNameEnabled = SetPlayerInExperienceNameEnabled
end
return t
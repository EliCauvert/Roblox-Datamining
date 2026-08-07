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

function t_1.new(p0) --[[ line: 27 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.player = p0
	tbl.pendingGroupData = {}
	tbl.pendingCanManage = {}
	tbl.pendingProfileSettings = {}
	tbl.groupData = nil
	tbl.canManage = nil
	tbl.profileSettings = nil
	
	return tbl
end

function t_1:getGroupDataAsync() --[[ line: 39 ]]
	if self.groupData then
		return self.groupData
	end
	table.insert(self.pendingGroupData, coroutine.running())
	coroutine.yield()
	
	return self.groupData
end

function t_1:getCanManageAsync() --[[ line: 50 ]]
	if self.canManage == nil then
		table.insert(self.pendingCanManage, coroutine.running())
		coroutine.yield()
		
		return self.canManage
	end
	return self.canManage
end

function t_1:getProfileSettingsAsync() --[[ line: 61 ]]
	if self.profileSettings == nil then
		table.insert(self.pendingProfileSettings, coroutine.running())
		coroutine.yield()
		
		return self.profileSettings
	end
	return self.profileSettings
end

function t_1:setGroupData(p1) --[[ line: 72 ]]
	self.groupData = p1
	local pendingGroupData = self.pendingGroupData
	self.pendingGroupData = {}
	
	for i, v in pairs(pendingGroupData) do
		coroutine.resume(v)
	end
end

function t_1:setCanManage(p2) --[[ line: 81 ]]
	self.canManage = if p2 then true else false
	local pendingCanManage = self.pendingCanManage
	self.pendingCanManage = {}
	
	for i, v in pairs(pendingCanManage) do
		coroutine.resume(v)
	end
end

function t_1:setProfileSettings(p3) --[[ line: 91 ]]
	self.profileSettings = p3
	local pendingProfileSettings = self.pendingProfileSettings
	self.pendingProfileSettings = {}
	
	for i, v in pairs(pendingProfileSettings) do
		coroutine.resume(v)
	end
end

function t_1:destroy() --[[ line: 100 ]]
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

local function _(p4) --[[ line: 118 | named "getPlayerInfo" ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	local var26 = t_2[p4]
	
	if not var26 and p4.Parent ~= nil then
		var26 = t_1.new(p4)
		t_2[p4] = var26
	end
	return var26
end

spawn(function() --[[ line: 127 ]]
	-- upvalues: playersService (ref), t_2 (ref), t_1 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", 1e999).OnClientEvent:Connect(function(...) --[[ line: 131 ]]
		-- upvalues: playersService (copy), t_2 (copy), t_1 (copy)
		local list = { ... }
		
		if #list == 1 then
			for i, v in pairs(list[1]) do
				local var28 = playersService:GetPlayerByUserId(tonumber(i))
				
				if var28 then
					local var29 = t_2[var28]
					
					if not var29 and var28.Parent ~= nil then
						var29 = t_1.new(var28)
						t_2[var28] = var29
					end
					local var30 = var29
					
					if var30 then
						var30:setGroupData(v)
					end
				end
			end
			return
		else
			local var31 = list[2]
			local var32 = playersService:GetPlayerByUserId(tonumber(list[1]))
			
			if var32 then
				local var33 = t_2[var32]
				
				if not var33 and var32.Parent ~= nil then
					var33 = t_1.new(var32)
					t_2[var32] = var33
				end
				local var34 = var33
				
				if var34 then
					var34:setGroupData(var31)
				end
			end
		end
	end)
end)
coroutine.wrap(function() --[[ line: 162 ]]
	-- upvalues: playersService (ref), t_2 (ref), t_1 (ref)
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", 1e999).OnClientEvent:Connect(function(p5, p6) --[[ line: 168 ]]
		-- upvalues: playersService (copy), t_2 (copy), t_1 (copy)
		local var35 = playersService:GetPlayerByUserId(tonumber(p5))
		
		if var35 then
			local var36 = t_2[var35]
			
			if not var36 and var35.Parent ~= nil then
				var36 = t_1.new(var35)
				t_2[var35] = var36
			end
			local var37 = var36
			
			if var37 then
				var37:setCanManage(p6)
			end
		end
	end)
end)()

if fFlagInExperienceUserProfileSettingsEnabledModule then
	coroutine.wrap(function() --[[ line: 180 ]]
		-- upvalues: playersService (ref), t_2 (ref), t_1 (ref), fFlagEnableVerifiedBadgeStore (ref), verifiedBadgeDisplayStore (ref), fFlagInExperienceRequestProfileSettingsModule (ref)
		local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
		robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p7, p8) --[[ line: 186 ]]
			-- upvalues: playersService (copy), t_2 (copy), t_1 (copy), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy)
			local var39 = playersService:GetPlayerByUserId(tonumber(p7))
			
			if var39 then
				local var40 = t_2[var39]
				
				if not var40 and var39.Parent ~= nil then
					var40 = t_1.new(var39)
					t_2[var39] = var40
				end
				local var41 = var40
				
				if var41 then
					var41:setProfileSettings(p8)
				end
				if fFlagEnableVerifiedBadgeStore and p8.isInExperienceNameEnabled ~= nil then
					verifiedBadgeDisplayStore.get().setBadgeVisibility(var39.UserId, not p8.isInExperienceNameEnabled)
				end
			end
		end)
		
		if fFlagInExperienceRequestProfileSettingsModule then
			robloxReplicatedStorageService:WaitForChild("RequestPlayerProfileSettings", 1e999):FireServer()
		end
	end)()
end
playersService.PlayerRemoving:Connect(function(p9) --[[ line: 212 ]]
	-- upvalues: t_2 (ref)
	if t_2[p9] then
		local var42 = t_2[p9]
		t_2[p9] = nil
		var42:destroy()
	end
end)

local _ = function(p10) --[[ line: 220 | named "NewInGroupFunctionFactory" ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	return function(p11) --[[ line: 221 ]]
		-- upvalues: t_2 (copy), t_1 (copy), p10 (ref)
		local var43 = t_2[p11]
		
		if not var43 and p11.Parent ~= nil then
			var43 = t_1.new(p11)
			t_2[p11] = var43
		end
		if var43 then
			var43 = var43:getGroupDataAsync()
			
			return var43 and var43[p10]
		end
	end
end

local t_3 = {}
local var11 = "SpanishLocalizationExpert"

local var12 = function(p12) --[[ line: 221 ]]
	-- upvalues: t_2 (ref), t_1 (ref), var11 (ref)
	local var43 = t_2[p12]
	
	if not var43 and p12.Parent ~= nil then
		var43 = t_1.new(p12)
		t_2[p12] = var43
	end
	if var43 then
		var43 = var43:getGroupDataAsync()
		
		return var43 and var43[var11]
	end
end

local var13 = "BrazilianLocalizationExpert"

local var14 = function(p13) --[[ line: 221 ]]
	-- upvalues: t_2 (ref), t_1 (ref), var13 (ref)
	local var43 = t_2[p13]
	
	if not var43 and p13.Parent ~= nil then
		var43 = t_1.new(p13)
		t_2[p13] = var43
	end
	if var43 then
		var43 = var43:getGroupDataAsync()
		
		return var43 and var43[var13]
	end
end

local var15 = "FrenchLocalizationExpert"
local var16 = "GermanLocalizationExpert"
-- Unknown statement at pc 9: <SetList>

local _ = function() --[[ line: 240 | named "NewIsLocalizationExpertFunctionFactory" ]]
	-- upvalues: t_3 (ref)
	return function(p14) --[[ line: 241 ]]
		-- upvalues: t_3 (copy)
		for i = 1, #t_3 do
			if not t_3[i](p14) then
				continue
			end
			return true
		end
		return false
	end
end

local _ = function() --[[ line: 251 | named "IsPlaceOwnerFunctionFactory" ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	if game.CreatorType == Enum.CreatorType.Group then
		local var44 = "PlaceCreator"
		
		return function(p15) --[[ line: 221 ]]
			-- upvalues: t_2 (copy), t_1 (copy), var44 (ref)
			local var43 = t_2[p15]
			
			if not var43 and p15.Parent ~= nil then
				var43 = t_1.new(p15)
				t_2[p15] = var43
			end
			if var43 then
				var43 = var43:getGroupDataAsync()
				
				return var43 and var43[var44]
			end
		end
	end
	return function(p16) --[[ line: 255 ]]
		return p16.UserId == game.CreatorId
	end
end

local function CanPlayerManagePlace(p17) --[[ line: 260 ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	local var45 = t_2[p17]
	
	if not var45 and p17.Parent ~= nil then
		var45 = t_1.new(p17)
		t_2[p17] = var45
	end
	return if var45 then var45:getCanManageAsync() or false else false
end

local function IsPlayerInExperienceNameEnabled(p18) --[[ line: 269 ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	local var46 = t_2[p18]
	
	if not var46 and p18.Parent ~= nil then
		var46 = t_1.new(p18)
		t_2[p18] = var46
	end
	if var46 then
		var46 = var46:getProfileSettingsAsync()
		
		return if var46 then var46.isInExperienceNameEnabled else false
	end
end

local function SetPlayerInExperienceNameEnabled(_, p19) --[[ line: 280 ]]
	-- upvalues: url (ref), httpService (ref), httpRbxApiService (ref)
	pcall(function() --[[ line: 281 ]]
		-- upvalues: url (copy), httpService (copy), p19 (ref), httpRbxApiService (copy)
		local updatePlayerProfileSettings = game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdatePlayerProfileSettings", 1e999)
		httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "user-profile-api/v1/user/profiles/settings", httpService:JSONEncode({
			userProfileSettings = { isInExperienceNameEnabled = p19 }
		}), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)
		updatePlayerProfileSettings:FireServer({ isInExperienceNameEnabled = p19 })
	end)
end

local var20 = "Admin"

function t.IsPlayerAdminAsync(p20) --[[ line: 221 ]]
	-- upvalues: t_2 (ref), t_1 (ref), var20 (ref)
	local var43 = t_2[p20]
	
	if not var43 and p20.Parent ~= nil then
		var43 = t_1.new(p20)
		t_2[p20] = var43
	end
	if var43 then
		var43 = var43:getGroupDataAsync()
		
		return var43 and var43[var20]
	end
end

local var21 = "Intern"

function t.IsPlayerInternAsync(p21) --[[ line: 221 ]]
	-- upvalues: t_2 (ref), t_1 (ref), var21 (ref)
	local var43 = t_2[p21]
	
	if not var43 and p21.Parent ~= nil then
		var43 = t_1.new(p21)
		t_2[p21] = var43
	end
	if var43 then
		var43 = var43:getGroupDataAsync()
		
		return var43 and var43[var21]
	end
end

local var22 = "Star"

function t.IsPlayerStarAsync(p22) --[[ line: 221 ]]
	-- upvalues: t_2 (ref), t_1 (ref), var22 (ref)
	local var43 = t_2[p22]
	
	if not var43 and p22.Parent ~= nil then
		var43 = t_1.new(p22)
		t_2[p22] = var43
	end
	if var43 then
		var43 = var43:getGroupDataAsync()
		
		return var43 and var43[var22]
	end
end

function t.IsPlayerLocalizationExpertAsync(p23) --[[ line: 241 ]]
	-- upvalues: t_3 (ref)
	for i = 1, #t_3 do
		if not t_3[i](p23) then
			continue
			continue
		end
		return true
	end
	return false
end

if game.CreatorType == Enum.CreatorType.Group then
	local var23 = "PlaceCreator"
	
	local var24 = function(p24) --[[ line: 221 ]]
		-- upvalues: t_2 (ref), t_1 (ref), var23 (ref)
		local var43 = t_2[p24]
		
		if not var43 and p24.Parent ~= nil then
			var43 = t_1.new(p24)
			t_2[p24] = var43
		end
		if var43 then
			var43 = var43:getGroupDataAsync()
			
			return var43 and var43[var23]
		end
	end
else
	local var24 = function(p25) --[[ line: 255 ]]
		return p25.UserId == game.CreatorId
	end
end
t.IsPlayerPlaceOwnerAsync = var24
t.CanPlayerManagePlaceAsync = CanPlayerManagePlace

if fFlagInExperienceUserProfileSettingsEnabledModule then
	t.IsPlayerInExperienceNameEnabledAsync = IsPlayerInExperienceNameEnabled
end
if fFlagBadgeVisibilitySettingEnabled then
	t.SetPlayerInExperienceNameEnabled = SetPlayerInExperienceNameEnabled
end
return t
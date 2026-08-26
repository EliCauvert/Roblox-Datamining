local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local parent = authCommon.Parent
local authLocalStorageKeysModule = require(authCommon.Enums.AuthLocalStorageKeys)
local logger = require(parent.Loggers).Logger
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local hasRobloxSubscriptionStorageKeyEngineFeature = game:GetEngineFeature("HasRobloxSubscriptionStorageKey")
local t = {}
t.__index = t

function t.new(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: t (ref)
	local t_1 = {
		userId = p1,
		username = p2,
		displayName = p6 or nil,
		membershipType = p3,
		isUnder13 = p4,
		countryCode = p5,
		hasRobloxSubscription = p7
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:fromRequest()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), t (ref)
	local var1
	if fFlagEnableBlackbirdCheck then
		var1 = self.responseBody.HasRobloxSubscription == true
		var1 = nil
	else
		var1 = nil
	end
	return t.new(self.responseBody.UserId, self.responseBody.Username, tonumber(self.responseBody.MembershipType), self.responseBody.AgeBracket == 1, self.responseBody.CountryCode, self.responseBody.DisplayName or nil, var1)
end

function t:fromUserInfoRequest()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), t (ref)
	local var1
	local var2 = if self.responseBody.isPremium then 4 else 0
	
	if fFlagEnableBlackbirdCheck then
		var1 = self.responseBody.hasRobloxSubscription == true
		var1 = nil
	else
		var1 = nil
	end
	return t.new(self.responseBody.id, self.responseBody.name, var2, self.responseBody.ageBracket == 1, self.responseBody.countryCode, self.responseBody.displayName or nil, var1)
end

function t.fromLocalStorage()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), appStorageService (ref), authLocalStorageKeysModule (ref), logger (ref), t (ref)
	local var1 = nil
	
	if fFlagEnableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy)
			return appStorageService:GetItem(authLocalStorageKeysModule.HasRobloxSubscription)
		end)
		
		if ok then
			var1 = if status ~= "true" then false else true
		else
			logger:warning("Failed to read HasRobloxSubscription from local storage: {}", tostring(status))
		end
	end
	return t.new(tonumber(appStorageService:GetItem(authLocalStorageKeysModule.UserId)) or -1, appStorageService:GetItem(authLocalStorageKeysModule.Username), tonumber(appStorageService:GetItem(authLocalStorageKeysModule.Membership)) or 0, appStorageService:GetItem(authLocalStorageKeysModule.IsUnder13) ~= "true", appStorageService:GetItem(authLocalStorageKeysModule.CountryCode) or nil, appStorageService:GetItem(authLocalStorageKeysModule.DisplayName) or nil, var1)
end

function t.clearLocalStorage()
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), fFlagEnableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), logger (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.UserId, "-1")
	appStorageService:SetItem(authLocalStorageKeysModule.Username, "")
	appStorageService:SetItem(authLocalStorageKeysModule.Membership, "")
	appStorageService:SetItem(authLocalStorageKeysModule.IsUnder13, "")
	appStorageService:SetItem(authLocalStorageKeysModule.DisplayName, "")
	appStorageService:SetItem(authLocalStorageKeysModule.CountryCode, "")
	
	if fFlagEnableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy)
			appStorageService:SetItem(authLocalStorageKeysModule.HasRobloxSubscription, "")
		end)
		
		if not ok then
			logger:warning("Failed to clear HasRobloxSubscription from local storage: {}", tostring(status))
		end
	end
	appStorageService:Flush()
end

function t:setToLocalPlayer()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), playersService (ref)
	if fFlagEnableBlackbirdCheck and self.hasRobloxSubscription ~= nil then
		playersService:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13, self.hasRobloxSubscription)
		
		return
	end
	playersService:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13)
end

function t:setToLocalStorage()
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), fFlagEnableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), logger (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.UserId, tostring(self.userId))
	appStorageService:SetItem(authLocalStorageKeysModule.Username, self.username)
	appStorageService:SetItem(authLocalStorageKeysModule.Membership, tostring(self.membershipType))
	appStorageService:SetItem(authLocalStorageKeysModule.IsUnder13, tostring(self.isUnder13))
	appStorageService:SetItem(authLocalStorageKeysModule.DisplayName, tostring(self.displayName))
	appStorageService:SetItem(authLocalStorageKeysModule.CountryCode, tostring(self.countryCode))
	
	if fFlagEnableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy), self (ref)
			appStorageService:SetItem(authLocalStorageKeysModule.HasRobloxSubscription, tostring(self.hasRobloxSubscription == true))
		end)
		
		if not ok then
			logger:warning("Failed to save HasRobloxSubscription to local storage: {}", tostring(status))
		end
	end
	appStorageService:Flush()
end

function t:isSame(p1)
	return self.userId == p1.userId
end

function t:isEqual(p1)
	-- upvalues: fFlagEnableBlackbirdCheck (ref)
	local var1 = false
	
	if self.userId == p1.userId then
		var1 = false
		
		if self.username == p1.username then
			var1 = false
			
			if self.membershipType == p1.membershipType then
				var1 = false
				
				if self.isUnder13 == p1.isUnder13 then
					var1 = false
					
					if self.displayName == p1.displayName then
						var1 = false
						
						if self.countryCode == p1.countryCode then
							if fFlagEnableBlackbirdCheck then
								return self.hasRobloxSubscription == p1.hasRobloxSubscription
							end
							var1 = true
						end
					end
				end
			end
		end
	end
	return var1
end

function t:toString()
	-- upvalues: fFlagEnableBlackbirdCheck (ref)
	local formattedText = string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(self.userId), self.username, tostring(self.membershipType), tostring(self.isUnder13), tostring(self.countryCode))
	
	if fFlagEnableBlackbirdCheck then
		formattedText ..= string.format(", hasRobloxSubscription:%s", tostring(self.hasRobloxSubscription))
	end
	return formattedText
end

function t:toJsonData()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), httpService (ref)
	local t = {
		userId = self.userId,
		username = self.username,
		displayName = self.displayName or nil,
		membershipType = self.membershipType,
		isUnder13 = self.isUnder13,
		countryCode = self.countryCode
	}
	
	if fFlagEnableBlackbirdCheck then
		t.hasRobloxSubscription = self.hasRobloxSubscription
	end
	return httpService:JSONEncode(t)
end

return t
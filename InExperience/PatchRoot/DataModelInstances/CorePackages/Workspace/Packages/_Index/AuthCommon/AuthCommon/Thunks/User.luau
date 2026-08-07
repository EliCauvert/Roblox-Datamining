local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local authLocalStorageKeysModule = require(authCommon.Enums.AuthLocalStorageKeys)
local logger = require(authCommon.Parent.Loggers).Logger
local enableBlackbirdCheck = game:DefineFastFlag("EnableBlackbirdCheck", false)
local hasRobloxSubscriptionStorageKeyEngineFeature = game:GetEngineFeature("HasRobloxSubscriptionStorageKey")
local t = {}
t.__index = t

function t.new(p0, p1, p2, p3, p4, p5, p6) --[[ line: 39 ]]
	-- upvalues: t (ref)
	local t_1 = {
		userId = p0,
		username = p1,
		displayName = p5 or nil,
		membershipType = p2,
		isUnder13 = p3,
		countryCode = p4,
		hasRobloxSubscription = p6
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:fromRequest() --[[ line: 62 ]]
	-- upvalues: enableBlackbirdCheck (ref), t (ref)
	local var9
	if enableBlackbirdCheck then
		var9 = self.responseBody.HasRobloxSubscription == true
		var9 = nil
	else
		var9 = nil
	end
	return t.new(self.responseBody.UserId, self.responseBody.Username, tonumber(self.responseBody.MembershipType), self.responseBody.AgeBracket == 1, self.responseBody.CountryCode, self.responseBody.DisplayName or nil, var9)
end

function t:fromUserInfoRequest() --[[ line: 77 ]]
	-- upvalues: enableBlackbirdCheck (ref), t (ref)
	local var11
	local var10 = if self.responseBody.isPremium then 4 else 0
	
	if enableBlackbirdCheck then
		var11 = self.responseBody.hasRobloxSubscription == true
		var11 = nil
	else
		var11 = nil
	end
	return t.new(self.responseBody.id, self.responseBody.name, var10, self.responseBody.ageBracket == 1, self.responseBody.countryCode, self.responseBody.displayName or nil, var11)
end

function t.fromLocalStorage() --[[ line: 94 ]]
	-- upvalues: enableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), appStorageService (ref), authLocalStorageKeysModule (ref), logger (ref), t (ref)
	local var12 = nil
	
	if enableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function() --[[ line: 98 ]]
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy)
			return appStorageService:GetItem(authLocalStorageKeysModule.HasRobloxSubscription)
		end)
		
		if ok then
			var12 = if status ~= "true" then false else true
		else
			logger:warning("Failed to read HasRobloxSubscription from local storage: {}", tostring(status))
		end
	end
	return t.new(tonumber(appStorageService:GetItem(authLocalStorageKeysModule.UserId)) or -1, appStorageService:GetItem(authLocalStorageKeysModule.Username), tonumber(appStorageService:GetItem(authLocalStorageKeysModule.Membership)) or 0, appStorageService:GetItem(authLocalStorageKeysModule.IsUnder13) ~= "true", appStorageService:GetItem(authLocalStorageKeysModule.CountryCode) or nil, appStorageService:GetItem(authLocalStorageKeysModule.DisplayName) or nil, var12)
end

function t.clearLocalStorage() --[[ line: 118 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), enableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), logger (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.UserId, "-1")
	appStorageService:SetItem(authLocalStorageKeysModule.Username, "")
	appStorageService:SetItem(authLocalStorageKeysModule.Membership, "")
	appStorageService:SetItem(authLocalStorageKeysModule.IsUnder13, "")
	appStorageService:SetItem(authLocalStorageKeysModule.DisplayName, "")
	appStorageService:SetItem(authLocalStorageKeysModule.CountryCode, "")
	
	if enableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function() --[[ line: 126 ]]
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy)
			appStorageService:SetItem(authLocalStorageKeysModule.HasRobloxSubscription, "")
		end)
		
		if not ok then
			logger:warning("Failed to clear HasRobloxSubscription from local storage: {}", tostring(status))
		end
	end
	appStorageService:Flush()
end

function t:setToLocalPlayer() --[[ line: 136 ]]
	-- upvalues: enableBlackbirdCheck (ref), playersService (ref)
	if enableBlackbirdCheck and self.hasRobloxSubscription ~= nil then
		playersService:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13, self.hasRobloxSubscription)
		
		return
	end
	playersService:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13)
end

function t:setToLocalStorage() --[[ line: 157 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), enableBlackbirdCheck (ref), hasRobloxSubscriptionStorageKeyEngineFeature (ref), logger (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.UserId, tostring(self.userId))
	appStorageService:SetItem(authLocalStorageKeysModule.Username, self.username)
	appStorageService:SetItem(authLocalStorageKeysModule.Membership, tostring(self.membershipType))
	appStorageService:SetItem(authLocalStorageKeysModule.IsUnder13, tostring(self.isUnder13))
	appStorageService:SetItem(authLocalStorageKeysModule.DisplayName, tostring(self.displayName))
	appStorageService:SetItem(authLocalStorageKeysModule.CountryCode, tostring(self.countryCode))
	
	if enableBlackbirdCheck and hasRobloxSubscriptionStorageKeyEngineFeature then
		local ok, status = pcall(function() --[[ line: 165 ]]
			-- upvalues: appStorageService (copy), authLocalStorageKeysModule (copy), self (ref)
			appStorageService:SetItem(authLocalStorageKeysModule.HasRobloxSubscription, tostring(self.hasRobloxSubscription == true))
		end)
		
		if not ok then
			logger:warning("Failed to save HasRobloxSubscription to local storage: {}", tostring(status))
		end
	end
	appStorageService:Flush()
end

function t:isSame(p7) --[[ line: 178 ]]
	return self.userId == p7.userId
end

function t:isEqual(p8) --[[ line: 182 ]]
	-- upvalues: enableBlackbirdCheck (ref)
	local var13 = false
	
	if self.userId == p8.userId then
		var13 = false
		
		if self.username == p8.username then
			var13 = false
			
			if self.membershipType == p8.membershipType then
				var13 = false
				
				if self.isUnder13 == p8.isUnder13 then
					var13 = false
					
					if self.displayName == p8.displayName then
						var13 = false
						
						if self.countryCode == p8.countryCode then
							if enableBlackbirdCheck then
								return self.hasRobloxSubscription == p8.hasRobloxSubscription
							end
							var13 = true
						end
					end
				end
			end
		end
	end
	return var13
end

function t:toString() --[[ line: 192 ]]
	-- upvalues: enableBlackbirdCheck (ref)
	local formattedText = string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(self.userId), self.username, tostring(self.membershipType), tostring(self.isUnder13), tostring(self.countryCode))
	
	if enableBlackbirdCheck then
		formattedText ..= string.format(", hasRobloxSubscription:%s", tostring(self.hasRobloxSubscription))
	end
	return formattedText
end

function t:toJsonData() --[[ line: 207 ]]
	-- upvalues: enableBlackbirdCheck (ref), httpService (ref)
	local t = {
		userId = self.userId,
		username = self.username,
		displayName = self.displayName or nil,
		membershipType = self.membershipType,
		isUnder13 = self.isUnder13,
		countryCode = self.countryCode
	}
	
	if enableBlackbirdCheck then
		t.hasRobloxSubscription = self.hasRobloxSubscription
	end
	return httpService:JSONEncode(t)
end

return t
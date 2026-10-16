local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Parent = AuthCommon.Parent
local AuthLocalStorageKeysModule = require(AuthCommon.Enums.AuthLocalStorageKeys)
local Logger = require(Parent.Loggers).Logger
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local HasRobloxSubscriptionStorageKeyEngineFeature = game:GetEngineFeature("HasRobloxSubscriptionStorageKey")
local UserModule = {}
UserModule.__index = UserModule

function UserModule.new(UserId, Username, Number, IsAgeBracketMatch, CountryCode, DisplayName, IsHasRobloxSubscription) --[[ Line: 39 ]]
	-- upvalues: UserModule (copy)
	local config = {
		userId = UserId,
		username = Username,
		displayName = DisplayName or nil,
		membershipType = Number,
		isUnder13 = IsAgeBracketMatch,
		countryCode = CountryCode,
		hasRobloxSubscription = IsHasRobloxSubscription
	}
	setmetatable(config, UserModule)
	
	return config
end

function UserModule:fromRequest() --[[ Line: 62 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), UserModule (copy)
	return UserModule.new(self.responseBody.UserId, self.responseBody.Username, tonumber(self.responseBody.MembershipType), self.responseBody.AgeBracket == 1, self.responseBody.CountryCode, self.responseBody.DisplayName or nil, if FFlagEnableBlackbirdCheck then self.responseBody.HasRobloxSubscription == true else nil)
end

function UserModule:fromUserInfoRequest() --[[ Line: 77 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), UserModule (copy)
	return UserModule.new(self.responseBody.id, self.responseBody.name, if self.responseBody.isPremium then 4 else 0, self.responseBody.ageBracket == 1, self.responseBody.countryCode, self.responseBody.displayName or nil, if FFlagEnableBlackbirdCheck then self.responseBody.hasRobloxSubscription == true else nil)
end

function UserModule.fromLocalStorage() --[[ Line: 94 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), HasRobloxSubscriptionStorageKeyEngineFeature (copy), AppStorageService (copy), AuthLocalStorageKeysModule (copy), Logger (copy), UserModule (copy)
	local IsTrue: boolean? = nil
	
	if FFlagEnableBlackbirdCheck and HasRobloxSubscriptionStorageKeyEngineFeature then
		local Success, Result = pcall(function() --[[ Line: 98 ]]
			-- upvalues: AppStorageService (upval), AuthLocalStorageKeysModule (upval)
			return AppStorageService:GetItem(AuthLocalStorageKeysModule.HasRobloxSubscription)
		end)
		
		if Success then
			IsTrue = Result == "true"
		else
			Logger:warning("Failed to read HasRobloxSubscription from local storage: {}", (tostring(Result)))
		end
	end
	return UserModule.new(tonumber(AppStorageService:GetItem(AuthLocalStorageKeysModule.UserId)) or -1, AppStorageService:GetItem(AuthLocalStorageKeysModule.Username), tonumber(AppStorageService:GetItem(AuthLocalStorageKeysModule.Membership)) or 0, AppStorageService:GetItem(AuthLocalStorageKeysModule.IsUnder13) == "true", AppStorageService:GetItem(AuthLocalStorageKeysModule.CountryCode) or nil, AppStorageService:GetItem(AuthLocalStorageKeysModule.DisplayName) or nil, IsTrue)
end

function UserModule.clearLocalStorage() --[[ Line: 118 ]]
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy), FFlagEnableBlackbirdCheck (copy), HasRobloxSubscriptionStorageKeyEngineFeature (copy), Logger (copy)
	AppStorageService:SetItem(AuthLocalStorageKeysModule.UserId, "-1")
	AppStorageService:SetItem(AuthLocalStorageKeysModule.Username, "")
	AppStorageService:SetItem(AuthLocalStorageKeysModule.Membership, "")
	AppStorageService:SetItem(AuthLocalStorageKeysModule.IsUnder13, "")
	AppStorageService:SetItem(AuthLocalStorageKeysModule.DisplayName, "")
	AppStorageService:SetItem(AuthLocalStorageKeysModule.CountryCode, "")
	
	if FFlagEnableBlackbirdCheck and HasRobloxSubscriptionStorageKeyEngineFeature then
		local Success, Result = pcall(function() --[[ Line: 126 ]]
			-- upvalues: AppStorageService (upval), AuthLocalStorageKeysModule (upval)
			AppStorageService:SetItem(AuthLocalStorageKeysModule.HasRobloxSubscription, "")
		end)
		
		if not Success then
			Logger:warning("Failed to clear HasRobloxSubscription from local storage: {}", (tostring(Result)))
		end
	end
	AppStorageService:Flush()
end

function UserModule:setToLocalPlayer() --[[ Line: 136 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), Players (copy)
	if FFlagEnableBlackbirdCheck and self.hasRobloxSubscription ~= nil then
		Players:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13, self.hasRobloxSubscription)
		
		return
	else
		Players:SetLocalPlayerInfo(self.userId, self.username, self.displayName or "", self.membershipType, self.isUnder13)
	end
end

function UserModule:setToLocalStorage() --[[ Line: 157 ]]
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy), FFlagEnableBlackbirdCheck (copy), HasRobloxSubscriptionStorageKeyEngineFeature (copy), Logger (copy)
	AppStorageService:SetItem(AuthLocalStorageKeysModule.UserId, (tostring(self.userId)))
	AppStorageService:SetItem(AuthLocalStorageKeysModule.Username, self.username)
	AppStorageService:SetItem(AuthLocalStorageKeysModule.Membership, (tostring(self.membershipType)))
	AppStorageService:SetItem(AuthLocalStorageKeysModule.IsUnder13, (tostring(self.isUnder13)))
	AppStorageService:SetItem(AuthLocalStorageKeysModule.DisplayName, (tostring(self.displayName)))
	AppStorageService:SetItem(AuthLocalStorageKeysModule.CountryCode, (tostring(self.countryCode)))
	
	if FFlagEnableBlackbirdCheck and HasRobloxSubscriptionStorageKeyEngineFeature then
		local Success, Result = pcall(function() --[[ Line: 165 ]]
			-- upvalues: AppStorageService (upval), AuthLocalStorageKeysModule (upval), self (copy)
			AppStorageService:SetItem(AuthLocalStorageKeysModule.HasRobloxSubscription, (tostring(self.hasRobloxSubscription == true)))
		end)
		
		if not Success then
			Logger:warning("Failed to save HasRobloxSubscription to local storage: {}", (tostring(Result)))
		end
	end
	AppStorageService:Flush()
end

function UserModule:isSame(p1): boolean --[[ Line: 178 ]]
	return self.userId == p1.userId
end

function UserModule:isEqual(Input1): boolean --[[ Line: 182 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy)
	local Flag = false
	
	if self.userId == Input1.userId then
		Flag = false
		
		if self.username == Input1.username then
			Flag = false
			
			if self.membershipType == Input1.membershipType then
				Flag = false
				
				if self.isUnder13 == Input1.isUnder13 then
					Flag = false
					
					if self.displayName == Input1.displayName then
						Flag = false
						
						if self.countryCode == Input1.countryCode then
							if FFlagEnableBlackbirdCheck then
								return self.hasRobloxSubscription == Input1.hasRobloxSubscription
							end
							Flag = true
						end
					end
				end
			end
		end
	end
	return Flag
end

function UserModule:toString(): string --[[ Line: 192 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy)
	local Formatted = string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(self.userId), self.username, tostring(self.membershipType), tostring(self.isUnder13), (tostring(self.countryCode)))
	
	if FFlagEnableBlackbirdCheck then
		Formatted ..= string.format(", hasRobloxSubscription:%s", (tostring(self.hasRobloxSubscription)))
	end
	return Formatted
end

function UserModule:toJsonData() --[[ Line: 207 ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), HttpService (copy)
	local config = {
		userId = self.userId,
		username = self.username,
		displayName = self.displayName or nil,
		membershipType = self.membershipType,
		isUnder13 = self.isUnder13,
		countryCode = self.countryCode
	}
	
	if FFlagEnableBlackbirdCheck then
		config.hasRobloxSubscription = self.hasRobloxSubscription
	end
	return HttpService:JSONEncode(config)
end

return UserModule
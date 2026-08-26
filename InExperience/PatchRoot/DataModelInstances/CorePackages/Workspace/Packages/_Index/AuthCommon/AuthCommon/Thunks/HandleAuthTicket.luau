local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local notificationType = require(parent.RobloxAppEnums).NotificationType
local url = require(parent.Http).Url
local promiseModule = require(parent.Promise)
local experienceService = require(parent.ExperienceService).ExperienceService
local gameParams = require(parent.ExperienceService).GameParams
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableLuaAccountSwitch = sharedFlagsModule.FFlagEnableLuaAccountSwitch
local fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = sharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local userModule = require(authCommon.Thunks.User)
local accountSwitcherConstantsModule = require(authCommon.Common.AccountSwitcherConstants)

local function _(p1)
	local var1 = tonumber(p1)
	
	return var1 or (p1 == "true" or (if p1 == "false" then false else p1))
end

local function parsePlaceLauncherUrl(p1)
	if not p1 or p1 == "" then
		return {}
	end
	local var1 = p1:gsub("%%(%x%x)", function(p2)
		return string.char(tonumber(p2, 16))
	end)
	local t = {}
	local _, matchIndex = string.find(var1, "?")
	
	if not matchIndex then
		return t
	end
	for i in string.gmatch(string.sub(var1, matchIndex + 1), "[^&]+") do
		local match, match_1 = string.match(i, "([^=]+)=?(.*)")
		
		if match then
			t[match] = match_1
		end
	end
	return t
end

return function(p2, p3, p4, p5, p6)
	-- upvalues: url (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref), parsePlaceLauncherUrl (ref), gameParams (ref), userModule (ref), promiseModule (ref), fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (ref), accountSwitcherConstantsModule (ref), guiService (ref), notificationType (ref), experienceService (ref)
	return p2(string.format("%sv1/authentication-ticket/redeem", url.AUTH_URL), "POST", {
		postBody = httpService:JSONEncode({
			retainCurrentSession = true,
			authenticationTicket = p3,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
		})
	}):andThen(function(p7)
		-- upvalues: parsePlaceLauncherUrl (copy), p4 (ref), gameParams (copy), appStorageUtilitiesModule (copy), userModule (copy), fFlagEnableLuaAccountSwitch (copy), promiseModule (copy), p6 (ref), fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), accountSwitcherConstantsModule (copy), guiService (copy), notificationType (copy), p5 (ref), experienceService (copy)
		local var2 = parsePlaceLauncherUrl(p4)
		local var3 = tonumber(var2.placeId)
		
		if var3 then
			local var4 = gameParams.fromPlaceId(var3)
			
			for i, v in pairs(var2) do
				if i ~= "placeId" then
					local var5 = tonumber(v)
					var4[i] = var5 or (v == "true" or (if v == "false" then false else v))
				end
			end
			if fFlagEnableLuaAccountSwitch and (userModule.fromLocalStorage().userId ~= -1 or appStorageUtilitiesModule.getAccountBlob() ~= "") then
				promiseModule.resolve(p6()):andThen(function()
					-- upvalues: fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), accountSwitcherConstantsModule (copy), appStorageUtilitiesModule (copy), p7 (ref), var2 (ref), guiService (copy), notificationType (copy)
					appStorageUtilitiesModule.setAccountSwitchStatus(if fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then accountSwitcherConstantsModule.AccountSwitcherSwitchedFromLoginStatus else accountSwitcherConstantsModule.AccountSwitcherSwitchedStatus)
					appStorageUtilitiesModule.setAccountBlob(p7.responseBody.accountBlob)
					appStorageUtilitiesModule.setAccountSwitchStartupQueryParams(var2)
					appStorageUtilitiesModule.flush()
					guiService:BroadcastNotification("", notificationType.DID_SWITCH_ACCOUNT)
				end, function(p8)
					print("error: ", p8)
				end)
			else
				return promiseModule.resolve(p5()):andThen(function()
					-- upvalues: experienceService (copy), var4 (ref)
					experienceService:LaunchExperience(var4, "AuthTicket", nil)
				end)
			end
		end
		return promiseModule.resolve()
	end, function(p8)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p8)
	end)
end
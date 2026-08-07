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

local function _(p0) --[[ line: 22 | named "castStringToInferredType" ]]
	local var9 = tonumber(p0)
	
	return var9 or (p0 == "true" or (if p0 == "false" then false else p0))
end

local function parsePlaceLauncherUrl(p1) --[[ line: 41 ]]
	if not p1 or p1 == "" then
		return {}
	end
	local var10 = p1:gsub("%%(%x%x)", function(p2) --[[ line: 47 ]]
		return string.char(tonumber(p2, 16))
	end)
	local t = {}
	local _, matchIndex = string.find(var10, "?")
	
	if not matchIndex then
		return t
	end
	for i in string.gmatch(string.sub(var10, matchIndex + 1), "[^&]+") do
		local match, match_1 = string.match(i, "([^=]+)=?(.*)")
		
		if match then
			t[match] = match_1
		end
	end
	return t
end

return function(p3, p4, p5, p6, p7) --[[ line: 72 ]]
	-- upvalues: url (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref), parsePlaceLauncherUrl (ref), gameParams (ref), userModule (ref), promiseModule (ref), fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (ref), accountSwitcherConstantsModule (ref), guiService (ref), notificationType (ref), experienceService (ref)
	return p3(string.format("%sv1/authentication-ticket/redeem", url.AUTH_URL), "POST", {
		postBody = httpService:JSONEncode({
			retainCurrentSession = true,
			authenticationTicket = p4,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
		})
	}):andThen(function(p8) --[[ line: 81 ]]
		-- upvalues: parsePlaceLauncherUrl (copy), p5 (ref), gameParams (copy), appStorageUtilitiesModule (copy), userModule (copy), fFlagEnableLuaAccountSwitch (copy), promiseModule (copy), p7 (ref), fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), accountSwitcherConstantsModule (copy), guiService (copy), notificationType (copy), p6 (ref), experienceService (copy)
		local var15 = parsePlaceLauncherUrl(p5)
		local var16 = tonumber(var15.placeId)
		
		if var16 then
			local var17 = gameParams.fromPlaceId(var16)
			
			for i, v in pairs(var15) do
				if i ~= "placeId" then
					local var18 = tonumber(v)
					var17[i] = var18 or (v == "true" or (if v == "false" then false else v))
				end
			end
			if fFlagEnableLuaAccountSwitch and (userModule.fromLocalStorage().userId ~= -1 or appStorageUtilitiesModule.getAccountBlob() ~= "") then
				promiseModule.resolve(p7()):andThen(function() --[[ line: 98 ]]
					-- upvalues: fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), accountSwitcherConstantsModule (copy), appStorageUtilitiesModule (copy), p8 (ref), var15 (ref), guiService (copy), notificationType (copy)
					appStorageUtilitiesModule.setAccountSwitchStatus(if fFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then accountSwitcherConstantsModule.AccountSwitcherSwitchedFromLoginStatus else accountSwitcherConstantsModule.AccountSwitcherSwitchedStatus)
					appStorageUtilitiesModule.setAccountBlob(p8.responseBody.accountBlob)
					appStorageUtilitiesModule.setAccountSwitchStartupQueryParams(var15)
					appStorageUtilitiesModule.flush()
					guiService:BroadcastNotification("", notificationType.DID_SWITCH_ACCOUNT)
				end, function(p9) --[[ line: 108 ]]
					print("error: ", p9)
				end)
			else
				return promiseModule.resolve(p6()):andThen(function() --[[ line: 112 ]]
					-- upvalues: experienceService (copy), var17 (ref)
					experienceService:LaunchExperience(var17, "AuthTicket", nil)
				end)
			end
		end
		return promiseModule.resolve()
	end, function(p10) --[[ line: 119 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p10)
	end)
end
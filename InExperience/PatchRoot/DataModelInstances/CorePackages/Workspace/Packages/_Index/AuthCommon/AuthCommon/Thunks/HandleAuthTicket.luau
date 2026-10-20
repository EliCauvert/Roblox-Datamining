local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local GuiService = game:GetService("GuiService")
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local PromiseModule = require(Parent.Promise)
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local GameParams = require(Parent.ExperienceService).GameParams
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLuaAccountSwitch = SharedFlagsModule.FFlagEnableLuaAccountSwitch
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local UserModule = require(AuthCommon.Thunks.User)
local AccountSwitcherConstantsModule = require(AuthCommon.Common.AccountSwitcherConstants)
local RedeemAuthenticationTicketModule = require(AuthCommon.Http.Requests.RedeemAuthenticationTicket)

local function _(p1)
	local Number: number? = tonumber(p1)
	
	return if Number then Number else p1 == "true" or p1 ~= "false" and p1
end

local function parsePlaceLauncherUrl(Text: string)
	if not Text or Text == "" then
		return {}
	end
	local XX: string = Text:gsub("%%(%x%x)", function(p1): string
		return (string.char((tonumber(p1, 16))))
	end)
	local t = {}
	local _, EndIndex = string.find(XX, "?")
	
	if not EndIndex then
		return t
	end
	for i in string.gmatch(string.sub(XX, EndIndex + 1), "[^&]+") do
		local Match, Match2 = string.match(i, "([^=]+)=?(.*)")
		
		if Match then
			t[Match] = Match2
		end
	end
	return t
end

return function(p1, p2, p3, Callback, Callback1)
	-- upvalues: RedeemAuthenticationTicketModule (copy), parsePlaceLauncherUrl (copy), GameParams (copy), AppStorageUtilitiesModule (copy), UserModule (copy), FFlagEnableLuaAccountSwitch (copy), PromiseModule (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstantsModule (copy), GuiService (copy), NotificationType (copy), ExperienceService (copy)
	return (RedeemAuthenticationTicketModule(p1, p2):andThen(function(Result)
		-- upvalues: parsePlaceLauncherUrl (upval), p3 (copy), GameParams (upval), AppStorageUtilitiesModule (upval), UserModule (upval), FFlagEnableLuaAccountSwitch (upval), PromiseModule (upval), Callback1 (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstantsModule (upval), GuiService (upval), NotificationType (upval), Callback (copy), ExperienceService (upval)
		local ParsePlaceLauncherUrlResult = parsePlaceLauncherUrl(p3)
		local Number: number? = tonumber(ParsePlaceLauncherUrlResult.placeId)
		
		if Number then
			local FromPlaceIdResult = GameParams.fromPlaceId(Number)
			
			for i, value in pairs(ParsePlaceLauncherUrlResult) do
				if i ~= "placeId" then
					local Number1: number? = tonumber(value)
					FromPlaceIdResult[i] = if Number1 then Number1 else value == "true" or value ~= "false" and value
				end
			end
			local AccountBlob = AppStorageUtilitiesModule.getAccountBlob()
			local IsNotUserIdMatch = UserModule.fromLocalStorage().userId ~= -1
			
			if not FFlagEnableLuaAccountSwitch or not IsNotUserIdMatch and AccountBlob == "" then
				return PromiseModule.resolve(Callback()):andThen(function()
					-- upvalues: ExperienceService (upval), FromPlaceIdResult (copy)
					ExperienceService:LaunchExperience(FromPlaceIdResult, "AuthTicket", nil)
				end)
			end
			PromiseModule.resolve(Callback1()):andThen(function()
				-- upvalues: FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstantsModule (upval), AppStorageUtilitiesModule (upval), Result (copy), ParsePlaceLauncherUrlResult (copy), GuiService (upval), NotificationType (upval)
				AppStorageUtilitiesModule.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstantsModule.AccountSwitcherSwitchedFromLoginStatus else AccountSwitcherConstantsModule.AccountSwitcherSwitchedStatus)
				AppStorageUtilitiesModule.setAccountBlob(Result.responseBody.accountBlob)
				AppStorageUtilitiesModule.setAccountSwitchStartupQueryParams(ParsePlaceLauncherUrlResult)
				AppStorageUtilitiesModule.flush()
				GuiService:BroadcastNotification("", NotificationType.DID_SWITCH_ACCOUNT)
			end, function(p4)
				print("error: ", p4)
			end)
		end
		return PromiseModule.resolve()
	end, function(p4)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p4)
	end))
end
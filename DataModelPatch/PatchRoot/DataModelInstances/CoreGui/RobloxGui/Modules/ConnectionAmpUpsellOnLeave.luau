local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagConnectionUpsellAnalytics = SharedFlagsModule.FFlagConnectionUpsellAnalytics
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local PlacelaunchAgeVerificationRequired = nil
local PlacelaunchParentalApprovalRequired = nil
pcall(function()
	-- upvalues: PlacelaunchAgeVerificationRequired (ref), PlacelaunchParentalApprovalRequired (ref)
	PlacelaunchAgeVerificationRequired = Enum.ConnectionError.PlacelaunchAgeVerificationRequired
	PlacelaunchParentalApprovalRequired = Enum.ConnectionError.PlacelaunchParentalApprovalRequired
end)

local function logTelemetry(Config, SelectedItem)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogCounter(Config, { customFields = { selectedItem = SelectedItem } }, 1)
end

local function fetchUniverseIdFromPlaceIdYielding(PlaceId)
	-- upvalues: Url (copy), HttpRbxApiService (copy), HttpService (copy)
	local Success, Result = pcall(HttpRbxApiService.GetAsyncFullUrl, HttpRbxApiService, (string.format("%suniverses/v1/places/%d/universe", Url.APIS_URL, PlaceId)))
	
	if not Success or type(Result) ~= "string" then
		return nil
	end
	local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
	
	if Success1 and type(Result1) == "table" then
		local UniverseId: number = Result1.universeId
		
		return if type(UniverseId) == "number" and UniverseId > 0 then UniverseId else nil
	else
		return nil
	end
end

local Config = if FFlagConnectionUpsellAnalytics then {
	eventName = "unlockPlayIntent",
	description = "Fired when a user clicks Continue on an AMP age check / parental approval upsell from a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpUnlockPlayIntentThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local Config1 = if FFlagConnectionUpsellAnalytics then {
	eventName = "gameJoinUpsellImpression",
	description = "Fired when an AMP age check / parental approval upsell is shown during a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpGameJoinUpsellImpressionThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local List = if FFlagConnectionUpsellAnalytics then { "addSessionInfo", "addSessionId", "addOSInfo" } else nil
local Config2 = if FFlagConnectionUpsellAnalytics then {
	upsellName = "AgeCheckRequired",
	playabilityStatus = "ContextualPlayabilityAgeCheckRequired",
	missingPlaceIdItem = "AmpAgeCheckMissingPlaceId",
	universeIdLookupFailedItem = "AgeCheckImpressionUniverseIdLookupFailed"
} else nil
local Config3 = if FFlagConnectionUpsellAnalytics then {
	upsellName = "ParentApprovalRequired",
	playabilityStatus = "ContextualPlayabilityRequireParentApproval",
	missingPlaceIdItem = "AmpParentApprovalMissingPlaceId",
	universeIdLookupFailedItem = "ParentApprovalImpressionUniverseIdLookupFailed"
} else nil
local T = if FFlagConnectionUpsellAnalytics then {} else nil
local Callback = if FFlagConnectionUpsellAnalytics then function(p1, EventContext, Config, UniverseId)
	-- upvalues: TelemetryService (copy), List (copy)
	TelemetryService:LogEvent(Config, {
		eventContext = EventContext,
		standardizedFields = List,
		customFields = {
			universeId = UniverseId,
			upsellName = p1.upsellName,
			playabilityStatus = p1.playabilityStatus
		}
	})
end else nil
local Callback2 = if FFlagConnectionUpsellAnalytics then function(p1, Key, p2)
	-- upvalues: T (copy), Callback (copy), Config (copy)
	local Entry = (if p2 == "" then T[Key] else p2 or T[Key]) or ""
	
	if p2 and p2 ~= "" then
		T[Key] = p2
	end
	Callback(p1, "GameJoin", Config, Entry)
end else nil
local Callback1 = if FFlagConnectionUpsellAnalytics then function(p1, p2, p3)
	-- upvalues: logTelemetry (copy), T (copy), Callback (copy), Config1 (copy), fetchUniverseIdFromPlaceIdYielding (copy)
	if not p3 or p3 == 0 then
		logTelemetry(p1, p2.missingPlaceIdItem)
		
		return
	end
	local Entry = T[p3]
	
	if Entry then
		Callback(p2, p2.upsellName, Config1, Entry)
		
		return
	else
		task.spawn(function()
			-- upvalues: fetchUniverseIdFromPlaceIdYielding (upval), p3 (copy), T (upval), logTelemetry (upval), p1 (copy), p2 (copy), Callback (upval), Config1 (upval)
			local UniverseIdFromPlaceIdYielding = fetchUniverseIdFromPlaceIdYielding(p3)
			local Text: string = if UniverseIdFromPlaceIdYielding then tostring(UniverseIdFromPlaceIdYielding) else ""
			
			if UniverseIdFromPlaceIdYielding then
				T[p3] = Text
			else
				logTelemetry(p1, p2.universeIdLookupFailedItem)
			end
			Callback(p2, p2.upsellName, Config1, Text)
		end)
	end
end else nil

local function _()
	-- upvalues: CorePackages (copy)
	local Success, Result = pcall(require, CorePackages.Workspace.Packages.AmpUpsell)
	
	return if Success then Result else nil
end

local _ = function()
	-- upvalues: CoreGui (copy)
	local Success, Result = pcall(require, CoreGui.RobloxGui.Modules.ApolloClient)
	
	return if Success then Result else nil
end

local function openWizardThenReconnect(p1, Callback, p2, FStringLuaAppPlayButtonAgeCheckAmpFeatureName, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, p3, p4, p5, SelectedItem)
	-- upvalues: logTelemetry (copy), CorePackages (copy), CoreGui (copy)
	logTelemetry(p1, SelectedItem)
	local Success, Result = pcall(require, CorePackages.Workspace.Packages.AmpUpsell)
	local Result1 = if Success then Result else nil
	
	if not Result1 then
		logTelemetry(p1, "AmpWizardLoadFailed")
		
		return
	end
	local Success1, Result2 = pcall(require, CoreGui.RobloxGui.Modules.ApolloClient)
	local Result3 = if Success1 then Result2 else nil
	
	if not Result3 then
		logTelemetry(p1, "AmpWizardApolloLoadFailed")
		
		return
	end
	if not pcall(function()
		-- upvalues: Result1 (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), logTelemetry (upval), p1 (copy), Callback (copy), p4 (copy), p3 (copy), p5 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), Result3 (copy), p2 (copy)
		Result1.InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, function(Granted)
			-- upvalues: Result1 (upval), logTelemetry (upval), p1 (upval), Callback (upval)
			if Granted == Result1.AmpEnums.AccessResponseEnum.Granted then
				logTelemetry(p1, "AmpWizardGrantedReconnect")
				Callback()
				
				return
			else
				logTelemetry(p1, "AmpWizardNotGranted")
			end
		end, p4, p3, p5, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, Result3, p2, true)
	end) then
		logTelemetry(p1, "AmpWizardOpenError")
	end
end

return {
	PrimaryButtonText = "Continue",
	PrimaryButtonLocalizationKey = "InGame.ConnectionError.Action.Continue",
	AgeVerificationRequiredEnum = PlacelaunchAgeVerificationRequired,
	ParentalApprovalRequiredEnum = PlacelaunchParentalApprovalRequired,
	createAgeCheckCallback = function(p1, p2, p3: number)
		-- upvalues: FFlagConnectionUpsellAnalytics (copy), Callback2 (copy), Config2 (copy), openWizardThenReconnect (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
		local v1 = p3 + 1
		
		return function()
			-- upvalues: FFlagConnectionUpsellAnalytics (upval), Callback2 (upval), Config2 (upval), openWizardThenReconnect (upval), p1 (copy), p2 (copy), v1 (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval)
			if FFlagConnectionUpsellAnalytics then
				Callback2(Config2, game.PlaceId, "")
			end
			openWizardThenReconnect(p1, p2, v1, FStringLuaAppPlayButtonAgeCheckAmpFeatureName, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, "gameJoinAgeCheckRequired", nil, nil, "AmpAgeCheckOpened")
		end
	end,
	createParentalApprovalCallback = function(p1, p2, p3: number)
		-- upvalues: logTelemetry (copy), fetchUniverseIdFromPlaceIdYielding (copy), FFlagConnectionUpsellAnalytics (copy), Callback2 (copy), Config3 (copy), openWizardThenReconnect (copy)
		local v1 = p3 + 1
		
		return function()
			-- upvalues: logTelemetry (upval), p1 (copy), fetchUniverseIdFromPlaceIdYielding (upval), FFlagConnectionUpsellAnalytics (upval), Callback2 (upval), Config3 (upval), openWizardThenReconnect (upval), p2 (copy), v1 (copy)
			local PlaceId = game.PlaceId
			
			if PlaceId and PlaceId ~= 0 then
				task.spawn(function()
					-- upvalues: fetchUniverseIdFromPlaceIdYielding (upval), PlaceId (copy), FFlagConnectionUpsellAnalytics (upval), Callback2 (upval), Config3 (upval), logTelemetry (upval), p1 (upval), openWizardThenReconnect (upval), p2 (upval), v1 (upval)
					local UniverseIdFromPlaceIdYielding = fetchUniverseIdFromPlaceIdYielding(PlaceId)
					
					if FFlagConnectionUpsellAnalytics then
						Callback2(Config3, PlaceId, if UniverseIdFromPlaceIdYielding then tostring(UniverseIdFromPlaceIdYielding) else "")
					end
					if UniverseIdFromPlaceIdYielding then
						openWizardThenReconnect(p1, p2, v1, "CanApproveExperience", nil, "gameJoinContentMaturityLock", {
							experienceManagementAction = "Approve",
							universeId = tostring(UniverseIdFromPlaceIdYielding)
						}, nil, "AmpParentApprovalOpened")
						
						return
					else
						logTelemetry(p1, "AmpParentApprovalUniverseIdLookupFailed")
					end
				end)
				
				return
			else
				logTelemetry(p1, "AmpParentApprovalMissingPlaceId")
			end
		end
	end,
	fireImpressionAgeCheck = if FFlagConnectionUpsellAnalytics then function(p1, p2)
		-- upvalues: Callback1 (copy), Config2 (copy)
		Callback1(p1, Config2, p2)
	end else nil,
	fireImpressionParentalApproval = if FFlagConnectionUpsellAnalytics then function(p1, p2)
		-- upvalues: Callback1 (copy), Config3 (copy)
		Callback1(p1, Config3, p2)
	end else nil
}
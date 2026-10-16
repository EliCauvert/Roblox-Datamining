local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagConnectionUpsellAnalytics = SharedFlagsModule.FFlagConnectionUpsellAnalytics
local FFlagPioneerLeaveOnInExpFaeDownAge = SharedFlagsModule.FFlagPioneerLeaveOnInExpFaeDownAge
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local MaybeLeavePioneerOnFaeDownAgeModule = require(CorePackages.Workspace.Packages.PioneerUtils.maybeLeavePioneerOnFaeDownAge)
local PlacelaunchAgeVerificationRequired = nil
local PlacelaunchParentalApprovalRequired = nil
pcall(function() --[[ Line: 35 ]]
	-- upvalues: PlacelaunchAgeVerificationRequired (ref), PlacelaunchParentalApprovalRequired (ref)
	PlacelaunchAgeVerificationRequired = Enum.ConnectionError.PlacelaunchAgeVerificationRequired
	PlacelaunchParentalApprovalRequired = Enum.ConnectionError.PlacelaunchParentalApprovalRequired
end)

local function logTelemetry(Config, SelectedItem) --[[ Line: 40 ]]
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogCounter(Config, { customFields = { selectedItem = SelectedItem } }, 1)
end

local function fetchUniverseIdFromPlaceIdYielding(PlaceId) --[[ Line: 47 ]]
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
local Callback = if FFlagConnectionUpsellAnalytics then function(p1, EventContext, Config, UniverseId) --[[ Line: 123 ]]
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
local Callback2 = if FFlagConnectionUpsellAnalytics then function(p1, Key, p2) --[[ Line: 142 ]]
	-- upvalues: T (copy), Callback (copy), Config (copy)
	local Entry = (if p2 == "" then T[Key] else p2 or T[Key]) or ""
	
	if p2 and p2 ~= "" then
		T[Key] = p2
	end
	Callback(p1, "GameJoin", Config, Entry)
end else nil
local Callback1 = if FFlagConnectionUpsellAnalytics then function(p1, p2, p3) --[[ Line: 153 ]]
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
		task.spawn(function() --[[ Line: 163 ]]
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

local function _() --[[ Line: 189 | Named "loadAmpUpsell" ]]
	-- upvalues: CorePackages (copy)
	local Success, Result = pcall(require, CorePackages.Workspace.Packages.AmpUpsell)
	
	return if Success then Result else nil
end

local _ = function() --[[ Line: 196 | Named "loadCoreScriptsApolloClient" ]]
	-- upvalues: CoreGui (copy)
	local Success, Result = pcall(require, CoreGui.RobloxGui.Modules.ApolloClient)
	
	return if Success then Result else nil
end

local function openWizardThenReconnect(p1, Callback, p2, FStringLuaAppPlayButtonAgeCheckAmpFeatureName, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, p3, p4, p5, SelectedItem) --[[ Line: 201 ]]
	-- upvalues: logTelemetry (copy), CorePackages (copy), CoreGui (copy), FFlagPioneerLeaveOnInExpFaeDownAge (copy), MaybeLeavePioneerOnFaeDownAgeModule (copy)
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
	if not pcall(function() --[[ Line: 227 ]]
		-- upvalues: Result1 (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), logTelemetry (upval), p1 (copy), FFlagPioneerLeaveOnInExpFaeDownAge (upval), Callback (copy), MaybeLeavePioneerOnFaeDownAgeModule (upval), p4 (copy), p3 (copy), p5 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), Result3 (copy), p2 (copy)
		Result1.InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, function(Granted, p6) --[[ Line: 230 ]]
			-- upvalues: Result1 (upval), logTelemetry (upval), p1 (upval), FFlagPioneerLeaveOnInExpFaeDownAge (upval), Callback (upval), MaybeLeavePioneerOnFaeDownAgeModule (upval)
			local IsGrantedMatch = Granted == Result1.AmpEnums.AccessResponseEnum.Granted
			
			if IsGrantedMatch then
				logTelemetry(p1, "AmpWizardGrantedReconnect")
				
				if not FFlagPioneerLeaveOnInExpFaeDownAge then
					Callback()
				end
			else
				logTelemetry(p1, "AmpWizardNotGranted")
			end
			if FFlagPioneerLeaveOnInExpFaeDownAge then
				local AmpEnums = Result1.AmpEnums
				MaybeLeavePioneerOnFaeDownAgeModule(p6 ~= nil and p6[AmpEnums.ActionTypeEnum.AgeEstimation] == AmpEnums.ActionStatusEnum.Success, function() --[[ Line: 245 ]]
					-- upvalues: IsGrantedMatch (copy), Callback (upval)
					if IsGrantedMatch then
						Callback()
					end
				end)
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
	createAgeCheckCallback = function(p1, p2, p3: number) --[[ Line: 267 ]]
		-- upvalues: FFlagConnectionUpsellAnalytics (copy), Callback2 (copy), Config2 (copy), openWizardThenReconnect (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
		local v1 = p3 + 1
		
		return function() --[[ Line: 269 ]]
			-- upvalues: FFlagConnectionUpsellAnalytics (upval), Callback2 (upval), Config2 (upval), openWizardThenReconnect (upval), p1 (copy), p2 (copy), v1 (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (upval), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (upval)
			if FFlagConnectionUpsellAnalytics then
				Callback2(Config2, game.PlaceId, "")
			end
			openWizardThenReconnect(p1, p2, v1, FStringLuaAppPlayButtonAgeCheckAmpFeatureName, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, "gameJoinAgeCheckRequired", nil, nil, "AmpAgeCheckOpened")
		end
	end,
	createParentalApprovalCallback = function(p1, p2, p3: number) --[[ Line: 287 ]]
		-- upvalues: logTelemetry (copy), fetchUniverseIdFromPlaceIdYielding (copy), FFlagConnectionUpsellAnalytics (copy), Callback2 (copy), Config3 (copy), openWizardThenReconnect (copy)
		local v1 = p3 + 1
		
		return function() --[[ Line: 289 ]]
			-- upvalues: logTelemetry (upval), p1 (copy), fetchUniverseIdFromPlaceIdYielding (upval), FFlagConnectionUpsellAnalytics (upval), Callback2 (upval), Config3 (upval), openWizardThenReconnect (upval), p2 (copy), v1 (copy)
			local PlaceId = game.PlaceId
			
			if PlaceId and PlaceId ~= 0 then
				task.spawn(function() --[[ Line: 297 ]]
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
	fireImpressionAgeCheck = if FFlagConnectionUpsellAnalytics then function(p1, p2) --[[ Line: 177 ]]
		-- upvalues: Callback1 (copy), Config2 (copy)
		Callback1(p1, Config2, p2)
	end else nil,
	fireImpressionParentalApproval = if FFlagConnectionUpsellAnalytics then function(p1, p2) --[[ Line: 183 ]]
		-- upvalues: Callback1 (copy), Config3 (copy)
		Callback1(p1, Config3, p2)
	end else nil
}
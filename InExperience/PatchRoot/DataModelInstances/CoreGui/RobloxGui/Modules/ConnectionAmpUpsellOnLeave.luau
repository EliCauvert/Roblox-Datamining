local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = sharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = sharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local fFlagConnectionUpsellAnalytics = sharedFlagsModule.FFlagConnectionUpsellAnalytics
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local var1 = nil
local var2 = nil
pcall(function()
	-- upvalues: var1 (write), var2 (write)
	var1 = Enum.ConnectionError.PlacelaunchAgeVerificationRequired
	var2 = Enum.ConnectionError.PlacelaunchParentalApprovalRequired
end)

local function logTelemetry(p1, p2)
	-- upvalues: telemetryService (ref)
	telemetryService:LogCounter(p1, { customFields = { selectedItem = p2 } }, 1)
end

local function fetchUniverseIdFromPlaceIdYielding(p1)
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p1))
	
	if not ok or type(status) ~= "string" then
		return nil
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, status)
	
	if not ok_1 or type(status_1) ~= "table" then
		return nil
	end
	local universeId = status_1.universeId
	
	return if type(universeId) == "number" and universeId > 0 then universeId else nil
end

local var3 = if fFlagConnectionUpsellAnalytics then {
	eventName = "unlockPlayIntent",
	description = "Fired when a user clicks Continue on an AMP age check / parental approval upsell from a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpUnlockPlayIntentThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local var4 = if fFlagConnectionUpsellAnalytics then {
	eventName = "gameJoinUpsellImpression",
	description = "Fired when an AMP age check / parental approval upsell is shown during a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpGameJoinUpsellImpressionThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local var5 = if fFlagConnectionUpsellAnalytics then { "addSessionInfo", "addSessionId", "addOSInfo" } else nil
local var6 = if fFlagConnectionUpsellAnalytics then {
	upsellName = "AgeCheckRequired",
	playabilityStatus = "ContextualPlayabilityAgeCheckRequired",
	missingPlaceIdItem = "AmpAgeCheckMissingPlaceId",
	universeIdLookupFailedItem = "AgeCheckImpressionUniverseIdLookupFailed"
} else nil
local var7 = if fFlagConnectionUpsellAnalytics then {
	upsellName = "ParentApprovalRequired",
	playabilityStatus = "ContextualPlayabilityRequireParentApproval",
	missingPlaceIdItem = "AmpParentApprovalMissingPlaceId",
	universeIdLookupFailedItem = "ParentApprovalImpressionUniverseIdLookupFailed"
} else nil
local var8 = if fFlagConnectionUpsellAnalytics then {} else nil
local var9 = if fFlagConnectionUpsellAnalytics then function(p1, p2, p3, p4)
	-- upvalues: telemetryService (ref), var5 (ref)
	telemetryService:LogEvent(p3, {
		eventContext = p2,
		standardizedFields = var5,
		customFields = {
			universeId = p4,
			upsellName = p1.upsellName,
			playabilityStatus = p1.playabilityStatus
		}
	})
end else nil
local var10 = if fFlagConnectionUpsellAnalytics then function(p1, p2, p3)
	-- upvalues: var8 (ref), var9 (ref), var3 (ref)
	local var11 = if p3 ~= "" then p3 else var8[p2] or ""
	
	if p3 and p3 ~= "" then
		var8[p2] = p3
	end
	var9(p1, "GameJoin", var3, var11)
end else nil
local var11 = if fFlagConnectionUpsellAnalytics then function(p1, p2, p3)
	-- upvalues: logTelemetry (ref), var8 (ref), var9 (ref), var4 (ref), fetchUniverseIdFromPlaceIdYielding (ref)
	if not p3 or p3 == 0 then
		logTelemetry(p1, p2.missingPlaceIdItem)
		
		return
	end
	local var12 = var8[p3]
	
	if var12 then
		var9(p2, p2.upsellName, var4, var12)
		
		return
	end
	task.spawn(function()
		-- upvalues: fetchUniverseIdFromPlaceIdYielding (copy), p3 (ref), var8 (copy), logTelemetry (copy), p1 (ref), p2 (ref), var9 (copy), var4 (copy)
		local var13 = fetchUniverseIdFromPlaceIdYielding(p3)
		local var14 = if var13 then tostring(var13) else ""
		
		if var13 then
			var8[p3] = var14
		else
			logTelemetry(p1, p2.universeIdLookupFailedItem)
		end
		var9(p2, p2.upsellName, var4, var14)
	end)
end else nil
local var12 = if fFlagConnectionUpsellAnalytics then function(p1, p2)
	-- upvalues: var11 (ref), var6 (ref)
	var11(p1, var6, p2)
end else nil
local var13 = if fFlagConnectionUpsellAnalytics then function(p1, p2)
	-- upvalues: var11 (ref), var7 (ref)
	var11(p1, var7, p2)
end else nil

local function _()
	-- upvalues: corePackagesService (ref)
	local ok, status = pcall(require, corePackagesService.Workspace.Packages.AmpUpsell)
	
	return if ok then status else nil
end

local _ = function()
	-- upvalues: coreGuiService (ref)
	local ok, status = pcall(require, coreGuiService.RobloxGui.Modules.ApolloClient)
	
	return if ok then status else nil
end

local function openWizardThenReconnect(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: logTelemetry (ref), corePackagesService (ref), coreGuiService (ref)
	logTelemetry(p1, p9)
	local ok, status = pcall(require, corePackagesService.Workspace.Packages.AmpUpsell)
	local var14 = if ok then status else nil
	
	if not var14 then
		logTelemetry(p1, "AmpWizardLoadFailed")
		
		return
	end
	local ok_1, status_1 = pcall(require, coreGuiService.RobloxGui.Modules.ApolloClient)
	local var15 = if ok_1 then status_1 else nil
	
	if not var15 then
		logTelemetry(p1, "AmpWizardApolloLoadFailed")
		
		return
	elseif not pcall(function()
		-- upvalues: var14 (ref), p4 (ref), logTelemetry (copy), p1 (ref), p2 (ref), p7 (ref), p6 (ref), p8 (ref), p5 (ref), var15 (ref), p3 (ref)
		var14.InExpAmpWizardController.OpenAmpWizardContainerInExp(p4, function(p10)
			-- upvalues: var14 (copy), logTelemetry (copy), p1 (copy), p2 (copy)
			if p10 == var14.AmpEnums.AccessResponseEnum.Granted then
				logTelemetry(p1, "AmpWizardGrantedReconnect")
				p2()
				
				return
			end
			logTelemetry(p1, "AmpWizardNotGranted")
		end, p7, p6, p8, p5, var15, p3, true)
	end) then
		logTelemetry(p1, "AmpWizardOpenError")
	end
end

return {
	PrimaryButtonText = "Continue",
	PrimaryButtonLocalizationKey = "InGame.ConnectionError.Action.Continue",
	AgeVerificationRequiredEnum = var1,
	ParentalApprovalRequiredEnum = var2,
	createAgeCheckCallback = function(p1, p2, p3)
		-- upvalues: fFlagConnectionUpsellAnalytics (ref), var10 (ref), var6 (ref), openWizardThenReconnect (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref)
		local var14 = p3 + 1
		
		return function()
			-- upvalues: fFlagConnectionUpsellAnalytics (copy), var10 (copy), var6 (copy), openWizardThenReconnect (copy), p1 (ref), p2 (ref), var14 (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
			if fFlagConnectionUpsellAnalytics then
				var10(var6, game.PlaceId, "")
			end
			openWizardThenReconnect(p1, p2, var14, fStringLuaAppPlayButtonAgeCheckAmpFeatureName, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, "gameJoinAgeCheckRequired", nil, nil, "AmpAgeCheckOpened")
		end
	end,
	createParentalApprovalCallback = function(p1, p2, p3)
		-- upvalues: logTelemetry (ref), fetchUniverseIdFromPlaceIdYielding (ref), fFlagConnectionUpsellAnalytics (ref), var10 (ref), var7 (ref), openWizardThenReconnect (ref)
		local var14 = p3 + 1
		
		return function()
			-- upvalues: logTelemetry (copy), p1 (ref), fetchUniverseIdFromPlaceIdYielding (copy), fFlagConnectionUpsellAnalytics (copy), var10 (copy), var7 (copy), openWizardThenReconnect (copy), p2 (ref), var14 (ref)
			local placeId = game.PlaceId
			
			if placeId and placeId ~= 0 then
				task.spawn(function()
					-- upvalues: fetchUniverseIdFromPlaceIdYielding (copy), placeId (ref), fFlagConnectionUpsellAnalytics (copy), var10 (copy), var7 (copy), logTelemetry (copy), p1 (copy), openWizardThenReconnect (copy), p2 (copy), var14 (copy)
					local var15 = fetchUniverseIdFromPlaceIdYielding(placeId)
					
					if fFlagConnectionUpsellAnalytics then
						var10(var7, placeId, if var15 then tostring(var15) else "")
					end
					if var15 then
						openWizardThenReconnect(p1, p2, var14, "CanApproveExperience", nil, "gameJoinContentMaturityLock", {
							experienceManagementAction = "Approve",
							universeId = tostring(var15)
						}, nil, "AmpParentApprovalOpened")
						
						return
					end
					logTelemetry(p1, "AmpParentApprovalUniverseIdLookupFailed")
				end)
				
				return
			end
			logTelemetry(p1, "AmpParentApprovalMissingPlaceId")
		end
	end,
	fireImpressionAgeCheck = var12,
	fireImpressionParentalApproval = var13
}
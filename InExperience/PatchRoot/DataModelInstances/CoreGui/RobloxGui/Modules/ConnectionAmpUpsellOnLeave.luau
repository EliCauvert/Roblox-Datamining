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
local var6 = nil
local var7 = nil
pcall(function()
	-- upvalues: var6 (write), var7 (write)
	var6 = Enum.ConnectionError.PlacelaunchAgeVerificationRequired
	var7 = Enum.ConnectionError.PlacelaunchParentalApprovalRequired
end)

local function logTelemetry(p0, p1)
	-- upvalues: telemetryService (ref)
	telemetryService:LogCounter(p0, { customFields = { selectedItem = p1 } }, 1)
end

local function fetchUniverseIdFromPlaceIdYielding(p2)
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p2))
	
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

local var10 = if fFlagConnectionUpsellAnalytics then {
	eventName = "unlockPlayIntent",
	description = "Fired when a user clicks Continue on an AMP age check / parental approval upsell from a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpUnlockPlayIntentThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local var11 = if fFlagConnectionUpsellAnalytics then {
	eventName = "gameJoinUpsellImpression",
	description = "Fired when an AMP age check / parental approval upsell is shown during a game-join flow.",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ConnectionAmpGameJoinUpsellImpressionThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 11 }
} else nil
local var12 = if fFlagConnectionUpsellAnalytics then { "addSessionInfo", "addSessionId", "addOSInfo" } else nil
local var13 = if fFlagConnectionUpsellAnalytics then {
	upsellName = "AgeCheckRequired",
	playabilityStatus = "ContextualPlayabilityAgeCheckRequired",
	missingPlaceIdItem = "AmpAgeCheckMissingPlaceId",
	universeIdLookupFailedItem = "AgeCheckImpressionUniverseIdLookupFailed"
} else nil
local var14 = if fFlagConnectionUpsellAnalytics then {
	upsellName = "ParentApprovalRequired",
	playabilityStatus = "ContextualPlayabilityRequireParentApproval",
	missingPlaceIdItem = "AmpParentApprovalMissingPlaceId",
	universeIdLookupFailedItem = "ParentApprovalImpressionUniverseIdLookupFailed"
} else nil
local var15 = if fFlagConnectionUpsellAnalytics then {} else nil
local var16 = if fFlagConnectionUpsellAnalytics then function(p3, p4, p5, p6)
	-- upvalues: telemetryService (ref), var12 (ref)
	telemetryService:LogEvent(p5, {
		eventContext = p4,
		standardizedFields = var12,
		customFields = {
			universeId = p6,
			upsellName = p3.upsellName,
			playabilityStatus = p3.playabilityStatus
		}
	})
end else nil
local var17 = if fFlagConnectionUpsellAnalytics then function(p7, p8, p9)
	-- upvalues: var15 (ref), var16 (ref), var10 (ref)
	local var22 = if p9 ~= "" then p9 else var15[p8] or ""
	
	if p9 and p9 ~= "" then
		var15[p8] = p9
	end
	var16(p7, "GameJoin", var10, var22)
end else nil
local var18 = if fFlagConnectionUpsellAnalytics then function(p10, p11, p12)
	-- upvalues: logTelemetry (ref), var15 (ref), var16 (ref), var11 (ref), fetchUniverseIdFromPlaceIdYielding (ref)
	if not p12 or p12 == 0 then
		logTelemetry(p10, p11.missingPlaceIdItem)
		
		return
	end
	local var23 = var15[p12]
	
	if var23 then
		var16(p11, p11.upsellName, var11, var23)
		
		return
	end
	task.spawn(function()
		-- upvalues: fetchUniverseIdFromPlaceIdYielding (copy), p12 (ref), var15 (copy), logTelemetry (copy), p10 (ref), p11 (ref), var16 (copy), var11 (copy)
		local var24 = fetchUniverseIdFromPlaceIdYielding(p12)
		local var25 = if var24 then tostring(var24) else ""
		
		if var24 then
			var15[p12] = var25
		else
			logTelemetry(p10, p11.universeIdLookupFailedItem)
		end
		var16(p11, p11.upsellName, var11, var25)
	end)
end else nil
local var19 = if fFlagConnectionUpsellAnalytics then function(p13, p14)
	-- upvalues: var18 (ref), var13 (ref)
	var18(p13, var13, p14)
end else nil
local var20 = if fFlagConnectionUpsellAnalytics then function(p15, p16)
	-- upvalues: var18 (ref), var14 (ref)
	var18(p15, var14, p16)
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

local function openWizardThenReconnect(p17, p18, p19, p20, p21, p22, p23, p24, p25)
	-- upvalues: logTelemetry (ref), corePackagesService (ref), coreGuiService (ref)
	logTelemetry(p17, p25)
	local ok, status = pcall(require, corePackagesService.Workspace.Packages.AmpUpsell)
	local var26 = if ok then status else nil
	
	if not var26 then
		logTelemetry(p17, "AmpWizardLoadFailed")
		
		return
	end
	local ok_1, status_1 = pcall(require, coreGuiService.RobloxGui.Modules.ApolloClient)
	local var27 = if ok_1 then status_1 else nil
	
	if not var27 then
		logTelemetry(p17, "AmpWizardApolloLoadFailed")
		
		return
	elseif not pcall(function()
		-- upvalues: var26 (ref), p20 (ref), logTelemetry (copy), p17 (ref), p18 (ref), p23 (ref), p22 (ref), p24 (ref), p21 (ref), var27 (ref), p19 (ref)
		var26.InExpAmpWizardController.OpenAmpWizardContainerInExp(p20, function(p26)
			-- upvalues: var26 (copy), logTelemetry (copy), p17 (copy), p18 (copy)
			if p26 == var26.AmpEnums.AccessResponseEnum.Granted then
				logTelemetry(p17, "AmpWizardGrantedReconnect")
				p18()
				
				return
			end
			logTelemetry(p17, "AmpWizardNotGranted")
		end, p23, p22, p24, p21, var27, p19, true)
	end) then
		logTelemetry(p17, "AmpWizardOpenError")
	end
end

return {
	PrimaryButtonText = "Continue",
	PrimaryButtonLocalizationKey = "InGame.ConnectionError.Action.Continue",
	AgeVerificationRequiredEnum = var6,
	ParentalApprovalRequiredEnum = var7,
	createAgeCheckCallback = function(p27, p28, p29)
		-- upvalues: fFlagConnectionUpsellAnalytics (ref), var17 (ref), var13 (ref), openWizardThenReconnect (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref)
		local var28 = p29 + 1
		
		return function()
			-- upvalues: fFlagConnectionUpsellAnalytics (copy), var17 (copy), var13 (copy), openWizardThenReconnect (copy), p27 (ref), p28 (ref), var28 (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
			if fFlagConnectionUpsellAnalytics then
				var17(var13, game.PlaceId, "")
			end
			openWizardThenReconnect(p27, p28, var28, fStringLuaAppPlayButtonAgeCheckAmpFeatureName, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, "gameJoinAgeCheckRequired", nil, nil, "AmpAgeCheckOpened")
		end
	end,
	createParentalApprovalCallback = function(p30, p31, p32)
		-- upvalues: logTelemetry (ref), fetchUniverseIdFromPlaceIdYielding (ref), fFlagConnectionUpsellAnalytics (ref), var17 (ref), var14 (ref), openWizardThenReconnect (ref)
		local var29 = p32 + 1
		
		return function()
			-- upvalues: logTelemetry (copy), p30 (ref), fetchUniverseIdFromPlaceIdYielding (copy), fFlagConnectionUpsellAnalytics (copy), var17 (copy), var14 (copy), openWizardThenReconnect (copy), p31 (ref), var29 (ref)
			local placeId = game.PlaceId
			
			if placeId and placeId ~= 0 then
				task.spawn(function()
					-- upvalues: fetchUniverseIdFromPlaceIdYielding (copy), placeId (ref), fFlagConnectionUpsellAnalytics (copy), var17 (copy), var14 (copy), logTelemetry (copy), p30 (copy), openWizardThenReconnect (copy), p31 (copy), var29 (copy)
					local var30 = fetchUniverseIdFromPlaceIdYielding(placeId)
					
					if fFlagConnectionUpsellAnalytics then
						var17(var14, placeId, if var30 then tostring(var30) else "")
					end
					if var30 then
						openWizardThenReconnect(p30, p31, var29, "CanApproveExperience", nil, "gameJoinContentMaturityLock", {
							experienceManagementAction = "Approve",
							universeId = tostring(var30)
						}, nil, "AmpParentApprovalOpened")
						
						return
					end
					logTelemetry(p30, "AmpParentApprovalUniverseIdLookupFailed")
				end)
				
				return
			end
			logTelemetry(p30, "AmpParentApprovalMissingPlaceId")
		end
	end,
	fireImpressionAgeCheck = var19,
	fireImpressionParentalApproval = var20
}
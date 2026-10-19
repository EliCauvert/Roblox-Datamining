local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local CreateMakeupLookModule = require(AvatarExperienceCatalog.Api.CreateMakeupLook.createMakeupLook)
local Parent = AvatarExperienceCatalog.Parent
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local ToastRoduxModule = require(Parent.ToastRodux)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Constants = AvatarExperienceCommonModule.Constants
local AVATAREDITORCONSTANTS = AvatarExperienceCommonModule.Constants.AVATAR_EDITOR_CONSTANTS
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local IsMakeupOrEyebrowEyelashAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupOrEyebrowEyelashAssetType
local Constants1 = AvatarExperienceAnalyticsModule.Constants
local AVATAREDITORSERVICECOUNTERSTATUS = Constants1.AVATAR_EDITOR_SERVICE_COUNTER_STATUS
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local ReportAvatarEditorServiceCounterFunction = AvatarExperienceAnalyticsModule.reportAvatarEditorServiceCounter
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local FIntAXLookOutfitCreationDelayMs = AvatarExperienceFlagsModule.FIntAXLookOutfitCreationDelayMs
local FFlagAXMISSaveWearFix = AvatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local FFlagAXAvatarEditorServiceTelemetryV2 = AvatarExperienceFlagsModule.FFlagAXAvatarEditorServiceTelemetryV2
local FFlagAXDeprecateAvatarEditorServiceTelemetryV1 = AvatarExperienceFlagsModule.FFlagAXDeprecateAvatarEditorServiceTelemetryV1
local config = {
	toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingMakeupLook",
	isLocalized = false,
	toastType = ToastRoduxModule.Enums.ToastType.InformationMessage
}

return function(p1, Name, p2, Callback1, Callback) --[[ Line: 40 ]]
	-- upvalues: PerformFetch (copy), AVATAREDITORCONSTANTS (copy), FFlagAXMISSaveWearFix (copy), IsMakeupOrEyebrowEyelashAssetTypeFunction (copy), MutedErrorFunction (copy), PromiseModule (copy), Constants (copy), FIntAXLookOutfitCreationDelayMs (copy), FFlagAXAvatarEditorServiceTelemetryV2 (copy), ReportAvatarEditorServiceCounterFunction (copy), Constants1 (copy), AVATAREDITORSERVICECOUNTERSTATUS (copy), CreateMakeupLookModule (copy), ReportAvatarEventCounterV1Function (copy), SetCurrentToastMessageFunction (copy), config (copy), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy)
	return PerformFetch.Single(AVATAREDITORCONSTANTS.CreateMakeupLookKey, function(p3) --[[ Line: 47 ]]
		-- upvalues: FFlagAXMISSaveWearFix (upval), p2 (copy), IsMakeupOrEyebrowEyelashAssetTypeFunction (upval), MutedErrorFunction (upval), PromiseModule (upval), Callback (copy), Constants (upval), Name (copy), FIntAXLookOutfitCreationDelayMs (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants1 (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), CreateMakeupLookModule (upval), p1 (copy), Callback1 (copy), ReportAvatarEventCounterV1Function (upval), SetCurrentToastMessageFunction (upval), config (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval)
		local State = p3:getState()
		local AvatarScales = State.AvatarExperience.AvatarEditor.Character.AvatarScales
		local AvatarType = State.AvatarExperience.AvatarEditor.Character.AvatarType
		local EquippedAssets = if FFlagAXMISSaveWearFix then State.AvatarExperience.AvatarEditor.Character.EquippedAssets else nil
		local BodyColor3s = {}
		
		for i, bodyColor3 in State.AvatarExperience.AvatarEditor.Character.BodyColor3s do
			BodyColor3s[i] = bodyColor3:ToHex()
		end
		local List = {}
		
		for _, value in p2 do
			if value.itemSubType and IsMakeupOrEyebrowEyelashAssetTypeFunction(value.itemSubType) and value.selectedInTryOnManager then
				table.insert(List, {
					id = tonumber(value.itemId),
					meta = { order = value.order, version = tonumber(value.version) }
				})
			end
		end
		if #List == 0 then
			MutedErrorFunction("SaveAsMakeupLookThunk: No valid makeup assets to save")
			
			return PromiseModule.resolve()
		end
		if FFlagAXMISSaveWearFix and Callback then
			local CallbackResult = Callback(State, p2)
			local Orders = {}
			
			if CallbackResult then
				for _, MakeupDescription in CallbackResult:GetChildren() do
					if MakeupDescription:IsA("MakeupDescription") then
						Orders[tostring(MakeupDescription.assetId)] = MakeupDescription.order
					end
				end
			end
			for i1, _ in Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
				if EquippedAssets and EquippedAssets[i1] then
					for Id, value1 in EquippedAssets[i1] do
						if Orders[Id] ~= nil then
							table.insert(List, {
								id = Id,
								meta = { order = Orders[Id], version = tonumber(value1.version) }
							})
						end
					end
				end
			end
		end
		local config1 = {
			outfitType = "Makeup",
			name = Name,
			bodyColor3s = BodyColor3s,
			assets = List,
			scale = AvatarScales,
			playerAvatarType = AvatarType
		}
		task.spawn(function() --[[ Line: 122 ]]
			-- upvalues: FIntAXLookOutfitCreationDelayMs (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants1 (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), CreateMakeupLookModule (upval), p1 (upval), config1 (copy), Callback1 (upval), ReportAvatarEventCounterV1Function (upval), p3 (copy), SetCurrentToastMessageFunction (upval), config (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval)
			task.wait(FIntAXLookOutfitCreationDelayMs / 1000)
			
			if FFlagAXAvatarEditorServiceTelemetryV2 then
				ReportAvatarEditorServiceCounterFunction(Constants1.AVATAR_EDITOR_SERVICE_EVENTS.CreateMakeupLook, AVATAREDITORSERVICECOUNTERSTATUS.Request)
			end
			local MakeupLookModule, _ = CreateMakeupLookModule(p1, config1)
			
			return MakeupLookModule:andThen(function(_) --[[ Line: 134 ]]
				-- upvalues: FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), Constants1 (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval), Callback1 (upval), ReportAvatarEventCounterV1Function (upval)
				if FFlagAXAvatarEditorServiceTelemetryV2 then
					ReportAvatarEditorServiceCounterFunction(Constants1.AVATAR_EDITOR_SERVICE_EVENTS.CreateMakeupLook, AVATAREDITORSERVICECOUNTERSTATUS.Success)
				end
				if Callback1 then
					Callback1()
				end
				ReportAvatarEventCounterV1Function(Constants1.AVATAR_EVENT_COUNTER_NAME.AXCreateMakeupLook)
			end):catch(function(Err) --[[ Line: 147 ]]
				-- upvalues: p3 (upval), SetCurrentToastMessageFunction (upval), config (upval), FFlagAXDeprecateAvatarEditorServiceTelemetryV1 (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), Constants1 (upval), FFlagAXAvatarEditorServiceTelemetryV2 (upval), ReportAvatarEditorServiceCounterFunction (upval), AVATAREDITORSERVICECOUNTERSTATUS (upval)
				warn("Failed to create makeup look", Err)
				p3:dispatch(SetCurrentToastMessageFunction(config))
				
				if not FFlagAXDeprecateAvatarEditorServiceTelemetryV1 then
					ReportAvatarEventCounterNoAnalyticsArgumentFunction(Constants1.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit)
				end
				if FFlagAXAvatarEditorServiceTelemetryV2 then
					ReportAvatarEditorServiceCounterFunction(Constants1.AVATAR_EDITOR_SERVICE_EVENTS.CreateMakeupLook, AVATAREDITORSERVICECOUNTERSTATUS.Error, if typeof(Err) == "table" and typeof(Err.HttpError) == "EnumItem" then Err.HttpError else nil)
				end
			end)
		end)
		
		return PromiseModule.resolve()
	end)
end
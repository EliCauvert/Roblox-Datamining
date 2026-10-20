local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local OutfitInfoModule = require(Modules.AvatarExperience.AvatarEditor.Models.OutfitInfo)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local OutfitInformationReceivedModule = require(Modules.AvatarExperience.Common.Actions.OutfitInformationReceived)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local AXSilenceCombineGetOutfitDispatchesMutedError2 = game:DefineFastFlag("AXSilenceCombineGetOutfitDispatchesMutedError2", false)
local AXCombineGetOutfitDispatchesChunkSize = game:DefineFastInt("AXCombineGetOutfitDispatchesChunkSize", 3)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)

local function _(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromOutfitDetails then AssetInfo.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false
end

local function getOutfit(p1, p2, OutfitId, p3)
	-- upvalues: PromiseModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), WebApiModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), UtilsModule (copy), OutfitInfoModule (copy)
	local AvatarEditorService = p2.avatarEditorService
	local State = p1:getState()
	
	return if State.AvatarExperience.AvatarEditor.OutfitInfos[OutfitId] then PromiseModule.resolve() else PromiseModule.new(function(Callback1: (any) -> (), Callback)
		-- upvalues: FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p3 (copy), AvatarEditorService (copy), OutfitId (copy), WebApiModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), UtilsModule (upval), State (copy), OutfitInfoModule (upval)
		local FFlagAXModeratedItemsFlow1 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
		local Success, Result = pcall(function()
			-- upvalues: FFlagAXModeratedItemsFlow1 (copy), p3 (upval), AvatarEditorService (upval), OutfitId (upval), WebApiModule (upval), Callback (copy)
			if not FFlagAXModeratedItemsFlow1 or not p3 then
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetOutfitDetailsAsync(tonumber(OutfitId) or 0) else AvatarEditorService:GetOutfitDetails(tonumber(OutfitId) or 0)
			end
			local v1, v2 = WebApiModule.GetOutfit(p3, OutfitId, { checkAssetAvailability = true }):await()
			
			if not v1 then
				Callback(`AvatarEditorWebApi failure in GetOutfit: {tostring(v2)}`)
			end
			return v2[1]
		end)
		
		if Success then
			local TableToCamelCaseKeysResult = UtilsModule.tableToCamelCaseKeys(Result)
			
			if not TableToCamelCaseKeysResult then
				return Callback("AvatarEditorService returned no data for GetOutfitDetails")
			end
			if not FFlagAXModeratedItemsFlow1 or not p3 then
				TableToCamelCaseKeysResult.bodyColor3s = {}
				
				if TableToCamelCaseKeysResult.bodyColors then
					for i, bodyColor in TableToCamelCaseKeysResult.bodyColors do
						TableToCamelCaseKeysResult.bodyColor3s[`{i}3`] = bodyColor:ToHex()
					end
					TableToCamelCaseKeysResult.bodyColors = nil
				end
			end
			local AssetsToUpdate = {}
			
			if TableToCamelCaseKeysResult.assets then
				for i1, asset in TableToCamelCaseKeysResult.assets do
					local AssetInfo = State.AvatarExperience.Common.AssetInfos[i1]
					
					if not (if AssetInfo and AssetInfo.receivedFromOutfitDetails then AssetInfo.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false) then
						AssetsToUpdate[#AssetsToUpdate + 1] = asset
					end
				end
			end
			local FromWebApiResult = OutfitInfoModule.fromWebApi(OutfitId, nil, TableToCamelCaseKeysResult)
			Callback1({
				outfitId = OutfitId,
				outfitInfo = FromWebApiResult,
				assetsToUpdate = AssetsToUpdate,
				moderationStatus = FromWebApiResult.moderationStatus
			})
			
			return
		else
			if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
				ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.GetOutfitDetails)
			end
			return Callback(`AvatarEditorService failure in GetOutfitDetails: {tostring(Result)}`)
		end
	end)
end

local _ = function(p4, p5)
	-- upvalues: AXSilenceCombineGetOutfitDispatchesMutedError2 (copy), MutedErrorModule (copy)
	if not AXSilenceCombineGetOutfitDispatchesMutedError2 then
		MutedErrorModule(`[AvatarExperience] Error fetching outfit details for ID {p4}. Reason: {tostring(p5)}`)
	end
	return nil
end

local function processPromises(p6, p7)
	-- upvalues: PromiseModule (copy), OutfitInformationReceivedModule (copy)
	return PromiseModule.allSettled(p7):andThen(function(Result)
		-- upvalues: PromiseModule (upval), p7 (copy), p6 (copy), OutfitInformationReceivedModule (upval)
		local t = {}
		
		for i, Resolved in Result do
			if Resolved == PromiseModule.Status.Resolved then
				local v1 = p7[i]:expect()
				
				if Resolved == PromiseModule.Status.Resolved and v1 then
					t[v1.outfitId] = v1
				end
			end
		end
		if next(t) then
			p6:dispatch(OutfitInformationReceivedModule(t))
		end
	end)
end

local function splitTableIntoChunks(p8, AXCombineGetOutfitDispatchesChunkSize: number)
	local List = {}
	
	for i = 1, #p8, AXCombineGetOutfitDispatchesChunkSize do
		local t = {}
		table.move(p8, i, math.min(i + AXCombineGetOutfitDispatchesChunkSize - 1, #p8), 1, t)
		table.insert(List, t)
	end
	return List
end

return function(p9, p10)
	-- upvalues: getOutfit (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), AXSilenceCombineGetOutfitDispatchesMutedError2 (copy), MutedErrorModule (copy), splitTableIntoChunks (copy), AXCombineGetOutfitDispatchesChunkSize (copy), PromiseModule (copy), processPromises (copy)
	return function(p11, p12)
		-- upvalues: p9 (copy), getOutfit (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p10 (copy), AXSilenceCombineGetOutfitDispatchesMutedError2 (upval), MutedErrorModule (upval), splitTableIntoChunks (upval), AXCombineGetOutfitDispatchesChunkSize (upval), PromiseModule (upval), processPromises (upval)
		local List = {}
		
		for _, value in p9 do
			table.insert(List, (getOutfit(p11, p12, value, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p10 else nil):catch(function(Err)
				-- upvalues: value (copy), AXSilenceCombineGetOutfitDispatchesMutedError2 (upval), MutedErrorModule (upval)
				if not AXSilenceCombineGetOutfitDispatchesMutedError2 then
					MutedErrorModule(`[AvatarExperience] Error fetching outfit details for ID {value}. Reason: {tostring(Err)}`)
				end
				return nil
			end)))
		end
		local ResolveResult = PromiseModule.resolve()
		
		for _, value1 in splitTableIntoChunks(List, AXCombineGetOutfitDispatchesChunkSize) do
			ResolveResult = ResolveResult:andThen(function()
				-- upvalues: processPromises (upval), p11 (copy), value1 (copy)
				return processPromises(p11, value1)
			end)
		end
		return ResolveResult
	end
end
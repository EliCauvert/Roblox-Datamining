local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local SetOutfitInfoModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo)
local OutfitInfoModule = require(Modules.AvatarExperience.AvatarEditor.Models.OutfitInfo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SetAssetInfoFromOutfitDetailsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails)
local ReceivedBundleInfoForTryOnFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ReceivedBundleInfoForTryOn
local UpdateSortOrderDueToLCBundleLoadedModule = require(Modules.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SetOutfitOrAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local AXSilenceGetOutfitMutedError = game:DefineFastFlag("AXSilenceGetOutfitMutedError", false)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXEnableExpiredUserLookCheckout = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableExpiredUserLookCheckout
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)

local function _(p1): string
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.OutfitInfoKey .. tostring(p1)
end

local _ = function(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromOutfitDetails then AssetInfo.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), FFlagAXEnableExpiredUserLookCheckout (copy), PromiseModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), WebApiModule (copy), UtilsModule (copy), OutfitInfoModule (copy), SetAssetInfoFromOutfitDetailsModule (copy), SetOutfitInfoModule (copy), SetOutfitOrAssetModule (copy), ConstantsModule1 (copy), ReceivedBundleInfoForTryOnFunction (copy), UpdateSortOrderDueToLCBundleLoadedModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule2 (copy), Logging (copy), AXSilenceGetOutfitMutedError (copy), MutedErrorModule (copy)
	ArgCheckModule.isType(p1, "string", "GetOutfit thunk expects outfitId to be a string")
	ArgCheckModule.isTypeOrNil(p5, "boolean", "GetOutfit thunk expects forceRefresh to be a boolean or nil")
	
	return function(p6, p7)
		-- upvalues: PerformFetch (upval), p1 (copy), ConstantsModule (upval), FFlagAXEnableExpiredUserLookCheckout (upval), p5 (copy), PromiseModule (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p4 (copy), WebApiModule (upval), UtilsModule (upval), OutfitInfoModule (upval), p2 (copy), SetAssetInfoFromOutfitDetailsModule (upval), SetOutfitInfoModule (upval), SetOutfitOrAssetModule (upval), ConstantsModule1 (upval), p3 (copy), ReceivedBundleInfoForTryOnFunction (upval), UpdateSortOrderDueToLCBundleLoadedModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule2 (upval), Logging (upval), AXSilenceGetOutfitMutedError (upval), MutedErrorModule (upval)
		local AvatarEditorService = p7.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule.OutfitInfoKey .. tostring(p1), function(p8)
			-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), p5 (upval), p1 (upval), PromiseModule (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p4 (upval), AvatarEditorService (copy), WebApiModule (upval), UtilsModule (upval), OutfitInfoModule (upval), p2 (upval), SetAssetInfoFromOutfitDetailsModule (upval), SetOutfitInfoModule (upval), SetOutfitOrAssetModule (upval), ConstantsModule1 (upval), p3 (upval), ReceivedBundleInfoForTryOnFunction (upval), UpdateSortOrderDueToLCBundleLoadedModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule2 (upval), Logging (upval), AXSilenceGetOutfitMutedError (upval), MutedErrorModule (upval)
			local State = p8:getState()
			local P7 = FFlagAXEnableExpiredUserLookCheckout and p5
			
			return if P7 or not State.AvatarExperience.AvatarEditor.OutfitInfos[p1] then PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p4 (upval), AvatarEditorService (upval), p1 (upval), WebApiModule (upval), UtilsModule (upval), OutfitInfoModule (upval), p2 (upval), State (copy), p8 (copy), SetAssetInfoFromOutfitDetailsModule (upval), SetOutfitInfoModule (upval), SetOutfitOrAssetModule (upval), ConstantsModule1 (upval), p3 (upval), ReceivedBundleInfoForTryOnFunction (upval), UpdateSortOrderDueToLCBundleLoadedModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule2 (upval), Logging (upval), AXSilenceGetOutfitMutedError (upval), MutedErrorModule (upval)
				local FFlagAXModeratedItemsFlow1 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
				local Success, Result = pcall(function()
					-- upvalues: FFlagAXModeratedItemsFlow1 (copy), p4 (upval), AvatarEditorService (upval), p1 (upval), WebApiModule (upval), Callback1 (copy)
					if FFlagAXModeratedItemsFlow1 and p4 then
						local v1, v2 = WebApiModule.GetOutfit(p4, p1, { checkAssetAvailability = true }):await()
						
						return if v1 then v2[1] else Callback1(`AvatarEditorWebApi failure in GetOutfit: {tostring(v2)}`)
					else
						return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetOutfitDetailsAsync(tonumber(p1) or 0) else AvatarEditorService:GetOutfitDetails(tonumber(p1) or 0)
					end
				end)
				
				if Success then
					local TableToCamelCaseKeysResult = UtilsModule.tableToCamelCaseKeys(Result)
					
					if TableToCamelCaseKeysResult then
						if not FFlagAXModeratedItemsFlow1 or not p4 then
							TableToCamelCaseKeysResult.bodyColor3s = {}
							
							if TableToCamelCaseKeysResult.bodyColors then
								for i, bodyColor in TableToCamelCaseKeysResult.bodyColors do
									TableToCamelCaseKeysResult.bodyColor3s[i .. "3"] = bodyColor:ToHex()
								end
								TableToCamelCaseKeysResult.bodyColors = nil
							end
						end
						local t = {}
						local Assets = TableToCamelCaseKeysResult.assets
						local t1 = {}
						local FromWebApiResult = OutfitInfoModule.fromWebApi(p1, p2, TableToCamelCaseKeysResult)
						
						if Assets then
							for _, asset in Assets do
								local Text = tostring(asset.assetType.id)
								local Text1 = tostring(asset.id)
								t[Text] = t[Text] or {}
								table.insert(t[Text], Text1)
								local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text1]
								
								if not (if AssetInfo and AssetInfo.receivedFromOutfitDetails then AssetInfo.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false) then
									t1[#t1 + 1] = asset
								end
							end
						end
						if #t1 > 0 then
							p8:dispatch(SetAssetInfoFromOutfitDetailsModule(t1, FromWebApiResult.moderationStatus))
						end
						p8:dispatch(SetOutfitInfoModule(FromWebApiResult))
						local OutfitOrAsset = State.AvatarExperience.AvatarEditor.Character.OutfitOrAsset
						
						if OutfitOrAsset and not OutfitOrAsset[p1] then
							p8:dispatch(SetOutfitOrAssetModule({ (tostring(p1)) }, ConstantsModule1.OutfitOrAsset.Outfit))
						end
						if p3 then
							p8:dispatch(ReceivedBundleInfoForTryOnFunction(p3, (tostring(p1))))
							p8:dispatch(UpdateSortOrderDueToLCBundleLoadedModule(p3))
						end
					end
					Callback(Result)
					
					return
				else
					if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
						ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule2.Counter.AvatarEditorServiceErrors.GetOutfitDetails)
					end
					Logging.warn("AvatarEditorService failure in GetOutfitDetails for id " .. p1)
					
					if not AXSilenceGetOutfitMutedError then
						MutedErrorModule(`[AvatarExperience] Error fetching outfit details for ID {p1}. Reason: {tostring(Result)}`)
					end
					Callback1(`AvatarEditorService failure in GetOutfitDetails for outfit ID {p1}: {tostring(Result)}`)
				end
			end) else PromiseModule.resolve()
		end)(p6)
	end
end
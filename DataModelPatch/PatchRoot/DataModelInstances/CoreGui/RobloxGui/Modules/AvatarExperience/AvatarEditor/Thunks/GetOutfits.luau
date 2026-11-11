local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local BatchGetOutfitsModule = require(Modules.AvatarExperience.Common.Thunks.BatchGetOutfits)
local SetOwnedItemIdsBySubtypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetOutfitOrAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local SetPageFinishedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local AXCombineGetOutfitDispatchesIXPModule = require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlagsModule.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXTTIEditorEnableMilestones = AvatarExperienceFlagsModule.FFlagAXTTIEditorEnableMilestones
local EditorInventoryTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).EditorInventoryTTIMilestoneManager

local function _(Text, p1, p2): string
	return Text .. "." .. tostring(p1) .. tostring(p2)
end

local function v28(Text, OutfitSource, p1, Pages, p2, Callback: (any) -> (), p3, OutfitType, p4, p5)
	-- upvalues: UtilsModule (copy), AXCombineGetOutfitDispatchesIXPModule (copy), IxpUtilsModule (copy), GetOutfitModule (copy), FFlagAXInventoryDurablesSupport (copy), ConstantsModule (copy), SetPageFinishedModule (copy), BatchGetOutfitsModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), SetOutfitOrAssetModule (copy), SetOwnedItemIdsBySubtypeModule (copy)
	local t = {}
	local List = {}
	
	for _, value in UtilsModule.tableToCamelCaseKeys((Pages:GetCurrentPage())) do
		local Text1 = tostring(value.id)
		t[#t + 1] = Text1
		local State = p1:getState()
		
		if p5 or State.AvatarExperience.AvatarEditor.OutfitInfos[Text1] == nil then
			if p5 or not AXCombineGetOutfitDispatchesIXPModule.isEnabled() or not IxpUtilsModule.readTestVariable(AXCombineGetOutfitDispatchesIXPModule.EnabledForUser) then
				p1:dispatch(GetOutfitModule(Text1, nil, nil, if FFlagAXInventoryDurablesSupport then p4 else nil, p5))
			else
				table.insert(List, Text1)
			end
		end
	end
	local ReachedLastPage = nil
	
	if Pages.IsFinished then
		ReachedLastPage = ConstantsModule.ReachedLastPage
		p1:dispatch(SetPageFinishedModule(p3 or Text, Pages.IsFinished))
	end
	p2:storePageObject(Text .. "." .. tostring(OutfitSource) .. tostring(OutfitType), Pages)
	
	if AXCombineGetOutfitDispatchesIXPModule.isEnabled() and IxpUtilsModule.readTestVariable(AXCombineGetOutfitDispatchesIXPModule.EnabledForUser) then
		p1:dispatch(BatchGetOutfitsModule(List, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p4 else nil))
	end
	p1:dispatch(SetOutfitOrAssetModule(t, ConstantsModule.OutfitOrAsset.Outfit))
	p1:dispatch(SetOwnedItemIdsBySubtypeModule(Text, t))
	Callback(ReachedLastPage)
end

local function advancePage(p6, p7, p8, Callback: (any) -> (), Pages, PageObjectManager, All, p9, Avatar, p10, p11)
	-- upvalues: v28 (copy), Logging (copy)
	local Success, Result = pcall(function()
		-- upvalues: Pages (copy)
		Pages:AdvanceToNextPageAsync()
	end)
	
	if Success then
		v28(p6, All, p7, Pages, PageObjectManager, p8, p9, Avatar, p10, p11)
		
		return
	else
		Logging.warn("GetOutfits failure: " .. Result)
		Callback(Result)
	end
end

local function fetchInitialPage(p6, p7, p8, Callback: (any) -> (), PageObjectManager, All, AvatarEditorService, p9, Avatar, p10, p11, p12)
	-- upvalues: FFlagAXTTIEditorEnableMilestones (copy), EditorInventoryTTIMilestoneManager (copy), v28 (copy), Logging (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule2 (copy)
	local SessionGeneration = nil
	
	if FFlagAXTTIEditorEnableMilestones and p12 and EditorInventoryTTIMilestoneManager then
		SessionGeneration = EditorInventoryTTIMilestoneManager.getSessionGeneration()
		EditorInventoryTTIMilestoneManager.L3.getOutfitsStarted()
	end
	local Success, Result = pcall(function()
		-- upvalues: AvatarEditorService (copy), All (copy), Avatar (copy)
		return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetOutfitsAsync(All, Avatar) else AvatarEditorService:GetOutfits(All, Avatar)
	end)
	
	if Success then
		if FFlagAXTTIEditorEnableMilestones and p12 and EditorInventoryTTIMilestoneManager and SessionGeneration == EditorInventoryTTIMilestoneManager.getSessionGeneration() then
			EditorInventoryTTIMilestoneManager.L3.getOutfitsCompleted()
		end
		v28(p6, All, p7, Result, PageObjectManager, p8, p9, Avatar, p10, p11)
		
		return
	else
		Logging.warn("GetOutfits failure: " .. Result)
		
		if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule2.Counter.AvatarEditorServiceErrors.GetOutfits)
		end
		Callback(Result)
	end
end

return function(p6, p7, p8, Avatar, p9, p10, p11, p12)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule1 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), PromiseModule (copy), ConstantsModule (copy), advancePage (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), fetchInitialPage (copy), FFlagAXTTIEditorEnableMilestones (copy)
	ArgCheckModule.isTypeOrNil(p7, "boolean", "GetOutfits thunk expects onlyEditableOutfits to be a boolean or nil")
	ArgCheckModule.isTypeOrNil(Avatar, "string", "GetOutfits thunk expects outfitType to be a string or nil")
	ArgCheckModule.isTypeOrNil(p10, "boolean", "GetOutfits thunk expects forceInitialPage to be a boolean or nil")
	ArgCheckModule.isTypeOrNil(p11, "boolean", "GetOutfits thunk expects forceRefresh to be a boolean or nil")
	ArgCheckModule.isTypeOrNil(p12, "boolean", "GetOutfits thunk expects trackTTI to be a boolean or nil")
	local P35 = p8 or p6
	
	return function(p13, p14)
		-- upvalues: PerformFetch (upval), ConstantsModule1 (upval), P35 (copy), p7 (copy), Avatar (copy), p6 (copy), FFlagAXEnableExpiredUserLookCheckout (upval), p10 (copy), PromiseModule (upval), ConstantsModule (upval), advancePage (upval), p8 (copy), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p9 (copy), p11 (copy), fetchInitialPage (upval), FFlagAXTTIEditorEnableMilestones (upval), p12 (copy)
		local PageObjectManager = p14.pageObjectManager
		local AvatarEditorService = p14.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule1.OutfitsKey .. P35, function(p15)
			-- upvalues: p7 (upval), Avatar (upval), ConstantsModule1 (upval), p6 (upval), FFlagAXEnableExpiredUserLookCheckout (upval), p10 (upval), PageObjectManager (copy), PromiseModule (upval), ConstantsModule (upval), advancePage (upval), p8 (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p9 (upval), p11 (upval), fetchInitialPage (upval), AvatarEditorService (copy), FFlagAXTTIEditorEnableMilestones (upval), p12 (upval)
			local All = nil
			All = if p7 == nil then Enum.OutfitSource.All elseif p7 then Enum.OutfitSource.Created else Enum.OutfitSource.Purchased
			local Avatar1 = if Avatar == ConstantsModule1.OutfitTypes.Avatar then Enum.OutfitType.Avatar elseif Avatar == ConstantsModule1.OutfitTypes.DynamicHead then Enum.OutfitType.DynamicHead elseif Avatar == ConstantsModule1.OutfitTypes.Makeup then Enum.OutfitType.All else Enum.OutfitType.All
			local Text = p6 .. "." .. tostring(All) .. tostring(Avatar1)
			local PageObject = if FFlagAXEnableExpiredUserLookCheckout and p10 then nil else PageObjectManager:getPageObject(Text)
			
			return if PageObject and PageObject.IsFinished then PromiseModule.resolve(ConstantsModule.ReachedLastPage) else PromiseModule.new(function(p16, p17)
				-- upvalues: PageObject (copy), advancePage (upval), p6 (upval), p15 (copy), PageObjectManager (upval), All (ref), p8 (upval), Avatar1 (ref), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), p9 (upval), p11 (upval), fetchInitialPage (upval), AvatarEditorService (upval), FFlagAXTTIEditorEnableMilestones (upval), p12 (upval)
				if PageObject == nil then
					fetchInitialPage(p6, p15, p16, p17, PageObjectManager, All, AvatarEditorService, p8, Avatar1, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p9 else nil, p11, if FFlagAXTTIEditorEnableMilestones then p12 else nil)
					
					return
				else
					advancePage(p6, p15, p16, p17, PageObject, PageObjectManager, All, p8, Avatar1, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p9 else nil, p11)
				end
			end)
		end)(p13)
	end
end
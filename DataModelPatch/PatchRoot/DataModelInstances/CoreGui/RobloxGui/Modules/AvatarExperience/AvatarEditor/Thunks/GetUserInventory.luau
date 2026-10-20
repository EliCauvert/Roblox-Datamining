local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetOwnedItemIdsBySubtypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetPageFinishedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local SetAssetInfoFromInventoryFetchModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

local function _(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromInventoryFetch then true else false
end

local function v18(p1, p2, Pages, p3, Callback: (any) -> (), p4)
	-- upvalues: UtilsModule (copy), SetAssetInfoFromInventoryFetchModule (copy), SetPageFinishedModule (copy), SetOwnedItemIdsBySubtypeModule (copy), ConstantsModule (copy)
	local State = p2:getState()
	local t = {}
	local t1 = {}
	
	for _, value in UtilsModule.tableToCamelCaseKeys((Pages:GetCurrentPage())) do
		local Text = tostring(value.assetId)
		t1[#t1 + 1] = Text
		local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text]
		
		if not (if AssetInfo and AssetInfo.receivedFromInventoryFetch then true else false) then
			t[#t + 1] = value
		end
	end
	if #t > 0 then
		p2:dispatch(SetAssetInfoFromInventoryFetchModule(t))
	end
	p2:dispatch(SetPageFinishedModule(p1, Pages.IsFinished))
	p3:storePageObject(p1, Pages)
	p2:dispatch(SetOwnedItemIdsBySubtypeModule(p4 or p1, t1))
	Callback(if Pages.IsFinished then ConstantsModule.ReachedLastPage else nil)
end

local function advancePage(p5, p6, Pages, PageObjectManager, p7, Callback: () -> (), p8)
	-- upvalues: v18 (copy), Logging (copy)
	local Success, Result = pcall(function()
		-- upvalues: Pages (copy)
		Pages:AdvanceToNextPageAsync()
	end)
	
	if Success then
		v18(p5, p6, Pages, PageObjectManager, p7, p8)
		
		return
	else
		Logging.warn("GetUserInventory failure: " .. Result)
		Callback()
	end
end

local function fetchInitialPage(p5, p6, p7, PageObjectManager, AvatarEditorService, p8, Callback: () -> (), p9)
	-- upvalues: UtilsModule (copy), v18 (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule2 (copy), Logging (copy)
	local Success, Result = pcall(function()
		-- upvalues: p6 (copy), UtilsModule (upval), AvatarEditorService (copy)
		local AssetTypeIdStringToEnumValueResults = {}
		
		for _, value in p6 do
			table.insert(AssetTypeIdStringToEnumValueResults, (UtilsModule.AssetTypeIdStringToEnumValue(value)))
		end
		return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetInventoryAsync(AssetTypeIdStringToEnumValueResults) else AvatarEditorService:GetInventory(AssetTypeIdStringToEnumValueResults)
	end)
	
	if Success then
		v18(p5, p7, Result, PageObjectManager, p8, p9)
		
		return
	end
	if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
		ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule2.Counter.AvatarEditorServiceErrors.GetInventory)
	end
	Logging.warn("GetUserInventory failure: " .. Result)
	Callback()
end

return function(p10, p11, p12)
	-- upvalues: ArgCheckModule (copy), UtilsModule1 (copy), PromiseModule (copy), PerformFetch (copy), ConstantsModule1 (copy), ConstantsModule (copy), fetchInitialPage (copy), advancePage (copy)
	ArgCheckModule.isType(p10, "table", "GetUserInventory thunk expects categoryInfo to be a table")
	
	return function(p13, p14)
		-- upvalues: UtilsModule1 (upval), p10 (copy), PromiseModule (upval), p11 (copy), PerformFetch (upval), ConstantsModule1 (upval), ConstantsModule (upval), fetchInitialPage (upval), p12 (copy), advancePage (upval)
		local PageObjectManager = p14.pageObjectManager
		local AvatarEditorService = p14.avatarEditorService
		local SearchUuidAndAssetTypes, SearchUuidAndAssetTypes2 = UtilsModule1.getSearchUuidAndAssetTypes(p10, p13:getState().AvatarExperience.AvatarEditor.Categories.subButton)
		
		if SearchUuidAndAssetTypes then
			local P21 = p11 or SearchUuidAndAssetTypes
			
			return PerformFetch.Single(ConstantsModule1.UserInventoryKey .. P21, function(p15)
				-- upvalues: PageObjectManager (copy), P21 (ref), PromiseModule (upval), ConstantsModule (upval), fetchInitialPage (upval), SearchUuidAndAssetTypes2 (copy), AvatarEditorService (copy), p12 (upval), advancePage (upval)
				local PageObject = PageObjectManager:getPageObject(P21)
				
				return if PageObject and PageObject.IsFinished then PromiseModule.resolve(ConstantsModule.ReachedLastPage) else PromiseModule.new(function(p16, p17)
					-- upvalues: PageObject (copy), fetchInitialPage (upval), P21 (upval), SearchUuidAndAssetTypes2 (upval), p15 (copy), PageObjectManager (upval), AvatarEditorService (upval), p12 (upval), advancePage (upval)
					if PageObject == nil then
						fetchInitialPage(P21, SearchUuidAndAssetTypes2, p15, PageObjectManager, AvatarEditorService, p16, p17, p12)
						
						return
					else
						advancePage(P21, p15, PageObject, PageObjectManager, p16, p17, p12)
					end
				end)
			end)(p13)
		else
			return PromiseModule.resolve("No SearchUuid")
		end
	end
end
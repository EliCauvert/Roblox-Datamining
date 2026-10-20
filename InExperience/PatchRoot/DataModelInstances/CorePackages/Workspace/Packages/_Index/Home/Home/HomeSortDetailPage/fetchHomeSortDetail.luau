local Home = script:FindFirstAncestor("Home")
local SduiSharedUtilitiesModule = require(Home.Parent.SduiSharedUtilities)
local BuildHomeSortDetailPageEntryModule = require(Home.HomeSortDetailPage.buildHomeSortDetailPageEntry)
local GetHomeSortDetailPageKeyModule = require(Home.HomeSortDetailPage.getHomeSortDetailPageKey)
local HomeSortDetailConstantsModule = require(Home.HomeSortDetailPage.HomeSortDetailConstants)

return function(p1, p2, LoadTimer)
	-- upvalues: GetHomeSortDetailPageKeyModule (copy), BuildHomeSortDetailPageEntryModule (copy), SduiSharedUtilitiesModule (copy), HomeSortDetailConstantsModule (copy)
	local HomeSortDetailPageKeyModule = GetHomeSortDetailPageKeyModule(p1, p2)
	local HomeSortDetailPageEntryModule = BuildHomeSortDetailPageEntryModule(p1, p2)
	
	if HomeSortDetailPageEntryModule == nil then
		return nil, HomeSortDetailPageKeyModule
	end
	local CreateTemplateApiRequestConfigFunction = SduiSharedUtilitiesModule.createTemplateApiRequestConfig
	
	if CreateTemplateApiRequestConfigFunction == nil then
		return nil, HomeSortDetailPageKeyModule
	end
	local TemplateApiRequestConfig = CreateTemplateApiRequestConfigFunction({
		surfaceKey = HomeSortDetailConstantsModule.SurfaceKey,
		configKey = HomeSortDetailPageKeyModule,
		loadTimer = LoadTimer,
		pageEntries = { HomeSortDetailPageEntryModule }
	})
	
	if TemplateApiRequestConfig == nil then
		return nil, HomeSortDetailPageKeyModule
	else
		return SduiSharedUtilitiesModule.getSduiApiStore().fetchIfNeeded(TemplateApiRequestConfig), HomeSortDetailPageKeyModule
	end
end
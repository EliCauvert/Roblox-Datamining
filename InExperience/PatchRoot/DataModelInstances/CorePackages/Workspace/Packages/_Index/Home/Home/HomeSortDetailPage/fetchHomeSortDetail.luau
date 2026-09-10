local home = script:FindFirstAncestor("Home")
local sduiSharedUtilitiesModule = require(home.Parent.SduiSharedUtilities)
local buildHomeSortDetailPageEntryModule = require(home.HomeSortDetailPage.buildHomeSortDetailPageEntry)
local getHomeSortDetailPageKeyModule = require(home.HomeSortDetailPage.getHomeSortDetailPageKey)
local homeSortDetailConstantsModule = require(home.HomeSortDetailPage.HomeSortDetailConstants)

return function(p1, p2, p3)
	-- upvalues: getHomeSortDetailPageKeyModule (ref), buildHomeSortDetailPageEntryModule (ref), sduiSharedUtilitiesModule (ref), homeSortDetailConstantsModule (ref)
	local var1 = getHomeSortDetailPageKeyModule(p1, p2)
	local var2 = buildHomeSortDetailPageEntryModule(p1, p2)
	
	if var2 == nil then
		return nil, var1
	end
	local createTemplateApiRequestConfig = sduiSharedUtilitiesModule.createTemplateApiRequestConfig
	
	if createTemplateApiRequestConfig == nil then
		return nil, var1
	end
	local var3 = createTemplateApiRequestConfig({
		surfaceKey = homeSortDetailConstantsModule.SurfaceKey,
		configKey = var1,
		loadTimer = p3,
		pageEntries = { var2 }
	})
	
	if var3 == nil then
		return nil, var1
	end
	return sduiSharedUtilitiesModule.getSduiApiStore().fetchIfNeeded(var3), var1
end
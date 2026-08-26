local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local AXUnifiedEventFilter = avatarExperienceAnalyticsModule.AXUnifiedEventFilter
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local sendUnifiedEventLog = avatarExperienceAnalyticsModule.sendUnifiedEventLog
local unifiedEventLoggingUtils = avatarExperienceAnalyticsModule.Utils.UnifiedEventLoggingUtils
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local findCollectionItemInstancesModule = require(serverDrivenUi.Analytics.findCollectionItemInstances)
local t = {}
local marketplaceUnifiedAction = unifiedEventLogEnums.MarketplaceUnifiedAction
local marketplaceUnifiedItemType = unifiedEventLogEnums.MarketplaceUnifiedItemType

local function _(p1, p2)
	if p2 and p2 > 0 then
		return math.ceil(p1 / p2), (p1 - 1) % p2 + 1
	end
	return 1, p1
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref), sduiLogger (ref), sduiErrors (ref), findAnalyticsFieldInAncestors (ref), unifiedLoggingSurface (ref), marketplaceUnifiedItemType (ref), findCollectionItemInstancesModule (ref), marketplaceUnifiedAction (ref), unifiedEventLoggingUtils (ref), AXUnifiedEventFilter (ref), sendUnifiedEventLog (ref)
	if #p2 == 0 or #(p3 or t) == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p2}, itemAnalyticsDatas={#(p3 or t)}`
		}, p1.appPage)
		
		return 0
	end
	local t_1 = { analyticsData = p4 }
	local var1 = findAnalyticsFieldInAncestors("surface", t_1)
	local var2 = findAnalyticsFieldInAncestors("itemType", t_1)
	local var3 = findAnalyticsFieldInAncestors("universeId", t_1)
	local var4 = findAnalyticsFieldInAncestors("itemsPerRow", t_1)
	local var5 = if var3 ~= nil then nil else tonumber(var3)
	local var6 = if var4 ~= nil then nil else tonumber(var4)
	local var7 = if var1 ~= nil then nil else unifiedLoggingSurface[var1]
	local var8 = if var2 ~= nil then nil else marketplaceUnifiedItemType[var2]
	
	if not var7 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown surface on analytics data: {tostring(var1)}`
		}, p1.appPage)
		
		return 0
	elseif not var8 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown itemType on analytics data: {tostring(var2)}`
		}, p1.appPage)
		
		return 0
	end
	local var9 = findCollectionItemInstancesModule(p6)
	local var10 = 0
	
	for i, v in p2 do
		local var11 = p3[v]
		
		if var11 ~= nil then
			local var12, var13
			local var14 = (p5 or 0) + v
			
			if var6 and var6 > 0 then
				var12 = math.ceil(var14 / var6)
				var13 = (var14 - 1) % var6 + 1
			else
				var12 = 1
				var13 = var14
			end
			local t_2 = {
				action = marketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = var7,
				itemType = var8,
				itemId = var11.id,
				universeId = var5,
				gridPositionRow = var12,
				gridPositionColumn = var13
			}
			local var15 = var9[v]
			
			if var15 then
				for i_1, v_1 in unifiedEventLoggingUtils.getScreenSize(var15) do
					t_2[i_1] = v_1
				end
				for i_1, v_1 in unifiedEventLoggingUtils.getElementSizeAndPosition(var15) do
					t_2[i_1] = v_1
				end
			end
			AXUnifiedEventFilter.filter(t_2)
			sendUnifiedEventLog(t_2)
			var10 += 1
		end
	end
	if var10 == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
	end
	return var10
end
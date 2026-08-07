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

local function _(p0, p1) --[[ line: 29 | named "gridPosition" ]]
	if p1 and p1 > 0 then
		return math.ceil(p0 / p1), (p0 - 1) % p1 + 1
	end
	return 1, p0
end

return function(p2, p3, p4, p5, p6, p7) --[[ line: 47 | named "SduiMarketplaceItemImpressionsHandler" ]]
	-- upvalues: t (ref), sduiLogger (ref), sduiErrors (ref), findAnalyticsFieldInAncestors (ref), unifiedLoggingSurface (ref), marketplaceUnifiedItemType (ref), findCollectionItemInstancesModule (ref), marketplaceUnifiedAction (ref), unifiedEventLoggingUtils (ref), AXUnifiedEventFilter (ref), sendUnifiedEventLog (ref)
	if #p3 == 0 or #(p4 or t) == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p3}, itemAnalyticsDatas={#(p4 or t)}`
		}, p2.appPage)
		
		return 0
	end
	local t_1 = { analyticsData = p5 }
	local var6 = findAnalyticsFieldInAncestors("surface", t_1)
	local var7 = findAnalyticsFieldInAncestors("itemType", t_1)
	local var8 = findAnalyticsFieldInAncestors("universeId", t_1)
	local var9 = findAnalyticsFieldInAncestors("itemsPerRow", t_1)
	local var10 = if var8 ~= nil then nil else tonumber(var8)
	local var11 = if var9 ~= nil then nil else tonumber(var9)
	local var12 = if var6 ~= nil then nil else unifiedLoggingSurface[var6]
	local var13 = if var7 ~= nil then nil else marketplaceUnifiedItemType[var7]
	
	if not var12 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown surface on analytics data: {tostring(var6)}`
		}, p2.appPage)
		
		return 0
	elseif not var13 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown itemType on analytics data: {tostring(var7)}`
		}, p2.appPage)
		
		return 0
	end
	local var14 = findCollectionItemInstancesModule(p7)
	local var15 = 0
	
	for i, v in p3 do
		local var16 = p4[v]
		
		if var16 ~= nil then
			local var18, var19
			local var17 = (p6 or 0) + v
			
			if var11 and var11 > 0 then
				var18 = math.ceil(var17 / var11)
				var19 = (var17 - 1) % var11 + 1
			else
				var18 = 1
				var19 = var17
			end
			local t_2 = {
				action = marketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = var12,
				itemType = var13,
				itemId = var16.id,
				universeId = var10,
				gridPositionRow = var18,
				gridPositionColumn = var19
			}
			local var21 = var14[v]
			
			if var21 then
				for i_1, v_1 in unifiedEventLoggingUtils.getScreenSize(var21) do
					t_2[i_1] = v_1
				end
				for i_1, v_1 in unifiedEventLoggingUtils.getElementSizeAndPosition(var21) do
					t_2[i_1] = v_1
				end
			end
			AXUnifiedEventFilter.filter(t_2)
			sendUnifiedEventLog(t_2)
			var15 += 1
		end
	end
	if var15 == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p2.appPage)
	end
	return var15
end
local CorePackages = game:GetService("CorePackages")
local CreateSignalFunction = require(CorePackages.Packages.Signals).createSignal
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlagsModule.FFlagAXPrefetchOnlyWithinTTL
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly

return function()
	-- upvalues: CreateSignalFunction (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FFlagAXMoveAllTabToWidgetOnly (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local v1 = nil
	local Callback2 = nil
	
	if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
		v1, Callback2 = CreateSignalFunction(false)
	end
	local v2 = nil
	local Callback = nil
	
	if FFlagAXPrefetchOnlyWithinTTL then
		v2, Callback = CreateSignalFunction(nil)
	end
	local v3 = nil
	local Callback1 = nil
	
	if FFlagAXMoveAllTabToWidgetOnly then
		v3, Callback1 = CreateSignalFunction(false)
	end
	return {
		getFetchingMarketplace = Signal,
		getFetchedMarketplace = Signal1,
		getFetchingMarketplaceError = Signal3,
		getCatalogCategoriesError = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then v1 else nil,
		getFetchedMarketplaceTimestamp = if FFlagAXPrefetchOnlyWithinTTL then v2 else nil,
		getFetchingMarketplaceProcessed = if FFlagAXMoveAllTabToWidgetOnly then v3 else nil,
		setFetchingMarketplaceInProgress = function()
			-- upvalues: Signal2_2 (copy), Signal2 (copy), Signal2_1 (copy), FFlagAXMoveAllTabToWidgetOnly (upval), Callback1 (ref)
			Signal2_2(false)
			Signal2(true)
			Signal2_1(false)
			
			if FFlagAXMoveAllTabToWidgetOnly then
				Callback1(false)
			end
		end,
		setFetchedMarketplaceCompleted = function()
			-- upvalues: Signal2_1 (copy), Signal2 (copy), Signal2_2 (copy), FFlagAXPrefetchOnlyWithinTTL (upval), Callback (ref), FFlagAXMoveAllTabToWidgetOnly (upval), Callback1 (ref)
			Signal2_1(true)
			Signal2(false)
			Signal2_2(false)
			
			if FFlagAXPrefetchOnlyWithinTTL then
				Callback(os.time())
			end
			if FFlagAXMoveAllTabToWidgetOnly then
				Callback1(true)
			end
		end,
		setFetchingMarketplaceErrorOccured = function()
			-- upvalues: Signal2_2 (copy), Signal2_1 (copy), Signal2 (copy), FFlagAXMoveAllTabToWidgetOnly (upval), Callback1 (ref)
			Signal2_2(true)
			Signal2_1(false)
			Signal2(false)
			
			if FFlagAXMoveAllTabToWidgetOnly then
				Callback1(true)
			end
		end,
		setCatalogCategoriesErrorOccured = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then function()
			-- upvalues: Callback2 (ref)
			Callback2(true)
		end else nil,
		setFetchingMarketplaceProcessed = if FFlagAXMoveAllTabToWidgetOnly then function()
			-- upvalues: Callback1 (ref), Signal2 (copy), Signal2_1 (copy)
			Callback1(true)
			Signal2(false)
			Signal2_1(true)
		end else nil,
		resetFetchMarketplaceStore = function()
			-- upvalues: Signal2_2 (copy), FFlagAXCatalogCategoriesSDUI (upval), FFlagAXMigrateAllTabToSduiDev (upval), Callback2 (ref), Signal2_1 (copy), Signal2 (copy), FFlagAXPrefetchOnlyWithinTTL (upval), Callback (ref), FFlagAXMoveAllTabToWidgetOnly (upval), Callback1 (ref)
			Signal2_2(false)
			
			if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
				Callback2(false)
			end
			Signal2_1(false)
			Signal2(false)
			
			if FFlagAXPrefetchOnlyWithinTTL then
				Callback(nil)
			end
			if FFlagAXMoveAllTabToWidgetOnly then
				Callback1(false)
			end
		end
	}
end
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local AXCatalogPerfReduxReductionIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.searchUuid] = {
				hideTopBar = true,
				focusedWidget = {
					active = true,
					id = p2.id,
					title = p2.title or "",
					description = p2.description or "",
					localizedTitle = p2.localizedTitle or "",
					localizedDescription = p2.localizedDescription or "",
					localizedTooltip = p2.localizedTooltip or "",
					tooltip = p2.tooltip or ""
				}
			}
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.searchUuid] = {} })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets).name] = function(_, _)
		return {}
	end,
	[CatalogTilesLatencyTrackerModule.PercievedTrackingStarted.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, { perceivedStartTime = p2.startPerceivedTime }))
	end,
	[CatalogTilesLatencyTrackerModule.StartTracking.name] = function(p1, p2)
		-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CryoModule (copy)
		if GetFFlagEnableCatalogTileLoadingLatencyModule() then
			local SearchUuid = p2.searchUuid
			local v1 = p1[SearchUuid] or {}
			local JoinResult = CryoModule.Dictionary.join(p1, {
				[SearchUuid] = CryoModule.Dictionary.join(v1, {
					tileLoadingLatency = CryoModule.Dictionary.join(v1 and v1.tileLoadingLatency or {}, { startTime = p2.startTime })
				})
			})
			JoinResult[SearchUuid].tileLoadingLatency.endTime = nil
			
			return JoinResult
		else
			return p1
		end
	end,
	[CatalogTilesLatencyTrackerModule.EndTracking.name] = function(p1, p2)
		-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CryoModule (copy)
		if GetFFlagEnableCatalogTileLoadingLatencyModule() then
			local SearchUuid = p2.searchUuid
			local v1 = p1[SearchUuid] or {}
			
			return (CryoModule.Dictionary.join(p1, {
				[SearchUuid] = CryoModule.Dictionary.join(v1, {
					tileLoadingLatency = CryoModule.Dictionary.join(v1 and v1.tileLoadingLatency or {}, { endTime = p2.endTime })
				}),
				perceivedStartTime = CryoModule.None
			}))
		else
			return p1
		end
	end,
	[CatalogTilesLatencyTrackerModule.AppendThumbnails.name] = if AXCatalogPerfReduxReductionIXPModule.isEnabled() then function(Tbl, p1)
		local ThumbnailsMap = p1.thumbnailsMap
		
		if not ThumbnailsMap then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		
		for i, value in ThumbnailsMap do
			local Copy1 = table.clone(Copy[i] or {})
			local Copy2 = table.clone(Copy1.tileLoadingLatency or {})
			local Copy3 = table.clone(Copy2.thumbnails or {})
			
			for _, value1 in value do
				Copy3[value1] = Copy3[value1] or false
			end
			Copy2.thumbnails = Copy3
			Copy1.tileLoadingLatency = Copy2
			Copy[i] = Copy1
		end
		return Copy
	end else nil,
	[CatalogTilesLatencyTrackerModule.AppendThumbnail.name] = function(p2, p3)
		-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CryoModule (copy)
		if GetFFlagEnableCatalogTileLoadingLatencyModule() then
			local SearchUuid = p3.searchUuid
			local v1 = p2[SearchUuid] or {}
			local TileLoadingLatency = v1 and v1.tileLoadingLatency or {}
			TileLoadingLatency.thumbnails = CryoModule.Dictionary.join(TileLoadingLatency and TileLoadingLatency.thumbnails or {}, { [p3.thumbnailId] = false })
			
			return CryoModule.Dictionary.join(p2, {
				[SearchUuid] = CryoModule.Dictionary.join(v1, { tileLoadingLatency = TileLoadingLatency })
			})
		else
			return p2
		end
	end,
	[CatalogTilesLatencyTrackerModule.SetLoadedThumbnails.name] = if AXCatalogPerfReduxReductionIXPModule.isEnabled() then function(p2, p3)
		local SearchUuid = p3.searchUuid
		local Copy = table.clone(p2 or {})
		local Copy1 = table.clone(Copy[SearchUuid] or {})
		local Copy2 = table.clone(Copy1.tileLoadingLatency or {})
		local Copy3 = Copy1.tileLoadingLatency and Copy1.tileLoadingLatency.thumbnails and table.clone(Copy1.tileLoadingLatency.thumbnails) or {}
		
		if p3.thumbnailIds then
			for _, thumbnailId in p3.thumbnailIds do
				Copy3[thumbnailId] = true
			end
		end
		Copy2.thumbnails = Copy3
		Copy1.tileLoadingLatency = Copy2
		Copy[SearchUuid] = Copy1
		
		return Copy
	end else nil,
	[CatalogTilesLatencyTrackerModule.SetLoadedThumbnail.name] = function(p4, p5)
		-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CryoModule (copy)
		if GetFFlagEnableCatalogTileLoadingLatencyModule() then
			local v1 = p4[p5.searchUuid] or {}
			local TileLoadingLatency = v1 and v1.tileLoadingLatency or {}
			TileLoadingLatency.thumbnails = CryoModule.Dictionary.join(TileLoadingLatency.thumbnails or {}, { [p5.thumbnailId] = true })
			
			return CryoModule.Dictionary.join(p4, {
				[p5.searchUuid] = CryoModule.Dictionary.join(v1, { tileLoadingLatency = TileLoadingLatency })
			})
		else
			return p4
		end
	end
})
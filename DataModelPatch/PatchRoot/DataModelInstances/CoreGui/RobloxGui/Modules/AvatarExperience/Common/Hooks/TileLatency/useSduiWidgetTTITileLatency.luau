local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SignalsModule = require(CorePackages.Packages.Signals)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local GetCatalogPageRequestIdStoreFunction = AvatarExperienceCatalogModule.Stores.getCatalogPageRequestIdStore
local SelectHydratedWidgetData = AvatarExperienceCatalogModule.State.Selectors.selectHydratedWidgetData
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXSduiWidgetsTTITracking = AvatarExperienceFlagsModule.FFlagAXSduiWidgetsTTITracking
local FFlagAXFixSduiWidgetTTITileLatencyCallbackIdentity = AvatarExperienceFlagsModule.FFlagAXFixSduiWidgetTTITileLatencyCallbackIdentity
local UseTileLoadingLatencyInitializerModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer)

return function(p1)
	-- upvalues: UseSelectorFunction (copy), SelectHydratedWidgetData (copy), UseTileLoadingLatencyInitializerModule (copy), GetCatalogPageRequestIdStoreFunction (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), FFlagAXFixSduiWidgetTTITileLatencyCallbackIdentity (copy), FFlagAXSduiWidgetsTTITracking (copy)
	local SearchUuid = p1.searchUuid
	local ResultsAreSduiEnabled = p1.resultsAreSduiEnabled
	local Identifier = p1.identifier
	local UseSelectorResult = UseSelectorFunction(SelectHydratedWidgetData)
	local UseTileLoadingLatencyInitializerModuleResult = UseTileLoadingLatencyInitializerModule(SearchUuid or "")
	local CatalogPageRequestIdStore = GetCatalogPageRequestIdStoreFunction(false)
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), CatalogPageRequestIdStore (copy), Identifier (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: CatalogPageRequestIdStore (upval), Identifier (upval)
			local PageRequestIdMap = CatalogPageRequestIdStore.getPageRequestIdMap(p2)
			
			return if Identifier == nil then nil else PageRequestIdMap[Identifier]
		end)
	end, { Identifier, CatalogPageRequestIdStore })))
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(UseTileLoadingLatencyInitializerModuleResult)
	UseRefResult3.current = UseTileLoadingLatencyInitializerModuleResult
	local UseRefResult4 = nil
	local UseRefResult5 = nil
	local UseRefResult6 = nil
	local UseRefResult7 = nil
	
	if FFlagAXFixSduiWidgetTTITileLatencyCallbackIdentity then
		UseRefResult4 = ReactModule.useRef(UseSelectorResult)
		UseRefResult4.current = UseSelectorResult
		UseRefResult5 = ReactModule.useRef(UseSignalStateResult)
		UseRefResult5.current = UseSignalStateResult
		UseRefResult6 = ReactModule.useRef(SearchUuid)
		UseRefResult6.current = SearchUuid
		UseRefResult7 = ReactModule.useRef(ResultsAreSduiEnabled)
		UseRefResult7.current = ResultsAreSduiEnabled
	end
	ReactModule.useEffect(function()
		-- upvalues: ResultsAreSduiEnabled (copy), FFlagAXSduiWidgetsTTITracking (upval), UseTileLoadingLatencyInitializerModuleResult (copy), UseSignalStateResult (copy), SearchUuid (copy), UseRefResult2 (copy), UseSelectorResult (copy), UseRefResult (copy)
		if not ResultsAreSduiEnabled or not FFlagAXSduiWidgetsTTITracking then return end
		if UseTileLoadingLatencyInitializerModuleResult.trackerStartTime == nil then return end
		if UseSignalStateResult == nil then return end
		if SearchUuid == nil or SearchUuid == "" then return end
		if UseRefResult2.current == nil or UseRefResult2.current.pageRequestId ~= UseSignalStateResult then
			UseRefResult2.current = {
				pageRequestId = UseSignalStateResult,
				hydratedWidgetData = UseSelectorResult
			}
			
			return
		end
		if UseSelectorResult == nil or next(UseSelectorResult) == nil then return end
		if UseSelectorResult == UseRefResult2.current.hydratedWidgetData then return end
		local Text = SearchUuid .. "|" .. UseSignalStateResult
		
		if UseRefResult.current ~= Text then
			UseRefResult.current = Text
			UseTileLoadingLatencyInitializerModuleResult.fireTileLoadingLatencyTracker(UseTileLoadingLatencyInitializerModuleResult, nil, true)
			
			return
		end
	end, {
		UseSelectorResult,
		UseSignalStateResult,
		SearchUuid,
		ResultsAreSduiEnabled,
		UseTileLoadingLatencyInitializerModuleResult.trackerStartTime
	})
	local UseResult = if FFlagAXFixSduiWidgetTTITileLatencyCallbackIdentity then ReactModule.useCallback(function(_)
		-- upvalues: UseRefResult7 (ref), FFlagAXSduiWidgetsTTITracking (upval), UseRefResult3 (copy), UseRefResult5 (ref), UseRefResult6 (ref), UseRefResult2 (copy), UseRefResult4 (ref), UseRefResult1 (copy)
		if not UseRefResult7.current or not FFlagAXSduiWidgetsTTITracking then return end
		local Current = UseRefResult3.current
		
		if Current.trackerStartTime == nil then return end
		local Current1 = UseRefResult5.current
		
		if Current1 == nil then return end
		local Current2 = UseRefResult6.current
		
		if Current2 == nil or Current2 == "" then return end
		local Current3 = UseRefResult2.current
		
		if Current3 == nil or Current3.pageRequestId ~= Current1 then return end
		local Current4 = UseRefResult4.current
		
		if Current4 == nil or next(Current4) == nil then return end
		if Current4 == Current3.hydratedWidgetData then return end
		local Text = Current2 .. "|" .. Current1
		
		if UseRefResult1.current ~= Text then
			UseRefResult1.current = Text
			Current.fireTileLoadingLatencyTracker(Current, true, true)
			
			return
		end
	end, {}) else ReactModule.useCallback(function(_)
		-- upvalues: ResultsAreSduiEnabled (copy), FFlagAXSduiWidgetsTTITracking (upval), UseRefResult3 (copy), UseSignalStateResult (copy), SearchUuid (copy), UseRefResult2 (copy), UseSelectorResult (copy), UseRefResult1 (copy)
		if not ResultsAreSduiEnabled or not FFlagAXSduiWidgetsTTITracking then return end
		local Current = UseRefResult3.current
		
		if Current.trackerStartTime == nil then return end
		if UseSignalStateResult == nil then return end
		if SearchUuid == nil or SearchUuid == "" then return end
		local Current1 = UseRefResult2.current
		
		if Current1 == nil or Current1.pageRequestId ~= UseSignalStateResult then return end
		if UseSelectorResult == nil or next(UseSelectorResult) == nil then return end
		if UseSelectorResult == Current1.hydratedWidgetData then return end
		local Text = SearchUuid .. "|" .. UseSignalStateResult
		
		if UseRefResult1.current ~= Text then
			UseRefResult1.current = Text
			Current.fireTileLoadingLatencyTracker(Current, true, true)
			
			return
		end
	end, {
		UseSelectorResult,
		UseSignalStateResult,
		SearchUuid,
		ResultsAreSduiEnabled
	})
	
	return if ResultsAreSduiEnabled and FFlagAXSduiWidgetsTTITracking then UseResult else nil
end
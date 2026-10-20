local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SignalsModule = require(CorePackages.Packages.Signals)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local GetCatalogPageRequestIdStoreFunction = AvatarExperienceCatalogModule.Stores.getCatalogPageRequestIdStore
local SelectHydratedWidgetData = AvatarExperienceCatalogModule.State.Selectors.selectHydratedWidgetData
local FFlagAXSduiWidgetsTTITracking = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSduiWidgetsTTITracking
local WidgetsPercievedTTIManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager

return function(p1)
	-- upvalues: UseSelectorFunction (copy), SelectHydratedWidgetData (copy), GetCatalogPageRequestIdStoreFunction (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), FFlagAXSduiWidgetsTTITracking (copy), WidgetsPercievedTTIManager (copy)
	local SearchUuid = p1.searchUuid
	local ResultsAreSduiEnabled = p1.resultsAreSduiEnabled
	local Identifier = p1.identifier
	local UseSelectorResult = UseSelectorFunction(SelectHydratedWidgetData)
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
	ReactModule.useEffect(function()
		-- upvalues: ResultsAreSduiEnabled (copy), FFlagAXSduiWidgetsTTITracking (upval), UseSignalStateResult (copy), SearchUuid (copy), UseRefResult1 (copy), UseSelectorResult (copy), UseRefResult (copy), WidgetsPercievedTTIManager (upval)
		if not ResultsAreSduiEnabled or not FFlagAXSduiWidgetsTTITracking then return end
		if UseSignalStateResult == nil then return end
		if SearchUuid == nil or SearchUuid == "" then return end
		if UseRefResult1.current == nil or UseRefResult1.current.pageRequestId ~= UseSignalStateResult then
			UseRefResult1.current = {
				pageRequestId = UseSignalStateResult,
				hydratedWidgetData = UseSelectorResult
			}
			
			return
		end
		if UseSelectorResult == nil or next(UseSelectorResult) == nil then return end
		if UseSelectorResult == UseRefResult1.current.hydratedWidgetData then return end
		local Text = SearchUuid .. "|" .. UseSignalStateResult
		
		if UseRefResult.current ~= Text then
			UseRefResult.current = Text
			WidgetsPercievedTTIManager.L2.primaryDataReady()
			
			return
		end
	end, {
		UseSelectorResult,
		UseSignalStateResult,
		SearchUuid,
		ResultsAreSduiEnabled
	})
end
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local collectionItemSize = require(parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local signalsModule = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiComponentDefinitionsModule = require(serverDrivenUi.System.SduiComponentDefinitions)
local sduiInstrumentation = sduiCoreSystemModule.SduiInstrumentation
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiTemplateRegistry = sduiCoreSystemModule.SduiTemplateRegistry
local sduiUsageRecorder = sduiCoreSystemModule.SduiUsageRecorder
local recordV1RegisteredTemplates = sduiCoreSystemModule.recordV1RegisteredTemplates
local useSduiDataStoreModule = require(serverDrivenUi.DataStore.useSduiDataStore)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local fFlagSduiUsageTelemetry = require(parent.SharedFlags).FFlagSduiUsageTelemetry
local t = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}
local useSduiDependenciesModule = require(serverDrivenUi.System.useSduiDependencies)

return function(p0) --[[ line: 59 | named "useSduiContext" ]]
	-- upvalues: reactModule (ref), sduiInstrumentation (ref), useSduiDependenciesModule (ref), sduiComponentDefinitionsModule (ref), sduiTemplateRegistry (ref), fFlagSduiUsageTelemetry (ref), recordV1RegisteredTemplates (ref), sduiUsageRecorder (ref), useSduiDataStoreModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsModule (ref), t (ref), collectionItemSize (ref), sduiLogger (ref), sduiErrors (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: sduiInstrumentation (copy)
		return sduiInstrumentation.new()
	end, {})
	var8:startTimerFlow("useSduiContext")
	local var9 = useSduiDependenciesModule(var8)
	local var10 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: p0 (ref), sduiComponentDefinitionsModule (copy)
		return p0.componentDefinitions or sduiComponentDefinitionsModule.new()
	end, { p0.componentDefinitions })
	local var11 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: sduiTemplateRegistry (copy), p0 (ref)
		return sduiTemplateRegistry.new(p0.templates)
	end, { p0.templates })
	
	if fFlagSduiUsageTelemetry then
		reactModule.useEffect(function() --[[ line: 81 ]]
			-- upvalues: recordV1RegisteredTemplates (copy), p0 (ref), sduiUsageRecorder (copy)
			recordV1RegisteredTemplates(p0.appPage, p0.templates)
			sduiUsageRecorder.scheduleFlush()
		end, { p0.appPage, p0.templates })
	end
	local var12 = useSduiDataStoreModule()
	local var13 = nil
	
	if fFlagLuaAppLayoutParamsInContext then
		local var14 = reactModule.useMemo(function() --[[ line: 91 ]]
			-- upvalues: signalsModule (copy), t (copy)
			return signalsModule.createSignal(t)
		end, {})
		var13 = reactModule.useCallback(function(p1) --[[ line: 95 ]]
			-- upvalues: signalsModule (copy), p0 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), var14 (ref)
			return signalsModule.createComputed(function(p2) --[[ line: 96 ]]
				-- upvalues: p0 (copy), p1 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), var14 (copy)
				if p0.pageLayoutConfig then
					return (p0.pageLayoutConfig[p1] or p0.pageLayoutConfig[collectionItemSize.Small])(p2)
				end
				sduiLogger.reportError(sduiErrors.SduiErrorType.NoPageLayoutConfig, {
					message = `No page layout config available for {p0.appPage}, returning default config`
				}, p0.appPage)
				
				return var14(p2)
			end)
		end, { p0.pageLayoutConfig })
	end
	local var15 = reactModule.useMemo(function() --[[ line: 113 ]]
		-- upvalues: var9 (ref), p0 (ref), var10 (ref), var11 (ref), var12 (ref), fFlagLuaAppLayoutParamsInContext (copy), var13 (write)
		local t = {
			dependencies = var9,
			appPage = p0.appPage,
			dataUpdatedTimestamp = p0.dataUpdatedTimestamp,
			componentDefinitions = var10,
			templateRegistry = var11,
			dataStore = var12,
			getPageLayoutConfig = if fFlagLuaAppLayoutParamsInContext then var13 else nil
		}
		setmetatable(t, {
			__tostring = function() --[[ line: 125 ]]
				return "SduiContext"
			end
		})
		
		return t
	end, {
		var9, p0.appPage, p0.dataUpdatedTimestamp, var10, var11, var12,
		if fFlagLuaAppLayoutParamsInContext then var13 else nil
	})
	var8:stopTimerFlow("useSduiContext", var15)
	
	return var15
end
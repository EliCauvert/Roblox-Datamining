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
local t = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}
local useSduiDependenciesModule = require(serverDrivenUi.System.useSduiDependencies)

return function(p1)
	-- upvalues: reactModule (ref), sduiInstrumentation (ref), useSduiDependenciesModule (ref), sduiComponentDefinitionsModule (ref), sduiTemplateRegistry (ref), recordV1RegisteredTemplates (ref), sduiUsageRecorder (ref), useSduiDataStoreModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsModule (ref), t (ref), collectionItemSize (ref), sduiLogger (ref), sduiErrors (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: sduiInstrumentation (copy)
		return sduiInstrumentation.new()
	end, {})
	var1:startTimerFlow("useSduiContext")
	local var2 = useSduiDependenciesModule(var1)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), sduiComponentDefinitionsModule (copy)
		return p1.componentDefinitions or sduiComponentDefinitionsModule.new()
	end, { p1.componentDefinitions })
	local var4 = reactModule.useMemo(function()
		-- upvalues: sduiTemplateRegistry (copy), p1 (ref)
		return sduiTemplateRegistry.new(p1.templates)
	end, { p1.templates })
	reactModule.useEffect(function()
		-- upvalues: recordV1RegisteredTemplates (copy), p1 (ref), sduiUsageRecorder (copy)
		recordV1RegisteredTemplates(p1.appPage, p1.templates)
		sduiUsageRecorder.scheduleFlush()
	end, { p1.appPage, p1.templates })
	local var5 = useSduiDataStoreModule()
	local var6 = nil
	
	if fFlagLuaAppLayoutParamsInContext then
		local var7 = reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), t (copy)
			return signalsModule.createSignal(t)
		end, {})
		var6 = reactModule.useCallback(function(p2)
			-- upvalues: signalsModule (copy), p1 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), var7 (ref)
			return signalsModule.createComputed(function(p3)
				-- upvalues: p1 (copy), p2 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), var7 (copy)
				if p1.pageLayoutConfig then
					return (p1.pageLayoutConfig[p2] or p1.pageLayoutConfig[collectionItemSize.Small])(p3)
				end
				sduiLogger.reportError(sduiErrors.SduiErrorType.NoPageLayoutConfig, {
					message = `No page layout config available for {p1.appPage}, returning default config`
				}, p1.appPage)
				
				return var7(p3)
			end)
		end, { p1.pageLayoutConfig })
	end
	local var8 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), var3 (ref), var4 (ref), var5 (ref), fFlagLuaAppLayoutParamsInContext (copy), var6 (write)
		local t = {
			dependencies = var2,
			appPage = p1.appPage,
			dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
			componentDefinitions = var3,
			templateRegistry = var4,
			dataStore = var5,
			getPageLayoutConfig = if fFlagLuaAppLayoutParamsInContext then var6 else nil
		}
		setmetatable(t, {
			__tostring = function()
				return "SduiContext"
			end
		})
		
		return t
	end, {
		var2, p1.appPage, p1.dataUpdatedTimestamp, var3, var4, var5,
		if fFlagLuaAppLayoutParamsInContext then var6 else nil
	})
	var1:stopTimerFlow("useSduiContext", var8)
	
	return var8
end
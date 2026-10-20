local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local CollectionItemSize = require(Parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local SignalsModule = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentDefinitionsModule = require(ServerDrivenUi.System.SduiComponentDefinitions)
local SduiInstrumentation = SduiCoreSystemModule.SduiInstrumentation
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiTemplateRegistry = SduiCoreSystemModule.SduiTemplateRegistry
local SduiUsageRecorder = SduiCoreSystemModule.SduiUsageRecorder
local RecordV1RegisteredTemplatesFunction = SduiCoreSystemModule.recordV1RegisteredTemplates
local UseSduiDataStoreModule = require(ServerDrivenUi.DataStore.useSduiDataStore)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local config = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}
local UseSduiDependenciesModule = require(ServerDrivenUi.System.useSduiDependencies)

return function(p1)
	-- upvalues: ReactModule (copy), SduiInstrumentation (copy), UseSduiDependenciesModule (copy), SduiComponentDefinitionsModule (copy), SduiTemplateRegistry (copy), RecordV1RegisteredTemplatesFunction (copy), SduiUsageRecorder (copy), UseSduiDataStoreModule (copy), FFlagLuaAppLayoutParamsInContext (copy), SignalsModule (copy), config (copy), CollectionItemSize (copy), SduiLogger (copy), SduiErrors (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SduiInstrumentation (upval)
		return SduiInstrumentation.new()
	end, {})
	UseMemoResult:startTimerFlow("useSduiContext")
	local UseSduiDependenciesModuleResult = UseSduiDependenciesModule(UseMemoResult)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SduiComponentDefinitionsModule (upval)
		return p1.componentDefinitions or SduiComponentDefinitionsModule.new()
	end, { p1.componentDefinitions })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SduiTemplateRegistry (upval), p1 (copy)
		return SduiTemplateRegistry.new(p1.templates)
	end, { p1.templates })
	ReactModule.useEffect(function()
		-- upvalues: RecordV1RegisteredTemplatesFunction (upval), p1 (copy), SduiUsageRecorder (upval)
		RecordV1RegisteredTemplatesFunction(p1.appPage, p1.templates)
		SduiUsageRecorder.scheduleFlush()
	end, { p1.appPage, p1.templates })
	local UseSduiDataStoreModuleResult = UseSduiDataStoreModule()
	local UseResult = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		local UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), config (upval)
			return SignalsModule.createSignal(config)
		end, {})
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: SignalsModule (upval), p1 (copy), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), UseMemoResult3 (copy)
			return SignalsModule.createComputed(function(p3)
				-- upvalues: p1 (upval), p2 (copy), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), UseMemoResult3 (upval)
				if p1.pageLayoutConfig then
					return (p1.pageLayoutConfig[p2] or p1.pageLayoutConfig[CollectionItemSize.Small])(p3)
				else
					SduiLogger.reportError(SduiErrors.SduiErrorType.NoPageLayoutConfig, {
						message = `No page layout config available for {p1.appPage}, returning default config`
					}, p1.appPage)
					
					return (UseMemoResult3(p3))
				end
			end)
		end, { p1.pageLayoutConfig })
	end
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseSduiDependenciesModuleResult (copy), p1 (copy), UseMemoResult1 (copy), UseMemoResult2 (copy), UseSduiDataStoreModuleResult (copy), FFlagLuaAppLayoutParamsInContext (upval), UseResult (ref)
		local config = {
			dependencies = UseSduiDependenciesModuleResult,
			appPage = p1.appPage,
			dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
			componentDefinitions = UseMemoResult1,
			templateRegistry = UseMemoResult2,
			dataStore = UseSduiDataStoreModuleResult,
			getPageLayoutConfig = if FFlagLuaAppLayoutParamsInContext then UseResult else nil
		}
		setmetatable(config, {
			__tostring = function(): string
				return "SduiContext"
			end
		})
		
		return config
	end, {
		UseSduiDependenciesModuleResult, p1.appPage, p1.dataUpdatedTimestamp,
		UseMemoResult1, UseMemoResult2, UseSduiDataStoreModuleResult,
		if FFlagLuaAppLayoutParamsInContext then UseResult else nil
	})
	UseMemoResult:stopTimerFlow("useSduiContext", UseMemoResult4)
	
	return UseMemoResult4
end
local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiErrors = SduiCoreSystemModule.SduiErrors
local UseCollectionLayoutConfigFunction = require(Parent.CollectionViews).useCollectionLayoutConfig
local GetSduiServiceDependenciesStoreFunction = SduiCoreSystemModule.getSduiServiceDependenciesStore
local CollectionItemSize = require(Parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagSduiChartsSupport = SharedFlagsModule.FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = SharedFlagsModule.FFlagSduiEventDetailsSupport
local FFlagEnableSduiV2HomeInterleave = SharedFlagsModule.FFlagEnableSduiV2HomeInterleave
local config = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}

return function(AppPage, p1, p2, p3, p4, Enabled, p5)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FFlagEnableSduiV2HomeInterleave (copy), ReactModule (copy), SignalsModule (copy), config (copy), UseCollectionLayoutConfigFunction (copy), CollectionItemSize (copy), SduiLogger (copy), SduiErrors (copy), GetSduiServiceDependenciesStoreFunction (copy), FFlagSduiChartsSupport (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy)
	local P5 = p5 or AppPage
	local UseCollectionLayoutConfigResult = nil
	local UseResult = nil
	
	if not FFlagLuaAppCompositionAlways then
		if FFlagEnableSduiV2HomeInterleave then
			UseCollectionLayoutConfigResult = UseCollectionLayoutConfigFunction(p1, p2)
			UseResult = ReactModule.useCallback(function(p6)
				-- upvalues: SignalsModule (upval), FFlagEnableSduiV2HomeInterleave (upval), Enabled (copy), config (upval), UseCollectionLayoutConfigResult (ref), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), AppPage (copy)
				return SignalsModule.createComputed(function(p7)
					-- upvalues: FFlagEnableSduiV2HomeInterleave (upval), Enabled (upval), config (upval), UseCollectionLayoutConfigResult (upval), p6 (copy), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), AppPage (upval)
					if FFlagEnableSduiV2HomeInterleave and Enabled ~= false then
						return config
					elseif UseCollectionLayoutConfigResult then
						return (UseCollectionLayoutConfigResult[p6] or UseCollectionLayoutConfigResult[CollectionItemSize.Small])(p7)
					else
						SduiLogger.reportError(SduiErrors.SduiErrorType.NoPageLayoutConfig, {
							message = `No page layout config available for {AppPage}, returning default config`
						}, AppPage)
						
						return config
					end
				end)
			end, {
				UseCollectionLayoutConfigResult,
				AppPage,
				if FFlagEnableSduiV2HomeInterleave then Enabled else nil
			})
		else
			UseResult = ReactModule.useCallback(function(_)
				-- upvalues: SignalsModule (upval), config (upval)
				return SignalsModule.createComputed(function(_)
					-- upvalues: config (upval)
					return config
				end)
			end, {})
		end
	end
	return (ReactModule.useMemo(function()
		-- upvalues: GetSduiServiceDependenciesStoreFunction (upval), AppPage (copy), P5 (copy), UseResult (ref), FFlagEnableSduiV2HomeInterleave (upval), Enabled (copy), FFlagSduiChartsSupport (upval), p3 (copy), FFlagSduiExperienceDetailsSupport (upval), FFlagSduiEventDetailsSupport (upval), p4 (copy)
		return {
			dependencies = GetSduiServiceDependenciesStoreFunction().getDependencies(AppPage),
			appPage = AppPage,
			routeName = P5,
			getPageLayoutConfig = UseResult,
			appCompositionEnabled = not FFlagEnableSduiV2HomeInterleave or Enabled == nil or Enabled,
			dataUpdatedTimestamp = if FFlagSduiChartsSupport or FFlagEnableSduiV2HomeInterleave then p3 else nil,
			configKey = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then p4 else nil
		}
	end, {
		AppPage, P5, UseResult,
		if FFlagSduiChartsSupport or FFlagEnableSduiV2HomeInterleave then p3 else nil,
		if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then p4 else nil,
		if FFlagEnableSduiV2HomeInterleave then Enabled else nil
	}))
end
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
local FFlagLuaAppSduiVideoThumbnail = SharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppOneByTwoHoverIdleAutoplay = SharedFlagsModule.FFlagLuaAppOneByTwoHoverIdleAutoplay
local config = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}

return function(AppPage, p1, p2, DataUpdatedTimestamp, ConfigKey, Enabled, p3, ScrollAway, p4)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), UseCollectionLayoutConfigFunction (copy), ReactModule (copy), SignalsModule (copy), config (copy), CollectionItemSize (copy), SduiLogger (copy), SduiErrors (copy), GetSduiServiceDependenciesStoreFunction (copy), FFlagLuaAppSduiVideoThumbnail (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy)
	local P5 = p3 or AppPage
	local UseCollectionLayoutConfigResult = nil
	local UseResult = nil
	
	if not FFlagLuaAppCompositionAlways then
		UseCollectionLayoutConfigResult = UseCollectionLayoutConfigFunction(p1, p2)
		UseResult = ReactModule.useCallback(function(p5)
			-- upvalues: SignalsModule (upval), Enabled (copy), config (upval), UseCollectionLayoutConfigResult (ref), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), AppPage (copy)
			return SignalsModule.createComputed(function(p6)
				-- upvalues: Enabled (upval), config (upval), UseCollectionLayoutConfigResult (upval), p5 (copy), CollectionItemSize (upval), SduiLogger (upval), SduiErrors (upval), AppPage (upval)
				if Enabled ~= false then
					return config
				elseif UseCollectionLayoutConfigResult then
					return (UseCollectionLayoutConfigResult[p5] or UseCollectionLayoutConfigResult[CollectionItemSize.Small])(p6)
				else
					SduiLogger.reportError(SduiErrors.SduiErrorType.NoPageLayoutConfig, {
						message = `No page layout config available for {AppPage}, returning default config`
					}, AppPage)
					
					return config
				end
			end)
		end, { UseCollectionLayoutConfigResult, AppPage, Enabled })
	end
	return (ReactModule.useMemo(function()
		-- upvalues: GetSduiServiceDependenciesStoreFunction (upval), AppPage (copy), P5 (copy), UseResult (ref), Enabled (copy), DataUpdatedTimestamp (copy), ConfigKey (copy), ScrollAway (copy), FFlagLuaAppSduiVideoThumbnail (upval), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), p4 (copy)
		return {
			dependencies = GetSduiServiceDependenciesStoreFunction().getDependencies(AppPage),
			appPage = AppPage,
			routeName = P5,
			getPageLayoutConfig = UseResult,
			appCompositionEnabled = Enabled == nil or Enabled,
			dataUpdatedTimestamp = DataUpdatedTimestamp,
			configKey = ConfigKey,
			scrollAway = ScrollAway,
			videoPlaybackContext = if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil
		}
	end, {
		AppPage, P5, UseResult, DataUpdatedTimestamp, ConfigKey, Enabled, ScrollAway,
		if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil
	}))
end
local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiErrors = sduiCoreSystemModule.SduiErrors
local useCollectionLayoutConfig = require(parent.CollectionViews).useCollectionLayoutConfig
local getSduiServiceDependenciesStore = sduiCoreSystemModule.getSduiServiceDependenciesStore
local collectionItemSize = require(parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport
local fFlagLuaAppSduiStickyHeaderScrollAway = sharedFlagsModule.FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
local t = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), useCollectionLayoutConfig (ref), reactModule (ref), signalsModule (ref), t (ref), collectionItemSize (ref), sduiLogger (ref), sduiErrors (ref), getSduiServiceDependenciesStore (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), fFlagLuaAppSduiVideoThumbnail (ref)
	p7 = p7 or p1
	local _ = nil
	local var1 = nil
	
	if not fFlagLuaAppCompositionAlways then
		local var2 = useCollectionLayoutConfig(p2, p3)
		var1 = reactModule.useCallback(function(p10)
			-- upvalues: signalsModule (copy), p6 (ref), t (copy), var2 (write), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p1 (ref)
			return signalsModule.createComputed(function(p11)
				-- upvalues: p6 (copy), t (copy), var2 (copy), p10 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p1 (copy)
				if p6 ~= false then
					return t
				elseif var2 then
					return (var2[p10] or var2[collectionItemSize.Small])(p11)
				end
				sduiLogger.reportError(sduiErrors.SduiErrorType.NoPageLayoutConfig, {
					message = `No page layout config available for {p1}, returning default config`
				}, p1)
				
				return t
			end)
		end, { var2, p1, p6 })
	end
	return reactModule.useMemo(function()
		-- upvalues: getSduiServiceDependenciesStore (copy), p1 (ref), p7 (ref), var1 (write), p6 (ref), p4 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), p5 (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), p8 (ref), fFlagLuaAppSduiVideoThumbnail (copy), p9 (ref)
		return {
			dependencies = getSduiServiceDependenciesStore().getDependencies(p1),
			appPage = p1,
			routeName = p7,
			getPageLayoutConfig = var1,
			appCompositionEnabled = p6 ~= nil or p6,
			dataUpdatedTimestamp = p4,
			configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p5 else nil,
			scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p8 else nil,
			videoPlaybackContext = if fFlagLuaAppSduiVideoThumbnail then p9 else nil
		}
	end, {
		p1, p7, var1, p4,
		if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p5 else nil,
		p6, if fFlagLuaAppSduiStickyHeaderScrollAway then p8 else nil,
		if fFlagLuaAppSduiVideoThumbnail then p9 else nil
	})
end
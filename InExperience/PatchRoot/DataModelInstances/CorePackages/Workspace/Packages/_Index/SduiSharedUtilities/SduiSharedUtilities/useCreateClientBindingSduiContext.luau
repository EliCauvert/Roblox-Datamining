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
local t = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 44 | named "useCreateClientBindingSduiContext" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), useCollectionLayoutConfig (ref), reactModule (ref), signalsModule (ref), t (ref), collectionItemSize (ref), sduiLogger (ref), sduiErrors (ref), getSduiServiceDependenciesStore (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref)
	p6 = p6 or p0
	local _ = nil
	local var6 = nil
	
	if not fFlagLuaAppCompositionAlways then
		local var7 = useCollectionLayoutConfig(p1, p2)
		var6 = reactModule.useCallback(function(p7) --[[ line: 61 ]]
			-- upvalues: signalsModule (copy), p5 (ref), t (copy), var7 (write), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p0 (ref)
			return signalsModule.createComputed(function(p8) --[[ line: 62 ]]
				-- upvalues: p5 (copy), t (copy), var7 (copy), p7 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p0 (copy)
				if p5 ~= false then
					return t
				elseif var7 then
					return (var7[p7] or var7[collectionItemSize.Small])(p8)
				end
				sduiLogger.reportError(sduiErrors.SduiErrorType.NoPageLayoutConfig, {
					message = `No page layout config available for {p0}, returning default config`
				}, p0)
				
				return t
			end)
		end, { var7, p0, p5 })
	end
	return reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: getSduiServiceDependenciesStore (copy), p0 (ref), p6 (ref), var6 (write), p5 (ref), p3 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), p4 (ref)
		return {
			dependencies = getSduiServiceDependenciesStore().getDependencies(p0),
			appPage = p0,
			routeName = p6,
			getPageLayoutConfig = var6,
			appCompositionEnabled = p5 ~= nil or p5,
			dataUpdatedTimestamp = p3,
			configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p4 else nil
		}
	end, {
		p0, p6, var6, p3,
		if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p4 else nil,
		p5
	})
end
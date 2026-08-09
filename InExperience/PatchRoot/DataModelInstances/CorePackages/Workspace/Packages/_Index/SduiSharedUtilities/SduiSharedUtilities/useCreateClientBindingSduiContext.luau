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
local fFlagLuaAppCompositionSduiEnabled = sharedFlagsModule.FFlagLuaAppCompositionSduiEnabled
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local fFlagSduiChartsSupport = sharedFlagsModule.FFlagSduiChartsSupport
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport
local fFlagLuaAppSduiRouteName = sharedFlagsModule.FFlagLuaAppSduiRouteName
local fFlagEnableSduiV2HomeInterleave = sharedFlagsModule.FFlagEnableSduiV2HomeInterleave
local t = {
	numColumns = 3,
	fractionalItemAmount = 0,
	columnGap = 24,
	sideMargin = 24,
	verticalPadding = 16
}

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 48 | named "useCreateClientBindingSduiContext" ]]
	-- upvalues: fFlagLuaAppSduiRouteName (ref), fFlagLuaAppCompositionAlways (ref), fFlagLuaAppCompositionSduiEnabled (ref), fFlagEnableSduiV2HomeInterleave (ref), reactModule (ref), signalsModule (ref), t (ref), useCollectionLayoutConfig (ref), collectionItemSize (ref), sduiLogger (ref), sduiErrors (ref), getSduiServiceDependenciesStore (ref), fFlagSduiChartsSupport (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref)
	local var5 = if fFlagLuaAppSduiRouteName then p6 or p0 else nil
	local _ = nil
	local var6 = nil
	
	if not fFlagLuaAppCompositionAlways then
		if fFlagLuaAppCompositionSduiEnabled and not fFlagEnableSduiV2HomeInterleave then
			var6 = reactModule.useCallback(function(_) --[[ line: 65 ]]
				-- upvalues: signalsModule (copy), t (copy)
				return signalsModule.createComputed(function(_) --[[ line: 66 ]]
					-- upvalues: t (copy)
					return t
				end)
			end, {})
		else
			local var7 = useCollectionLayoutConfig(p1, p2)
			var6 = reactModule.useCallback(function(p7) --[[ line: 73 ]]
				-- upvalues: signalsModule (copy), fFlagEnableSduiV2HomeInterleave (copy), fFlagLuaAppCompositionSduiEnabled (copy), p5 (ref), t (copy), var7 (write), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p0 (ref)
				return signalsModule.createComputed(function(p8) --[[ line: 74 ]]
					-- upvalues: fFlagEnableSduiV2HomeInterleave (copy), fFlagLuaAppCompositionSduiEnabled (copy), p5 (copy), t (copy), var7 (copy), p7 (ref), collectionItemSize (copy), sduiLogger (copy), sduiErrors (copy), p0 (copy)
					if fFlagEnableSduiV2HomeInterleave and fFlagLuaAppCompositionSduiEnabled and p5 ~= false then
						return t
					elseif var7 then
						return (var7[p7] or var7[collectionItemSize.Small])(p8)
					end
					sduiLogger.reportError(sduiErrors.SduiErrorType.NoPageLayoutConfig, {
						message = `No page layout config available for {p0}, returning default config`
					}, p0)
					
					return t
				end)
			end, {
				var7,
				p0,
				if fFlagEnableSduiV2HomeInterleave then p5 else nil
			})
		end
	end
	return reactModule.useMemo(function() --[[ line: 105 ]]
		-- upvalues: getSduiServiceDependenciesStore (copy), p0 (ref), fFlagLuaAppSduiRouteName (copy), var5 (ref), var6 (write), fFlagEnableSduiV2HomeInterleave (copy), p5 (ref), fFlagLuaAppCompositionSduiEnabled (copy), fFlagSduiChartsSupport (copy), p3 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), p4 (ref)
		return {
			dependencies = getSduiServiceDependenciesStore().getDependencies(p0),
			appPage = p0,
			routeName = if fFlagLuaAppSduiRouteName then var5 else nil,
			getPageLayoutConfig = var6,
			appCompositionEnabled = if fFlagEnableSduiV2HomeInterleave and p5 ~= nil then p5 elseif fFlagLuaAppCompositionSduiEnabled then true else nil,
			dataUpdatedTimestamp = if fFlagSduiChartsSupport or fFlagEnableSduiV2HomeInterleave then p3 else nil,
			configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p4 else nil
		}
	end, {
		p0, if fFlagLuaAppSduiRouteName then var5 else nil, var6,
		if fFlagSduiChartsSupport or fFlagEnableSduiV2HomeInterleave then p3 else nil,
		if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p4 else nil,
		if fFlagEnableSduiV2HomeInterleave then p5 else nil
	})
end
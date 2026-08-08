local parent = script.Parent.Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local flyoutTestVariantRollout12 = game:DefineFastInt("FlyoutTestVariantRollout12", -1)
local enableFlyoutIxp11 = game:DefineFastFlag("EnableFlyoutIxp11", false)
local flyoutIxpLayer = game:DefineFastString("FlyoutIxpLayer", "Universality.MorePage")
local flyoutIxpVariantKey = game:DefineFastString("FlyoutIxpVariantKey", "flyout_side_panel_type")
local ixpFlyoutControl = game:DefineFastInt("IxpFlyoutControl", 0)
local ixpFlyoutVariantAlternateEntry = game:DefineFastInt("IxpFlyoutVariantAlternateEntry", 1)
local ixpFlyoutVariantHamburger = game:DefineFastInt("IxpFlyoutVariantHamburger", 2)
local ixpFlyoutVariantNoSubTabs = game:DefineFastInt("IxpFlyoutVariantNoSubTabs", 3)
local ixpFlyoutVariantRemovalRobuxIcon = game:DefineFastInt("IxpFlyoutVariantRemovalRobuxIcon", 4)
local flyoutShowFriendsSortForCurrentVariant = game:DefineFastFlag("FlyoutShowFriendsSortForCurrentVariant", false)
local enableFlyoutExposure = game:DefineFastFlag("EnableFlyoutExposure", false)
local flyoutHamburgerEnableProfileEntry = game:DefineFastFlag("FlyoutHamburgerEnableProfileEntry", false)
local flyoutFacepileEnableProfileEntry = game:DefineFastFlag("FlyoutFacepileEnableProfileEntry", false)
local flyoutDisallowAlternativeEntryOnProfileEntryEnabled = game:DefineFastFlag("FlyoutDisallowAlternativeEntryOnProfileEntryEnabled", false)
local fFlagSubTabRemoveFlyoutDependency = require(parent.SharedFlags).FFlagSubTabRemoveFlyoutDependency
local fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency = require(parent.SharedFlags).FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency
local hiddenFriendsSortHeaderAddSubTabDependency = game:DefineFastFlag("HiddenFriendsSortHeaderAddSubTabDependency", false)
local fFlagAppIaHomeSubTab = require(parent.SharedFlags).FFlagAppIaHomeSubTab
local var15 = nil

local function getIXPVariant() --[[ line: 32 ]]
	-- upvalues: flyoutTestVariantRollout12 (ref), enableFlyoutIxp11 (ref), ixpFlyoutControl (ref), var15 (write), experimentCacheManager (ref), flyoutIxpLayer (ref), enableFlyoutExposure (ref), flyoutIxpVariantKey (ref)
	if flyoutTestVariantRollout12 ~= -1 then
		return flyoutTestVariantRollout12
	elseif not enableFlyoutIxp11 then
		return ixpFlyoutControl
	elseif var15 == nil then
		local var17 = experimentCacheManager.default:getLayerVariables(flyoutIxpLayer)
		
		if enableFlyoutExposure and var17 ~= nil then
			experimentCacheManager.default:logLayerExposure(flyoutIxpLayer)
		end
		var15 = var17 or {}
	end
	local var18 = var15[flyoutIxpVariantKey]
	
	return if var18 == nil then ixpFlyoutControl else tonumber(var18)
end

return {
	isFlyoutSidePanelEnabled = function() --[[ line: 54 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isRobloxLogoEnabled = function() --[[ line: 60 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isProfileEntryRemoved = function() --[[ line: 66 ]]
		-- upvalues: getIXPVariant (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var19 = getIXPVariant()
		
		return if flyoutHamburgerEnableProfileEntry and var19 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var19 == ixpFlyoutVariantAlternateEntry or var19 == ixpFlyoutVariantNoSubTabs) then false else var19 ~= ixpFlyoutControl
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function() --[[ line: 80 ]]
		-- upvalues: fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency (ref), hiddenFriendsSortHeaderAddSubTabDependency (ref), fFlagAppIaHomeSubTab (ref), flyoutShowFriendsSortForCurrentVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		return if fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency then if hiddenFriendsSortHeaderAddSubTabDependency then fFlagAppIaHomeSubTab and not flyoutShowFriendsSortForCurrentVariant else not flyoutShowFriendsSortForCurrentVariant else getIXPVariant() ~= ixpFlyoutControl and not flyoutShowFriendsSortForCurrentVariant
	end,
	isAlternateEntryPointEnabled = function() --[[ line: 91 ]]
		-- upvalues: getIXPVariant (ref), flyoutDisallowAlternativeEntryOnProfileEntryEnabled (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var20 = getIXPVariant()
		
		if flyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			local var21 = getIXPVariant()
			local var22 = if flyoutHamburgerEnableProfileEntry and var21 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var21 == ixpFlyoutVariantAlternateEntry or var21 == ixpFlyoutVariantNoSubTabs) then false else var21 ~= ixpFlyoutControl
			
			if var22 then
				var22 = if var20 ~= ixpFlyoutVariantAlternateEntry then var20 == ixpFlyoutVariantNoSubTabs else true
			end
			return var22
		else
			return if var20 ~= ixpFlyoutVariantAlternateEntry then var20 == ixpFlyoutVariantNoSubTabs else true
		end
	end,
	isRobuxIconRemoved = function() --[[ line: 102 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutVariantRemovalRobuxIcon (ref)
		return getIXPVariant() == ixpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function() --[[ line: 108 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isHomeSubTabEnabled = function() --[[ line: 113 ]]
		-- upvalues: fFlagSubTabRemoveFlyoutDependency (ref), getIXPVariant (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantHamburger (ref)
		if fFlagSubTabRemoveFlyoutDependency then
			return true
		end
		local var23 = getIXPVariant()
		
		return if var23 ~= ixpFlyoutVariantAlternateEntry then var23 == ixpFlyoutVariantHamburger else true
	end
}
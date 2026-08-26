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
local var1 = nil

local function getIXPVariant()
	-- upvalues: flyoutTestVariantRollout12 (ref), enableFlyoutIxp11 (ref), ixpFlyoutControl (ref), var1 (write), experimentCacheManager (ref), flyoutIxpLayer (ref), enableFlyoutExposure (ref), flyoutIxpVariantKey (ref)
	if flyoutTestVariantRollout12 ~= -1 then
		return flyoutTestVariantRollout12
	elseif not enableFlyoutIxp11 then
		return ixpFlyoutControl
	elseif var1 == nil then
		local var2 = experimentCacheManager.default:getLayerVariables(flyoutIxpLayer)
		
		if enableFlyoutExposure and var2 ~= nil then
			experimentCacheManager.default:logLayerExposure(flyoutIxpLayer)
		end
		var1 = var2 or {}
	end
	local var3 = var1[flyoutIxpVariantKey]
	
	return if var3 == nil then ixpFlyoutControl else tonumber(var3)
end

return {
	isFlyoutSidePanelEnabled = function()
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isRobloxLogoEnabled = function()
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isProfileEntryRemoved = function()
		-- upvalues: getIXPVariant (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var2 = getIXPVariant()
		
		return if flyoutHamburgerEnableProfileEntry and var2 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var2 == ixpFlyoutVariantAlternateEntry or var2 == ixpFlyoutVariantNoSubTabs) then false else var2 ~= ixpFlyoutControl
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function()
		-- upvalues: fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency (ref), hiddenFriendsSortHeaderAddSubTabDependency (ref), fFlagAppIaHomeSubTab (ref), flyoutShowFriendsSortForCurrentVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		return if fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency then if hiddenFriendsSortHeaderAddSubTabDependency then fFlagAppIaHomeSubTab and not flyoutShowFriendsSortForCurrentVariant else not flyoutShowFriendsSortForCurrentVariant else getIXPVariant() ~= ixpFlyoutControl and not flyoutShowFriendsSortForCurrentVariant
	end,
	isAlternateEntryPointEnabled = function()
		-- upvalues: getIXPVariant (ref), flyoutDisallowAlternativeEntryOnProfileEntryEnabled (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var2 = getIXPVariant()
		
		if flyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			local var3 = getIXPVariant()
			local var4 = if flyoutHamburgerEnableProfileEntry and var3 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var3 == ixpFlyoutVariantAlternateEntry or var3 == ixpFlyoutVariantNoSubTabs) then false else var3 ~= ixpFlyoutControl
			
			if var4 then
				var4 = if var2 ~= ixpFlyoutVariantAlternateEntry then var2 == ixpFlyoutVariantNoSubTabs else true
			end
			return var4
		else
			return if var2 ~= ixpFlyoutVariantAlternateEntry then var2 == ixpFlyoutVariantNoSubTabs else true
		end
	end,
	isRobuxIconRemoved = function()
		-- upvalues: getIXPVariant (ref), ixpFlyoutVariantRemovalRobuxIcon (ref)
		return getIXPVariant() == ixpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function()
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isHomeSubTabEnabled = function()
		-- upvalues: fFlagSubTabRemoveFlyoutDependency (ref), getIXPVariant (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantHamburger (ref)
		if fFlagSubTabRemoveFlyoutDependency then
			return true
		end
		local var2 = getIXPVariant()
		
		return if var2 ~= ixpFlyoutVariantAlternateEntry then var2 == ixpFlyoutVariantHamburger else true
	end
}
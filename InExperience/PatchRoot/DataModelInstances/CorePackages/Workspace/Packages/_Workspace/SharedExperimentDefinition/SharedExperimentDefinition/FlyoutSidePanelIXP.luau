local experimentCacheManager = require(script.Parent.Parent.ExperimentCacheManager).ExperimentCacheManager
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
local var14 = nil

local function getIXPVariant() --[[ line: 26 ]]
	-- upvalues: flyoutTestVariantRollout12 (ref), enableFlyoutIxp11 (ref), ixpFlyoutControl (ref), var14 (write), experimentCacheManager (ref), flyoutIxpLayer (ref), enableFlyoutExposure (ref), flyoutIxpVariantKey (ref)
	if flyoutTestVariantRollout12 ~= -1 then
		return flyoutTestVariantRollout12
	elseif not enableFlyoutIxp11 then
		return ixpFlyoutControl
	elseif var14 == nil then
		local var16 = experimentCacheManager.default:getLayerVariables(flyoutIxpLayer)
		
		if enableFlyoutExposure and var16 ~= nil then
			experimentCacheManager.default:logLayerExposure(flyoutIxpLayer)
		end
		var14 = var16 or {}
	end
	local var17 = var14[flyoutIxpVariantKey]
	
	return if var17 == nil then ixpFlyoutControl else tonumber(var17)
end

return {
	isFlyoutSidePanelEnabled = function() --[[ line: 47 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isRobloxLogoEnabled = function() --[[ line: 53 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isProfileEntryRemoved = function() --[[ line: 59 ]]
		-- upvalues: getIXPVariant (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var18 = getIXPVariant()
		
		return if flyoutHamburgerEnableProfileEntry and var18 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var18 == ixpFlyoutVariantAlternateEntry or var18 == ixpFlyoutVariantNoSubTabs) then false else var18 ~= ixpFlyoutControl
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function() --[[ line: 73 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref), flyoutShowFriendsSortForCurrentVariant (ref)
		return getIXPVariant() ~= ixpFlyoutControl and not flyoutShowFriendsSortForCurrentVariant
	end,
	isAlternateEntryPointEnabled = function() --[[ line: 78 ]]
		-- upvalues: getIXPVariant (ref), flyoutDisallowAlternativeEntryOnProfileEntryEnabled (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var19 = getIXPVariant()
		
		if flyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			local var20 = getIXPVariant()
			local var21 = if flyoutHamburgerEnableProfileEntry and var20 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var20 == ixpFlyoutVariantAlternateEntry or var20 == ixpFlyoutVariantNoSubTabs) then false else var20 ~= ixpFlyoutControl
			
			if var21 then
				var21 = if var19 ~= ixpFlyoutVariantAlternateEntry then var19 == ixpFlyoutVariantNoSubTabs else true
			end
			return var21
		else
			return if var19 ~= ixpFlyoutVariantAlternateEntry then var19 == ixpFlyoutVariantNoSubTabs else true
		end
	end,
	isRobuxIconRemoved = function() --[[ line: 89 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutVariantRemovalRobuxIcon (ref)
		return getIXPVariant() == ixpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function() --[[ line: 95 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutControl (ref)
		return getIXPVariant() ~= ixpFlyoutControl
	end,
	isHomeSubTabEnabled = function() --[[ line: 100 ]]
		-- upvalues: getIXPVariant (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantHamburger (ref)
		local var22 = getIXPVariant()
		
		return if var22 ~= ixpFlyoutVariantAlternateEntry then var22 == ixpFlyoutVariantHamburger else true
	end
}
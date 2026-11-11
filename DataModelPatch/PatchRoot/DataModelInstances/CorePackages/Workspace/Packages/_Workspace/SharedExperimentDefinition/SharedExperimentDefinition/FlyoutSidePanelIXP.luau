local ExperimentCacheManager = require(script.Parent.Parent.ExperimentCacheManager).ExperimentCacheManager
local FlyoutTestVariantRollout12 = game:DefineFastInt("FlyoutTestVariantRollout12", -1)
local EnableFlyoutIxp11 = game:DefineFastFlag("EnableFlyoutIxp11", false)
local FlyoutIxpLayer = game:DefineFastString("FlyoutIxpLayer", "Universality.MorePage")
local FlyoutIxpVariantKey = game:DefineFastString("FlyoutIxpVariantKey", "flyout_side_panel_type")
local IxpFlyoutControl = game:DefineFastInt("IxpFlyoutControl", 0)
local IxpFlyoutVariantAlternateEntry = game:DefineFastInt("IxpFlyoutVariantAlternateEntry", 1)
local IxpFlyoutVariantHamburger = game:DefineFastInt("IxpFlyoutVariantHamburger", 2)
local IxpFlyoutVariantNoSubTabs = game:DefineFastInt("IxpFlyoutVariantNoSubTabs", 3)
local IxpFlyoutVariantRemovalRobuxIcon = game:DefineFastInt("IxpFlyoutVariantRemovalRobuxIcon", 4)
local FlyoutShowFriendsSortForCurrentVariant = game:DefineFastFlag("FlyoutShowFriendsSortForCurrentVariant", false)
local EnableFlyoutExposure = game:DefineFastFlag("EnableFlyoutExposure", false)
local FlyoutHamburgerEnableProfileEntry = game:DefineFastFlag("FlyoutHamburgerEnableProfileEntry", false)
local FlyoutFacepileEnableProfileEntry = game:DefineFastFlag("FlyoutFacepileEnableProfileEntry", false)
local FlyoutDisallowAlternativeEntryOnProfileEntryEnabled = game:DefineFastFlag("FlyoutDisallowAlternativeEntryOnProfileEntryEnabled", false)
local v1 = nil

local function getIXPVariant()
	-- upvalues: FlyoutTestVariantRollout12 (copy), EnableFlyoutIxp11 (copy), IxpFlyoutControl (copy), v1 (ref), ExperimentCacheManager (copy), FlyoutIxpLayer (copy), EnableFlyoutExposure (copy), FlyoutIxpVariantKey (copy)
	if FlyoutTestVariantRollout12 ~= -1 then
		return FlyoutTestVariantRollout12
	end
	if not EnableFlyoutIxp11 then
		return IxpFlyoutControl
	end
	if v1 == nil then
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FlyoutIxpLayer)
		
		if EnableFlyoutExposure and LayerVariables ~= nil then
			ExperimentCacheManager.default:logLayerExposure(FlyoutIxpLayer)
		end
		v1 = LayerVariables or {}
	end
	local v2 = v1[FlyoutIxpVariantKey]
	
	return if v2 == nil then IxpFlyoutControl else tonumber(v2)
end

return {
	isFlyoutSidePanelEnabled = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutControl (copy)
		return getIXPVariant() ~= IxpFlyoutControl
	end,
	isRobloxLogoEnabled = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutControl (copy)
		return getIXPVariant() ~= IxpFlyoutControl
	end,
	isProfileEntryRemoved = function(): boolean
		-- upvalues: getIXPVariant (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IXPVariant = getIXPVariant()
		
		return (not FlyoutHamburgerEnableProfileEntry or IXPVariant ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IXPVariant ~= IxpFlyoutVariantAlternateEntry and IXPVariant ~= IxpFlyoutVariantNoSubTabs) and IXPVariant ~= IxpFlyoutControl)
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutControl (copy), FlyoutShowFriendsSortForCurrentVariant (copy)
		return getIXPVariant() ~= IxpFlyoutControl and not FlyoutShowFriendsSortForCurrentVariant
	end,
	isAlternateEntryPointEnabled = function(): boolean
		-- upvalues: getIXPVariant (copy), FlyoutDisallowAlternativeEntryOnProfileEntryEnabled (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IXPVariant = getIXPVariant()
		
		if FlyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			local IXPVariant1 = getIXPVariant()
			
			return (not FlyoutHamburgerEnableProfileEntry or IXPVariant1 ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IXPVariant1 ~= IxpFlyoutVariantAlternateEntry and IXPVariant1 ~= IxpFlyoutVariantNoSubTabs) and IXPVariant1 ~= IxpFlyoutControl) and (IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantNoSubTabs)
		else
			return IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantNoSubTabs
		end
	end,
	isRobuxIconRemoved = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutVariantRemovalRobuxIcon (copy)
		return getIXPVariant() == IxpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutControl (copy)
		return getIXPVariant() ~= IxpFlyoutControl
	end,
	isHomeSubTabEnabled = function(): boolean
		-- upvalues: getIXPVariant (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantHamburger (copy)
		local IXPVariant = getIXPVariant()
		
		return IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantHamburger
	end
}
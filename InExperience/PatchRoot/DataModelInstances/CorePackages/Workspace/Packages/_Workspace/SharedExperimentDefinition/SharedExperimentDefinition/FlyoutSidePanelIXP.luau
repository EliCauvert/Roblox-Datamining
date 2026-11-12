local Parent = script.Parent.Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
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
local FFlagSubTabRemoveFlyoutDependency = require(Parent.SharedFlags).FFlagSubTabRemoveFlyoutDependency
local FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency = require(Parent.SharedFlags).FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency
local HiddenFriendsSortHeaderAddSubTabDependency = game:DefineFastFlag("HiddenFriendsSortHeaderAddSubTabDependency", false)
local FFlagAppIaHomeSubTab = require(Parent.SharedFlags).FFlagAppIaHomeSubTab
local FFlagEnableSubTabOverride = require(Parent.SharedFlags).FFlagEnableSubTabOverride
local FFlagSubTabHideChartsForNonArgo = require(Parent.SharedFlags).FFlagSubTabHideChartsForNonArgo
local FFlagEnableChartsInFlyout = require(Parent.SharedFlags).FFlagEnableChartsInFlyout
local FlyoutAmpGatedVariant = game:DefineFastInt("FlyoutAmpGatedVariant", 2)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local v1 = nil
local v2 = nil

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
	local v3 = v1[FlyoutIxpVariantKey]
	
	return if v3 == nil then IxpFlyoutControl else tonumber(v3)
end

local function _()
	-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy)
	if v2 == nil then
		v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
		
		return v2
	else
		return v2
	end
end

return {
	isFlyoutSidePanelEnabled = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IxpFlyoutControl1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutControl1 = v2
		else
			IxpFlyoutControl1 = v2
		end
		return IxpFlyoutControl1 ~= IxpFlyoutControl
	end,
	isRobloxLogoEnabled = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IxpFlyoutControl1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutControl1 = v2
		else
			IxpFlyoutControl1 = v2
		end
		return IxpFlyoutControl1 ~= IxpFlyoutControl
	end,
	isProfileEntryRemoved = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IxpFlyoutControl1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutControl1 = v2
		else
			IxpFlyoutControl1 = v2
		end
		return (not FlyoutHamburgerEnableProfileEntry or IxpFlyoutControl1 ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IxpFlyoutControl1 ~= IxpFlyoutVariantAlternateEntry and IxpFlyoutControl1 ~= IxpFlyoutVariantNoSubTabs) and IxpFlyoutControl1 ~= IxpFlyoutControl)
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function(): boolean
		-- upvalues: FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency (copy), FFlagEnableSubTabOverride (copy), FlyoutShowFriendsSortForCurrentVariant (copy), FFlagEnableChartsInFlyout (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy), HiddenFriendsSortHeaderAddSubTabDependency (copy), FFlagAppIaHomeSubTab (copy)
		if FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency then
			if FFlagEnableSubTabOverride then
				return not FlyoutShowFriendsSortForCurrentVariant
			end
			local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
			
			if FFlagEnableChartsInFlyout1 then
				local IxpFlyoutControl1 = nil
				if v2 == nil then
					v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
					IxpFlyoutControl1 = v2
				else
					IxpFlyoutControl1 = v2
				end
				FFlagEnableChartsInFlyout1 = IxpFlyoutControl1 ~= IxpFlyoutControl
			end
			return not FFlagEnableChartsInFlyout1 and (if HiddenFriendsSortHeaderAddSubTabDependency then FFlagAppIaHomeSubTab and not FlyoutShowFriendsSortForCurrentVariant else not FlyoutShowFriendsSortForCurrentVariant)
		else
			local IxpFlyoutControl2 = nil
			if v2 == nil then
				v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IxpFlyoutControl2 = v2
			else
				IxpFlyoutControl2 = v2
			end
			return IxpFlyoutControl2 ~= IxpFlyoutControl and not FlyoutShowFriendsSortForCurrentVariant
		end
	end,
	isAlternateEntryPointEnabled = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), FlyoutDisallowAlternativeEntryOnProfileEntryEnabled (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IxpFlyoutVariantAlternateEntry1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutVariantAlternateEntry1 = v2
		else
			IxpFlyoutVariantAlternateEntry1 = v2
		end
		if not FlyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			return IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantAlternateEntry or IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantNoSubTabs
		end
		local IxpFlyoutControl1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutControl1 = v2
		else
			IxpFlyoutControl1 = v2
		end
		return (not FlyoutHamburgerEnableProfileEntry or IxpFlyoutControl1 ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IxpFlyoutControl1 ~= IxpFlyoutVariantAlternateEntry and IxpFlyoutControl1 ~= IxpFlyoutVariantNoSubTabs) and IxpFlyoutControl1 ~= IxpFlyoutControl) and (IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantAlternateEntry or IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantNoSubTabs)
	end,
	isRobuxIconRemoved = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutVariantRemovalRobuxIcon (copy)
		local IxpFlyoutVariantRemovalRobuxIcon1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutVariantRemovalRobuxIcon1 = v2
		else
			IxpFlyoutVariantRemovalRobuxIcon1 = v2
		end
		return IxpFlyoutVariantRemovalRobuxIcon1 == IxpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function(): boolean
		-- upvalues: v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IxpFlyoutControl1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutControl1 = v2
		else
			IxpFlyoutControl1 = v2
		end
		return IxpFlyoutControl1 ~= IxpFlyoutControl
	end,
	isHomeSubTabEnabled = function(): boolean
		-- upvalues: FFlagEnableSubTabOverride (copy), FFlagEnableChartsInFlyout (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy), FFlagSubTabRemoveFlyoutDependency (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantHamburger (copy)
		if FFlagEnableSubTabOverride then
			return true
		end
		local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
		
		if FFlagEnableChartsInFlyout1 then
			local IxpFlyoutControl1 = nil
			if v2 == nil then
				v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IxpFlyoutControl1 = v2
			else
				IxpFlyoutControl1 = v2
			end
			FFlagEnableChartsInFlyout1 = IxpFlyoutControl1 ~= IxpFlyoutControl
		end
		if FFlagEnableChartsInFlyout1 then
			return false
		end
		if FFlagSubTabRemoveFlyoutDependency then
			return true
		end
		local IxpFlyoutVariantAlternateEntry1 = nil
		if v2 == nil then
			v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
			IxpFlyoutVariantAlternateEntry1 = v2
		else
			IxpFlyoutVariantAlternateEntry1 = v2
		end
		return IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantAlternateEntry or IxpFlyoutVariantAlternateEntry1 == IxpFlyoutVariantHamburger
	end,
	isChartsInSubTab = function(): boolean
		-- upvalues: FFlagSubTabHideChartsForNonArgo (copy), FFlagEnableChartsInFlyout (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local FFlagSubTabHideChartsForNonArgo1: boolean = FFlagSubTabHideChartsForNonArgo
		
		if not FFlagSubTabHideChartsForNonArgo1 then
			FFlagSubTabHideChartsForNonArgo1 = FFlagEnableChartsInFlyout
			
			if FFlagSubTabHideChartsForNonArgo1 then
				local IxpFlyoutControl1 = nil
				if v2 == nil then
					v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
					IxpFlyoutControl1 = v2
				else
					IxpFlyoutControl1 = v2
				end
				FFlagSubTabHideChartsForNonArgo1 = IxpFlyoutControl1 ~= IxpFlyoutControl
			end
		end
		return not FFlagSubTabHideChartsForNonArgo1
	end,
	isChartsInFlyoutEnabled = function(): boolean
		-- upvalues: FFlagEnableChartsInFlyout (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
		
		if FFlagEnableChartsInFlyout1 then
			local IxpFlyoutControl1 = nil
			if v2 == nil then
				v2 = if UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IxpFlyoutControl1 = v2
			else
				IxpFlyoutControl1 = v2
			end
			FFlagEnableChartsInFlyout1 = IxpFlyoutControl1 ~= IxpFlyoutControl
		end
		return FFlagEnableChartsInFlyout1
	end
}
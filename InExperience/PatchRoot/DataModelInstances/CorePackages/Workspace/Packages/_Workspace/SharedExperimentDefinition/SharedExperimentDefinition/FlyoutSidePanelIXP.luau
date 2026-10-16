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
local FFlagEnableChartsInFlyout = require(Parent.SharedFlags).FFlagEnableChartsInFlyout
local FlyoutAmpGatedVariant = game:DefineFastInt("FlyoutAmpGatedVariant", 2)
local FFlagFlyoutSidePanelUseAppPolicy = require(Parent.SharedFlags).FFlagFlyoutSidePanelUseAppPolicy
local UniversalAppPolicyModule = if FFlagFlyoutSidePanelUseAppPolicy then require(Parent.UniversalAppPolicy) else nil
local v1 = nil
local v2 = nil

local function getIXPVariant() --[[ Line: 40 ]]
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

local function _() --[[ Line: 61 | Named "getVariant" ]]
	-- upvalues: v2 (ref), FFlagFlyoutSidePanelUseAppPolicy (copy), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy)
	if v2 == nil then
		v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
		
		return v2
	else
		return v2
	end
end

return {
	isFlyoutSidePanelEnabled = function(): boolean --[[ Line: 76 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return IXPVariant ~= IxpFlyoutControl
	end,
	isRobloxLogoEnabled = function(): boolean --[[ Line: 82 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return IXPVariant ~= IxpFlyoutControl
	end,
	isProfileEntryRemoved = function(): boolean --[[ Line: 88 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return (not FlyoutHamburgerEnableProfileEntry or IXPVariant ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IXPVariant ~= IxpFlyoutVariantAlternateEntry and IXPVariant ~= IxpFlyoutVariantNoSubTabs) and IXPVariant ~= IxpFlyoutControl)
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function(): boolean --[[ Line: 106 ]]
		-- upvalues: FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency (copy), FFlagEnableChartsInFlyout (copy), FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy), HiddenFriendsSortHeaderAddSubTabDependency (copy), FFlagAppIaHomeSubTab (copy), FlyoutShowFriendsSortForCurrentVariant (copy)
		if FFlagHiddenFriendsSortHeaderRemoveFlyoutDependency then
			local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
			
			if FFlagEnableChartsInFlyout1 then
				local IXPVariant = nil
				if FFlagFlyoutSidePanelUseAppPolicy then
					if v2 == nil then
						v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
						IXPVariant = v2
					else
						IXPVariant = v2
					end
				else
					IXPVariant = getIXPVariant()
				end
				FFlagEnableChartsInFlyout1 = IXPVariant ~= IxpFlyoutControl
			end
			return not FFlagEnableChartsInFlyout1 and (if HiddenFriendsSortHeaderAddSubTabDependency then FFlagAppIaHomeSubTab and not FlyoutShowFriendsSortForCurrentVariant else not FlyoutShowFriendsSortForCurrentVariant)
		else
			local IXPVariant = nil
			if FFlagFlyoutSidePanelUseAppPolicy then
				if v2 == nil then
					v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
					IXPVariant = v2
				else
					IXPVariant = v2
				end
			else
				IXPVariant = getIXPVariant()
			end
			return IXPVariant ~= IxpFlyoutControl and not FlyoutShowFriendsSortForCurrentVariant
		end
	end,
	isAlternateEntryPointEnabled = function(): boolean --[[ Line: 120 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), FlyoutDisallowAlternativeEntryOnProfileEntryEnabled (copy), FlyoutHamburgerEnableProfileEntry (copy), IxpFlyoutVariantHamburger (copy), FlyoutFacepileEnableProfileEntry (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantNoSubTabs (copy), IxpFlyoutControl (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		if not FlyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			return IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantNoSubTabs
		end
		local IXPVariant1 = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant1 = v2
			else
				IXPVariant1 = v2
			end
		else
			IXPVariant1 = getIXPVariant()
		end
		return (not FlyoutHamburgerEnableProfileEntry or IXPVariant1 ~= IxpFlyoutVariantHamburger) and ((not FlyoutFacepileEnableProfileEntry or IXPVariant1 ~= IxpFlyoutVariantAlternateEntry and IXPVariant1 ~= IxpFlyoutVariantNoSubTabs) and IXPVariant1 ~= IxpFlyoutControl) and (IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantNoSubTabs)
	end,
	isRobuxIconRemoved = function(): boolean --[[ Line: 131 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutVariantRemovalRobuxIcon (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return IXPVariant == IxpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function(): boolean --[[ Line: 137 ]]
		-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return IXPVariant ~= IxpFlyoutControl
	end,
	isHomeSubTabEnabled = function(): boolean --[[ Line: 142 ]]
		-- upvalues: FFlagEnableChartsInFlyout (copy), FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy), FFlagSubTabRemoveFlyoutDependency (copy), IxpFlyoutVariantAlternateEntry (copy), IxpFlyoutVariantHamburger (copy)
		local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
		
		if FFlagEnableChartsInFlyout1 then
			local IXPVariant = nil
			if FFlagFlyoutSidePanelUseAppPolicy then
				if v2 == nil then
					v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
					IXPVariant = v2
				else
					IXPVariant = v2
				end
			else
				IXPVariant = getIXPVariant()
			end
			FFlagEnableChartsInFlyout1 = IXPVariant ~= IxpFlyoutControl
		end
		if FFlagEnableChartsInFlyout1 then
			return false
		end
		if FFlagSubTabRemoveFlyoutDependency then
			return true
		end
		local IXPVariant = nil
		if FFlagFlyoutSidePanelUseAppPolicy then
			if v2 == nil then
				v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
				IXPVariant = v2
			else
				IXPVariant = v2
			end
		else
			IXPVariant = getIXPVariant()
		end
		return IXPVariant == IxpFlyoutVariantAlternateEntry or IXPVariant == IxpFlyoutVariantHamburger
	end,
	isChartsInFlyoutEnabled = function(): boolean --[[ Line: 102 ]]
		-- upvalues: FFlagEnableChartsInFlyout (copy), FFlagFlyoutSidePanelUseAppPolicy (copy), v2 (ref), UniversalAppPolicyModule (copy), FlyoutAmpGatedVariant (copy), getIXPVariant (copy), IxpFlyoutControl (copy)
		local FFlagEnableChartsInFlyout1: boolean = FFlagEnableChartsInFlyout
		
		if FFlagEnableChartsInFlyout1 then
			local IXPVariant = nil
			if FFlagFlyoutSidePanelUseAppPolicy then
				if v2 == nil then
					v2 = if FFlagFlyoutSidePanelUseAppPolicy and UniversalAppPolicyModule.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then FlyoutAmpGatedVariant else getIXPVariant()
					IXPVariant = v2
				else
					IXPVariant = v2
				end
			else
				IXPVariant = getIXPVariant()
			end
			FFlagEnableChartsInFlyout1 = IXPVariant ~= IxpFlyoutControl
		end
		return FFlagEnableChartsInFlyout1
	end
}
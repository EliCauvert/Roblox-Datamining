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
local flyoutAmpGatedVariant = game:DefineFastInt("FlyoutAmpGatedVariant", 2)
local fFlagFlyoutSidePanelUseAppPolicy = require(parent.SharedFlags).FFlagFlyoutSidePanelUseAppPolicy
local var1 = if fFlagFlyoutSidePanelUseAppPolicy then require(parent.UniversalAppPolicy) else nil
local var2 = nil
local var3 = nil

local function getIXPVariant()
	-- upvalues: flyoutTestVariantRollout12 (ref), enableFlyoutIxp11 (ref), ixpFlyoutControl (ref), var2 (write), experimentCacheManager (ref), flyoutIxpLayer (ref), enableFlyoutExposure (ref), flyoutIxpVariantKey (ref)
	if flyoutTestVariantRollout12 ~= -1 then
		return flyoutTestVariantRollout12
	elseif not enableFlyoutIxp11 then
		return ixpFlyoutControl
	elseif var2 == nil then
		local var4 = experimentCacheManager.default:getLayerVariables(flyoutIxpLayer)
		
		if enableFlyoutExposure and var4 ~= nil then
			experimentCacheManager.default:logLayerExposure(flyoutIxpLayer)
		end
		var2 = var4 or {}
	end
	local var5 = var2[flyoutIxpVariantKey]
	
	return if var5 == nil then ixpFlyoutControl else tonumber(var5)
end

local function _()
	-- upvalues: var3 (write), fFlagFlyoutSidePanelUseAppPolicy (ref), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref)
	if var3 ~= nil then
		return var3
	end
	var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
	
	return var3
end

return {
	isFlyoutSidePanelEnabled = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return var4 ~= ixpFlyoutControl
	end,
	isRobloxLogoEnabled = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return var4 ~= ixpFlyoutControl
	end,
	isProfileEntryRemoved = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return if flyoutHamburgerEnableProfileEntry and var4 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var4 == ixpFlyoutVariantAlternateEntry or var4 == ixpFlyoutVariantNoSubTabs) then false else var4 ~= ixpFlyoutControl
	end,
	isFriendsSortHeaderHiddenInFlyoutIxp = function()
		-- upvalues: fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency (ref), hiddenFriendsSortHeaderAddSubTabDependency (ref), fFlagAppIaHomeSubTab (ref), flyoutShowFriendsSortForCurrentVariant (ref), fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		local var4
		if fFlagHiddenFriendsSortHeaderRemoveFlyoutDependency then
			return if hiddenFriendsSortHeaderAddSubTabDependency then fFlagAppIaHomeSubTab and not flyoutShowFriendsSortForCurrentVariant else not flyoutShowFriendsSortForCurrentVariant
		elseif not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return var4 ~= ixpFlyoutControl and not flyoutShowFriendsSortForCurrentVariant
	end,
	isAlternateEntryPointEnabled = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), flyoutDisallowAlternativeEntryOnProfileEntryEnabled (ref), flyoutHamburgerEnableProfileEntry (ref), ixpFlyoutVariantHamburger (ref), flyoutFacepileEnableProfileEntry (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantNoSubTabs (ref), ixpFlyoutControl (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		if flyoutDisallowAlternativeEntryOnProfileEntryEnabled then
			local var5
			if not fFlagFlyoutSidePanelUseAppPolicy then
				var5 = getIXPVariant()
			elseif var3 == nil then
				var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
				var5 = var3
			else
				var5 = var3
			end
			local var6 = if flyoutHamburgerEnableProfileEntry and var5 == ixpFlyoutVariantHamburger then false elseif flyoutFacepileEnableProfileEntry and (var5 == ixpFlyoutVariantAlternateEntry or var5 == ixpFlyoutVariantNoSubTabs) then false else var5 ~= ixpFlyoutControl
			
			if var6 then
				var6 = if var4 ~= ixpFlyoutVariantAlternateEntry then var4 == ixpFlyoutVariantNoSubTabs else true
			end
			return var6
		else
			return if var4 ~= ixpFlyoutVariantAlternateEntry then var4 == ixpFlyoutVariantNoSubTabs else true
		end
	end,
	isRobuxIconRemoved = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutVariantRemovalRobuxIcon (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return var4 == ixpFlyoutVariantRemovalRobuxIcon
	end,
	isScrollAwayEnabled = function()
		-- upvalues: fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutControl (ref)
		local var4
		if not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return var4 ~= ixpFlyoutControl
	end,
	isHomeSubTabEnabled = function()
		-- upvalues: fFlagSubTabRemoveFlyoutDependency (ref), fFlagFlyoutSidePanelUseAppPolicy (ref), var3 (write), var1 (ref), flyoutAmpGatedVariant (ref), getIXPVariant (ref), ixpFlyoutVariantAlternateEntry (ref), ixpFlyoutVariantHamburger (ref)
		local var4
		if fFlagSubTabRemoveFlyoutDependency then
			return true
		elseif not fFlagFlyoutSidePanelUseAppPolicy then
			var4 = getIXPVariant()
		elseif var3 == nil then
			var3 = if fFlagFlyoutSidePanelUseAppPolicy and var1.getAppFeaturePolicies().getFlyoutSidePanelEnabled() then flyoutAmpGatedVariant else getIXPVariant()
			var4 = var3
		else
			var4 = var3
		end
		return if var4 ~= ixpFlyoutVariantAlternateEntry then var4 == ixpFlyoutVariantHamburger else true
	end
}
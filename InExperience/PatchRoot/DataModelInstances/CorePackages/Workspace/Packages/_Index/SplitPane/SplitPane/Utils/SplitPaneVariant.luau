local Parent = script:FindFirstAncestor("SplitPane").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local AppSplitViewModule = require(Parent.AppSplitView)
local SplitPaneSlot = AppSplitViewModule.Enums.SplitPaneSlot
local FFlagSplitPaneExperimentVariants = SharedFlagsModule.FFlagSplitPaneExperimentVariants
local FFlagSplitPaneVariantDefaultCollapsed = SharedFlagsModule.FFlagSplitPaneVariantDefaultCollapsed
local FFlagSplitPaneVariantAvatarOnHomeOnly = SharedFlagsModule.FFlagSplitPaneVariantAvatarOnHomeOnly
local FFlagSplitPaneVariantCollapsedAutoOpen = SharedFlagsModule.FFlagSplitPaneVariantCollapsedAutoOpen
local config = {
	name = "DefaultOpen",
	defaultOpen = true,
	autoExpandOnSupportOpen = true,
	avatarOnHome = true,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = true
}
local config1 = {
	name = "DefaultCollapsed",
	defaultOpen = false,
	autoExpandOnSupportOpen = false,
	avatarOnHome = true,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = false,
	educationModal = true
}
local config2 = {
	name = "AvatarOnHomeOnly",
	defaultOpen = true,
	autoExpandOnSupportOpen = true,
	avatarOnHome = true,
	supportSlotEligible = false,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = true
}
local config3 = {
	name = "CollapsedAutoOpen",
	defaultOpen = false,
	autoExpandOnSupportOpen = true,
	avatarOnHome = false,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = false
}
local Flag = false
local config4 = config

local function _() --[[ Line: 87 | Named "resolveVariant" ]]
	-- upvalues: config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), Flag (ref), config4 (ref)
	local Config = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
	Flag = true
	config4 = Config
	
	return Config
end

return {
	getVariantConfig = function() --[[ Line: 102 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return config4
	end,
	isPaneCollapsedByDefault = function(): boolean --[[ Line: 109 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return not config4.defaultOpen
	end,
	shouldAutoExpandOnSupportOpen = function() --[[ Line: 113 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return config4.autoExpandOnSupportOpen
	end,
	shouldCollapseOnSupportClose = function(): boolean --[[ Line: 118 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return not config4.avatarOnHome
	end,
	shouldShowAvatarOnHome = function() --[[ Line: 122 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return config4.avatarOnHome
	end,
	isEducationModalEnabled = function() --[[ Line: 126 ]]
		-- upvalues: Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref)
		if not Flag then
			Flag = true
			config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
		end
		return config4.educationModal
	end,
	getGameDetailsSplitPaneEligibility = function() --[[ Line: 132 ]]
		-- upvalues: FFlagSplitPaneExperimentVariants (copy), Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref), SplitPaneSlot (copy)
		if FFlagSplitPaneExperimentVariants then
			if not Flag then
				Flag = true
				config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
			end
			if not config4.supportSlotEligible then
				return nil
			end
		end
		return SplitPaneSlot.Support
	end,
	getProfileSplitPaneEligibility = function(Collapsed) --[[ Line: 139 ]]
		-- upvalues: FFlagSplitPaneExperimentVariants (copy), Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref), AppSplitViewModule (copy), SplitPaneSlot (copy)
		if FFlagSplitPaneExperimentVariants then
			if not Flag then
				Flag = true
				config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
			end
			local config5 = config4
			
			if not config5.supportSlotEligible then
				return nil
			elseif Collapsed == AppSplitViewModule.Enums.SupportPaneMode.Collapsed and not config5.profileSupportSlotEligibleWhenCollapsed then
				return nil
			end
		end
		return SplitPaneSlot.Support
	end,
	getProfileRoutePresentation = function(Collapsed) --[[ Line: 155 ]]
		-- upvalues: FFlagSplitPaneExperimentVariants (copy), SplitPaneSlot (copy), Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref), AppSplitViewModule (copy)
		local Support = nil
		if not FFlagSplitPaneExperimentVariants then
			return {
				rendersAboveSplitPane = false,
				splitPaneEligibility = if Collapsed == nil then nil else SplitPaneSlot.Support,
				rendersOverlay = Collapsed == nil
			}
		end
		repeat
			if Collapsed == nil then
				Support = nil
				continue
			else
				if FFlagSplitPaneExperimentVariants then
					if not Flag then
						Flag = true
						config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
					end
					local config5 = config4
					
					if config5.supportSlotEligible then
						if Collapsed == AppSplitViewModule.Enums.SupportPaneMode.Collapsed and not config5.profileSupportSlotEligibleWhenCollapsed then
							Support = nil
							break
						end
					else
						Support = nil
						break
					end
				end
				Support = SplitPaneSlot.Support
				break
			end
		until true
		local HasSupport = Support ~= nil
		local NoHasSupport = not HasSupport
		
		if NoHasSupport then
			NoHasSupport = true
			
			if Collapsed ~= nil then
				if not Flag then
					Flag = true
					config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
				end
				NoHasSupport = not config4.defaultOpen
				
				if NoHasSupport then
					if not Flag then
						Flag = true
						config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
					end
					NoHasSupport = not config4.autoExpandOnSupportOpen
				end
			end
		end
		return {
			splitPaneEligibility = Support,
			rendersOverlay = NoHasSupport,
			rendersAboveSplitPane = not HasSupport and not NoHasSupport
		}
	end,
	getExperienceDetailSplitPaneEligibility = function() --[[ Line: 178 ]]
		-- upvalues: FFlagSplitPaneExperimentVariants (copy), Flag (ref), config (copy), FFlagSplitPaneVariantCollapsedAutoOpen (copy), config3 (copy), FFlagSplitPaneVariantAvatarOnHomeOnly (copy), config2 (copy), FFlagSplitPaneVariantDefaultCollapsed (copy), config1 (copy), config4 (ref), SplitPaneSlot (copy)
		if FFlagSplitPaneExperimentVariants then
			if not Flag then
				Flag = true
				config4 = if FFlagSplitPaneVariantCollapsedAutoOpen then config3 elseif FFlagSplitPaneVariantAvatarOnHomeOnly then config2 elseif FFlagSplitPaneVariantDefaultCollapsed then config1 else config
			end
			if not config4.supportSlotEligible then
				return nil
			end
		end
		return SplitPaneSlot.Support
	end,
	variantConfigs = { config, config1, config2, config3 }
}
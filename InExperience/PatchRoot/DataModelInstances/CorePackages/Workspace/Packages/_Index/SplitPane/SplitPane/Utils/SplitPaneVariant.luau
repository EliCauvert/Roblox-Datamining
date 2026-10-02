local parent = script:FindFirstAncestor("SplitPane").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local appSplitViewModule = require(parent.AppSplitView)
local splitPaneSlot = appSplitViewModule.Enums.SplitPaneSlot
local fFlagSplitPaneExperimentVariants = sharedFlagsModule.FFlagSplitPaneExperimentVariants
local fFlagSplitPaneVariantDefaultCollapsed = sharedFlagsModule.FFlagSplitPaneVariantDefaultCollapsed
local fFlagSplitPaneVariantAvatarOnHomeOnly = sharedFlagsModule.FFlagSplitPaneVariantAvatarOnHomeOnly
local fFlagSplitPaneVariantCollapsedAutoOpen = sharedFlagsModule.FFlagSplitPaneVariantCollapsedAutoOpen
local t = {
	name = "DefaultOpen",
	defaultOpen = true,
	autoExpandOnSupportOpen = true,
	avatarOnHome = true,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = true
}
local t_1 = {
	name = "DefaultCollapsed",
	defaultOpen = false,
	autoExpandOnSupportOpen = false,
	avatarOnHome = true,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = false,
	educationModal = true
}
local t_2 = {
	name = "AvatarOnHomeOnly",
	defaultOpen = true,
	autoExpandOnSupportOpen = true,
	avatarOnHome = true,
	supportSlotEligible = false,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = true
}
local t_3 = {
	name = "CollapsedAutoOpen",
	defaultOpen = false,
	autoExpandOnSupportOpen = true,
	avatarOnHome = false,
	supportSlotEligible = true,
	profileSupportSlotEligibleWhenCollapsed = true,
	educationModal = false
}
local list = { t, t_1, t_2, t_3 }
local var1 = false
local var2 = t

local function _()
	-- upvalues: t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var1 (write), var2 (write)
	local var3 = t
	
	if fFlagSplitPaneVariantCollapsedAutoOpen then
		var3 = t_3
	elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
		var3 = t_2
	elseif fFlagSplitPaneVariantDefaultCollapsed then
		var3 = t_1
	end
	var1 = true
	var2 = var3
	
	return var3
end

return {
	getVariantConfig = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return var2
	end,
	isPaneCollapsedByDefault = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return not var2.defaultOpen
	end,
	shouldAutoExpandOnSupportOpen = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return var2.autoExpandOnSupportOpen
	end,
	shouldCollapseOnSupportClose = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return not var2.avatarOnHome
	end,
	shouldShowAvatarOnHome = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return var2.avatarOnHome
	end,
	isEducationModalEnabled = function()
		-- upvalues: var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write)
		if not var1 then
			local var3 = t
			
			if fFlagSplitPaneVariantCollapsedAutoOpen then
				var3 = t_3
			elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
				var3 = t_2
			elseif fFlagSplitPaneVariantDefaultCollapsed then
				var3 = t_1
			end
			var1 = true
			var2 = var3
		end
		return var2.educationModal
	end,
	getGameDetailsSplitPaneEligibility = function()
		-- upvalues: fFlagSplitPaneExperimentVariants (ref), var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write), splitPaneSlot (ref)
		if fFlagSplitPaneExperimentVariants then
			if not var1 then
				local var3 = t
				
				if fFlagSplitPaneVariantCollapsedAutoOpen then
					var3 = t_3
				elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
					var3 = t_2
				elseif fFlagSplitPaneVariantDefaultCollapsed then
					var3 = t_1
				end
				var1 = true
				var2 = var3
			end
			return if var2.supportSlotEligible then splitPaneSlot.Support else nil
		end
	end,
	getProfileSplitPaneEligibility = function(p1)
		-- upvalues: fFlagSplitPaneExperimentVariants (ref), var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write), appSplitViewModule (ref), splitPaneSlot (ref)
		if fFlagSplitPaneExperimentVariants then
			if not var1 then
				local var3 = t
				
				if fFlagSplitPaneVariantCollapsedAutoOpen then
					var3 = t_3
				elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
					var3 = t_2
				elseif fFlagSplitPaneVariantDefaultCollapsed then
					var3 = t_1
				end
				var1 = true
				var2 = var3
			end
			local var4 = var2
			
			return if var4.supportSlotEligible then if p1 == appSplitViewModule.Enums.SupportPaneMode.Collapsed and not var4.profileSupportSlotEligibleWhenCollapsed then nil else splitPaneSlot.Support else nil
		end
	end,
	getProfileRoutePresentation = function(p1)
		-- upvalues: fFlagSplitPaneExperimentVariants (ref), splitPaneSlot (ref), var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write), appSplitViewModule (ref)
		local var3
		if not fFlagSplitPaneExperimentVariants then
			return {
				rendersAboveSplitPane = false,
				splitPaneEligibility = if p1 ~= nil then nil else splitPaneSlot.Support,
				rendersOverlay = p1 == nil
			}
		elseif p1 == nil then
			var3 = nil
		elseif fFlagSplitPaneExperimentVariants then
			if not var1 then
				local var4 = t
				
				if fFlagSplitPaneVariantCollapsedAutoOpen then
					var4 = t_3
				elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
					var4 = t_2
				elseif fFlagSplitPaneVariantDefaultCollapsed then
					var4 = t_1
				end
				var1 = true
				var2 = var4
			end
			local var5 = var2
			var3 = if not var5.supportSlotEligible then if p1 == appSplitViewModule.Enums.SupportPaneMode.Collapsed and not var5.profileSupportSlotEligibleWhenCollapsed then nil else splitPaneSlot.Support else nil
		end
		local var6 = var3 ~= nil
		local var7 = not var6
		
		if var7 then
			var7 = true
			
			if p1 ~= nil then
				if not var1 then
					local var8 = t
					
					if fFlagSplitPaneVariantCollapsedAutoOpen then
						var8 = t_3
					elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
						var8 = t_2
					elseif fFlagSplitPaneVariantDefaultCollapsed then
						var8 = t_1
					end
					var1 = true
					var2 = var8
				end
				var7 = not var2.defaultOpen
				
				if var7 then
					if not var1 then
						local var9 = t
						
						if fFlagSplitPaneVariantCollapsedAutoOpen then
							var9 = t_3
						elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
							var9 = t_2
						elseif fFlagSplitPaneVariantDefaultCollapsed then
							var9 = t_1
						end
						var1 = true
						var2 = var9
					end
					var7 = not var2.autoExpandOnSupportOpen
				end
			end
		end
		return {
			splitPaneEligibility = var3,
			rendersOverlay = var7,
			rendersAboveSplitPane = not var6 and not var7
		}
	end,
	getExperienceDetailSplitPaneEligibility = function()
		-- upvalues: fFlagSplitPaneExperimentVariants (ref), var1 (write), t (ref), fFlagSplitPaneVariantCollapsedAutoOpen (ref), t_3 (ref), fFlagSplitPaneVariantAvatarOnHomeOnly (ref), t_2 (ref), fFlagSplitPaneVariantDefaultCollapsed (ref), t_1 (ref), var2 (write), splitPaneSlot (ref)
		if fFlagSplitPaneExperimentVariants then
			if not var1 then
				local var3 = t
				
				if fFlagSplitPaneVariantCollapsedAutoOpen then
					var3 = t_3
				elseif fFlagSplitPaneVariantAvatarOnHomeOnly then
					var3 = t_2
				elseif fFlagSplitPaneVariantDefaultCollapsed then
					var3 = t_1
				end
				var1 = true
				var2 = var3
			end
			return if var2.supportSlotEligible then splitPaneSlot.Support else nil
		end
	end,
	variantConfigs = list
}
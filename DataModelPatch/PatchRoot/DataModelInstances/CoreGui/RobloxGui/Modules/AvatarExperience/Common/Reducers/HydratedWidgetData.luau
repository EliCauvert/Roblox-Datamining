local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local FFlagAXFixRemoveLookOnMySharedAvatars = AvatarExperienceFlagsModule.FFlagAXFixRemoveLookOnMySharedAvatars

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData).name] = function(p1, p2)
		-- upvalues: DashModule (copy)
		local JoinDeepResults = {}
		
		for i, value in p2.payload do
			JoinDeepResults[i] = DashModule.joinDeep(p1[i] or {}, value)
		end
		return DashModule.join(p1, JoinDeepResults)
	end,
	[require(Modules.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase).name] = function(p3, p4)
		-- upvalues: WidgetConstants (copy), DashModule (copy)
		local LookId = p4.lookId
		local IsOwnedAfterPurchase = p4.isOwnedAfterPurchase
		
		if IsOwnedAfterPurchase then
			local Look = WidgetConstants.ContentType.Look
			local v1 = p3[Look] or {}
			
			return (DashModule.join(p3, {
				[Look] = DashModule.join(v1, {
					[LookId] = DashModule.join(v1[LookId] or {}, { owned = IsOwnedAfterPurchase })
				})
			}))
		else
			return p3
		end
	end,
	[require(Modules.AvatarExperience.Common.Actions.ClearReceivedCatalogData).name] = if AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchEvictStores then function(p3)
		return if next(p3) == nil then p3 else {}
	end else nil,
	[require(Modules.AvatarExperience.Common.Actions.RemoveLook).name] = function(p3, p4)
		-- upvalues: WidgetConstants (copy), FFlagAXFixRemoveLookOnMySharedAvatars (copy), DashModule (copy), CryoModule (copy)
		local LookId = p4.lookId
		local Look = WidgetConstants.ContentType.Look
		local Tbl = p3[Look] or {}
		local Copy = nil
		
		if FFlagAXFixRemoveLookOnMySharedAvatars then
			Copy = table.clone(Tbl)
			Copy[LookId] = nil
		else
			Copy = DashModule.join(Tbl, { [LookId] = CryoModule.None })
		end
		return (DashModule.join(p3, { [Look] = Copy }))
	end
}))
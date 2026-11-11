local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagAXFixRemoveLookOnMySharedAvatars = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixRemoveLookOnMySharedAvatars
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2.context then CryoModule.Dictionary.join(p1, {
			[p2.context] = {
				Details = p2.widgetInfo,
				RequestId = p2.requestId,
				FetchTime = tick(),
				Configuration = p2.configuration
			}
		}) else p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2.context then CryoModule.Dictionary.join(p1, { [p2.context] = CryoModule.None }) else p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.RemoveWidgetInfo).name] = function(List, p1)
		-- upvalues: CryoModule (copy)
		local WidgetId = p1.widgetId
		local JoinResults = {}
		
		for i, value in List do
			local Nones = {}
			
			for i1, detail in value.Details do
				if detail.id == WidgetId then
					Nones[i1] = CryoModule.None
				end
			end
			JoinResults[i] = CryoModule.Dictionary.join(value, {
				Details = CryoModule.Dictionary.join(value.Details, Nones)
			})
		end
		return JoinResults
	end,
	[require(Modules.AvatarExperience.Common.Actions.RemoveLook).name] = function(Tbl, p2)
		-- upvalues: CryoModule (copy), FFlagAXFixRemoveLookOnMySharedAvatars (copy)
		local Copy = table.clone(Tbl)
		
		for i, value in pairs(Tbl) do
			local Details = {}
			
			for i1, detail in pairs(value.Details) do
				if detail.content then
					local Content = {}
					
					for _, value1 in detail.content do
						if value1.id ~= p2.lookId then
							table.insert(Content, value1)
						end
					end
					Details[i1] = CryoModule.Dictionary.join(detail, { content = Content })
				end
			end
			if FFlagAXFixRemoveLookOnMySharedAvatars then
				Copy[i] = CryoModule.Dictionary.join(value, { Details = Details })
			else
				Copy[i].Details = CryoModule.Dictionary.join(value.Details, Details)
			end
		end
		return Copy
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData).name] = if require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest.isEnabled() then function(p3, p4)
		-- upvalues: CryoModule (copy)
		local Widget = p4.widget
		
		return CryoModule.Dictionary.join(p3, {
			[Widget.context] = {
				Details = Widget.widgetInfo,
				RequestId = Widget.requestId,
				FetchTime = tick()
			}
		})
	end else nil
}))
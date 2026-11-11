local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2.query then CryoModule.Dictionary.join(p1, {
			[p2.query] = {
				Details = p2.widgetInfo,
				RequestId = p2.requestId,
				FetchTime = tick(),
				Configuration = p2.configuration
			}
		}) else p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2.query then CryoModule.Dictionary.join(p1, { [p2.query] = CryoModule.None }) else p1
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
	end
}))
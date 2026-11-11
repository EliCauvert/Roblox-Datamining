local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

return (require(CorePackages.Packages.Rodux).createReducer({
	RequestId = nil,
	FetchTime = nil,
	Configuration = nil,
	Details = {}
}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo).name] = function(p1, p2)
		return if p2.query or p2.context then p1 else {
			Details = p2.widgetInfo,
			RequestId = p2.requestId,
			FetchTime = tick(),
			Configuration = p2.configuration
		}
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo).name] = function(p1, p2)
		return if p2.query or p2.context then p1 else { Details = {} }
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.RemoveWidgetInfo).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local WidgetId = p2.widgetId
		local Nones = {}
		
		for i, detail in p1.Details do
			if detail.id == WidgetId then
				Nones[i] = CryoModule.None
			end
		end
		return CryoModule.Dictionary.join(p1, { Details = CryoModule.Dictionary.join(p1.Details, Nones) })
	end
}))
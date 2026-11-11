local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Sort, SortAggregation)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Sort, "string", "sort")
	ArgCheckModule.isTypeOrNil(SortAggregation, "string", "sortAggregation")
	
	return { sort = Sort, sortAggregation = SortAggregation }
end)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DashModule = require(game:GetService("CorePackages").Packages.Dash)
local UseSponsoredItemsLocalWidgetModule = require(Modules.AvatarExperience.Common.Hooks.useSponsoredItemsLocalWidget)
local _ = require(Modules.AvatarExperience.Common.Types)

return function(p1, p2, p3)
	-- upvalues: UseSponsoredItemsLocalWidgetModule (copy), DashModule (copy)
	local FilterResult = DashModule.filter({ UseSponsoredItemsLocalWidgetModule(p1, p2, p3) }, function(p4)
		return p4.isEnabled
	end)
	table.sort(FilterResult, function(A, B): boolean
		return A.row < B.row
	end)
	
	return FilterResult
end
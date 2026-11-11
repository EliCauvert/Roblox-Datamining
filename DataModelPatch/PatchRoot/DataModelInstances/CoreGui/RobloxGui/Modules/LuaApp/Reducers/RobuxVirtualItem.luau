local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetShowBuyRobuxButtonBadgeModule = require(Modules.LuaApp.Actions.Economy.SetShowBuyRobuxButtonBadge)
local SetBuyRobuxButtonClickedModule = require(Modules.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked)
local SetHasFetchedRobuxBadgeModule = require(Modules.LuaApp.Actions.Economy.SetHasFetchedRobuxBadge)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return function(p1, p2)
	-- upvalues: SetShowBuyRobuxButtonBadgeModule (copy), CryoModule (copy), SetBuyRobuxButtonClickedModule (copy), SetHasFetchedRobuxBadgeModule (copy)
	local P0 = p1 or {
		showBuyRobuxButtonBadge = false,
		buyRobuxButtonClicked = false,
		hasFetchedRobuxBadge = false
	}
	assert(P0, "")
	
	return if p2.type == SetShowBuyRobuxButtonBadgeModule.name then CryoModule.Dictionary.join(P0, { showBuyRobuxButtonBadge = p2.showBuyRobuxButtonBadge }) elseif p2.type == SetBuyRobuxButtonClickedModule.name then CryoModule.Dictionary.join(P0, { buyRobuxButtonClicked = p2.buyRobuxButtonClicked }) elseif p2.type == SetHasFetchedRobuxBadgeModule.name then CryoModule.Dictionary.join(P0, { hasFetchedRobuxBadge = p2.hasFetchedRobuxBadge }) else P0
end
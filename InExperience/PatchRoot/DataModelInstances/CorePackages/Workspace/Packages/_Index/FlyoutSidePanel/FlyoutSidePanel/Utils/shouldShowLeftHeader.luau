local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local fFlagAppIaHomeSubTab = require(parent.SharedFlags).FFlagAppIaHomeSubTab

return function(p1, p2, p3)
	-- upvalues: appPage (ref), fFlagAppIaHomeSubTab (ref), navigationRoduxModule (ref)
	local var1 = if p1 ~= appPage.Home then if p1 ~= appPage.Games then fFlagAppIaHomeSubTab and p1 == navigationRoduxModule.Constants.HomeContainerName else true else true
	local var2 = if p2 ~= appPage.Home then p2 == appPage.Games else true
	
	if not var1 and not var2 then
		return false
	elseif not var1 or p2 ~= p1 then
		return true
	end
	local var3
	local var4 = var1 and p2 == appPage.GameDetail
	
	if not var2 then
		var3 = var4 and not p3
	end
	return var3
end
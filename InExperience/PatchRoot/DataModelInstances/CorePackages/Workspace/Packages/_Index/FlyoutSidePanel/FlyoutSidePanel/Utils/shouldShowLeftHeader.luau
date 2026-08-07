local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local fFlagAppIaHomeSubTab = require(parent.SharedFlags).FFlagAppIaHomeSubTab

return function(p0, p1, p2) --[[ line: 13 ]]
	-- upvalues: appPage (ref), fFlagAppIaHomeSubTab (ref), navigationRoduxModule (ref)
	local var1 = if p0 ~= appPage.Home then if p0 ~= appPage.Games then fFlagAppIaHomeSubTab and p0 == navigationRoduxModule.Constants.HomeContainerName else true else true
	local var2 = if p1 ~= appPage.Home then p1 == appPage.Games else true
	
	if not var1 and not var2 then
		return false
	elseif not var1 or p1 ~= p0 then
		return true
	end
	local var4
	local var3 = var1 and p1 == appPage.GameDetail
	
	if not var2 then
		var4 = var3 and not p2
	end
	return var4
end
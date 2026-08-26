local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local closePageModule = require(shareGame.Actions.ClosePage)
local setSearchAreaActiveModule = require(shareGame.Actions.SetSearchAreaActive)
local setSearchTextModule = require(shareGame.Actions.SetSearchText)
local t = { SearchAreaActive = false, SearchText = "" }

return function(p1, p2)
	-- upvalues: t (ref), setSearchAreaActiveModule (ref), immutable (ref), setSearchTextModule (ref), closePageModule (ref)
	p1 = p1 or t
	
	if p2.type == setSearchAreaActiveModule.name then
		p1 = immutable.Set(p1, "SearchAreaActive", p2.isActive)
		
		return p1
	elseif p2.type == setSearchTextModule.name then
		p1 = immutable.Set(p1, "SearchText", p2.searchText)
		
		return p1
	elseif p2.type == closePageModule.name then
		p1 = t
	end
	return p1
end
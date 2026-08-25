local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local closePageModule = require(shareGame.Actions.ClosePage)
local setSearchAreaActiveModule = require(shareGame.Actions.SetSearchAreaActive)
local setSearchTextModule = require(shareGame.Actions.SetSearchText)
local t = { SearchAreaActive = false, SearchText = "" }

return function(p0, p1)
	-- upvalues: t (ref), setSearchAreaActiveModule (ref), immutable (ref), setSearchTextModule (ref), closePageModule (ref)
	p0 = p0 or t
	
	if p1.type == setSearchAreaActiveModule.name then
		p0 = immutable.Set(p0, "SearchAreaActive", p1.isActive)
		
		return p0
	elseif p1.type == setSearchTextModule.name then
		p0 = immutable.Set(p0, "SearchText", p1.searchText)
		
		return p0
	elseif p1.type == closePageModule.name then
		p0 = t
	end
	return p0
end
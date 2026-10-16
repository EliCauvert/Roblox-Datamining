local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local ClosePageModule = require(ShareGame.Actions.ClosePage)
local SetSearchAreaActiveModule = require(ShareGame.Actions.SetSearchAreaActive)
local SetSearchTextModule = require(ShareGame.Actions.SetSearchText)
local config = { SearchAreaActive = false, SearchText = "" }

return function(p1, p2) --[[ Line: 19 ]]
	-- upvalues: config (copy), SetSearchAreaActiveModule (copy), Immutable (copy), SetSearchTextModule (copy), ClosePageModule (copy)
	local P0 = p1 or config
	
	if p2.type == SetSearchAreaActiveModule.name then
		P0 = Immutable.Set(P0, "SearchAreaActive", p2.isActive)
		
		return P0
	end
	if p2.type == SetSearchTextModule.name then
		P0 = Immutable.Set(P0, "SearchText", p2.searchText)
		
		return P0
	end
	if p2.type == ClosePageModule.name then
		P0 = config
	end
	return P0
end
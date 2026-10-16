local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local ConstantsModule = require(ShareGame.Constants)
local OpenPageModule = require(ShareGame.Actions.OpenPage)
local ClosePageModule = require(ShareGame.Actions.ClosePage)

return function(p1, p2) --[[ Line: 11 ]]
	-- upvalues: ConstantsModule (copy), OpenPageModule (copy), Immutable (copy), ClosePageModule (copy)
	local P0 = p1 or { IsOpen = false, Route = ConstantsModule.PageRoute.NONE }
	
	if p2.type == OpenPageModule.name then
		P0 = Immutable.JoinDictionaries(P0, {
			IsOpen = true,
			Route = p2.route or ConstantsModule.PageRoute.NONE
		})
		
		return P0
	end
	if p2.type == ClosePageModule.name then
		P0 = Immutable.JoinDictionaries(P0, {
			IsOpen = false,
			Route = p2.route or ConstantsModule.PageRoute.NONE
		})
	end
	return P0
end
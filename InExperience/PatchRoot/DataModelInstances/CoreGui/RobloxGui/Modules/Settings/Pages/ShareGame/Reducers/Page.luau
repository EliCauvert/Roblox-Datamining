local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local constantsModule = require(shareGame.Constants)
local openPageModule = require(shareGame.Actions.OpenPage)
local closePageModule = require(shareGame.Actions.ClosePage)

return function(p1, p2)
	-- upvalues: constantsModule (ref), openPageModule (ref), immutable (ref), closePageModule (ref)
	p1 = p1 or { IsOpen = false, Route = constantsModule.PageRoute.NONE }
	
	if p2.type == openPageModule.name then
		p1 = immutable.JoinDictionaries(p1, {
			IsOpen = true,
			Route = p2.route or constantsModule.PageRoute.NONE
		})
		
		return p1
	elseif p2.type == closePageModule.name then
		p1 = immutable.JoinDictionaries(p1, {
			IsOpen = false,
			Route = p2.route or constantsModule.PageRoute.NONE
		})
	end
	return p1
end
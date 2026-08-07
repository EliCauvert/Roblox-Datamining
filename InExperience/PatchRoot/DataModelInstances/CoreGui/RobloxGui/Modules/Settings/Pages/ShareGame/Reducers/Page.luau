local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local constantsModule = require(shareGame.Constants)
local openPageModule = require(shareGame.Actions.OpenPage)
local closePageModule = require(shareGame.Actions.ClosePage)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: constantsModule (ref), openPageModule (ref), immutable (ref), closePageModule (ref)
	p0 = p0 or { IsOpen = false, Route = constantsModule.PageRoute.NONE }
	
	if p1.type == openPageModule.name then
		p0 = immutable.JoinDictionaries(p0, {
			IsOpen = true,
			Route = p1.route or constantsModule.PageRoute.NONE
		})
		
		return p0
	elseif p1.type == closePageModule.name then
		p0 = immutable.JoinDictionaries(p0, {
			IsOpen = false,
			Route = p1.route or constantsModule.PageRoute.NONE
		})
	end
	return p0
end
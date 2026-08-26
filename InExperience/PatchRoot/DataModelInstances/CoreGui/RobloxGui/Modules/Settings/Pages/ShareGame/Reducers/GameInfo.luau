local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local setGameInfoCreatedModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetGameInfoCreated)

return function(p1, p2)
	-- upvalues: setGameInfoCreatedModule (ref), immutable (ref)
	p1 = p1 or { Created = nil }
	
	if p2.type == setGameInfoCreatedModule.name then
		p1 = immutable.Set(p1, "Created", p2.Created)
	end
	return p1
end
local immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local setGameInfoCreatedModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetGameInfoCreated)

return function(p0, p1)
	-- upvalues: setGameInfoCreatedModule (ref), immutable (ref)
	p0 = p0 or { Created = nil }
	
	if p1.type == setGameInfoCreatedModule.name then
		p0 = immutable.Set(p0, "Created", p1.Created)
	end
	return p0
end
local Immutable = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Immutable
local SetGameInfoCreatedModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetGameInfoCreated)

return function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: SetGameInfoCreatedModule (copy), Immutable (copy)
	local P0 = p1 or { Created = nil }
	
	if p2.type == SetGameInfoCreatedModule.name then
		P0 = Immutable.Set(P0, "Created", p2.Created)
	end
	return P0
end
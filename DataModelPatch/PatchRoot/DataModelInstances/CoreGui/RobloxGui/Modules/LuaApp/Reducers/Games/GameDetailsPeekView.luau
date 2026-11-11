local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local SetGameDetailsPeekViewStateModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Games.SetGameDetailsPeekViewState)

return function(p1, p2)
	-- upvalues: PeekViewState (copy), SetGameDetailsPeekViewStateModule (copy), CryoModule (copy)
	local P0 = p1 or { viewState = PeekViewState.Closed }
	
	if p2.type == SetGameDetailsPeekViewStateModule.name then
		P0 = CryoModule.Dictionary.join(P0, { viewState = p2.viewState })
	end
	return P0
end
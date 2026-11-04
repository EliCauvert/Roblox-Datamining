local ReactModule = require(script:FindFirstAncestor("Squads").Parent.React)
local SquadLobbyUserOverflowMenuViewModule = require(script.Parent.SquadLobbyUserOverflowMenuView)
local UseSquadLobbyUserOverflowMenuViewModelModule = require(script.Parent.useSquadLobbyUserOverflowMenuViewModel)

return function(p1)
	-- upvalues: UseSquadLobbyUserOverflowMenuViewModelModule (copy), ReactModule (copy), SquadLobbyUserOverflowMenuViewModule (copy)
	return ReactModule.createElement(SquadLobbyUserOverflowMenuViewModule, (UseSquadLobbyUserOverflowMenuViewModelModule(p1)))
end
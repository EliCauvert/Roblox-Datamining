local ReactModule = require(script:FindFirstAncestor("Squads").Parent.React)
local SquadLobbyJoinDialogViewModule = require(script.Parent.SquadLobbyJoinDialogView)
local UseSquadLobbyJoinDialogViewModelModule = require(script.Parent.useSquadLobbyJoinDialogViewModel)

return function(p1)
	-- upvalues: UseSquadLobbyJoinDialogViewModelModule (copy), ReactModule (copy), SquadLobbyJoinDialogViewModule (copy)
	return ReactModule.createElement(SquadLobbyJoinDialogViewModule, (UseSquadLobbyJoinDialogViewModelModule(p1)))
end
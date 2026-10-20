local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local Llama = LuaSocialLibrariesDepsModule.llama
local PresenceType = LuaSocialLibrariesDepsModule.RoduxPresence.config({}).Enums.PresenceType
local UserModel = require(CorePackages.Workspace.Packages.UserLib).Models.UserModel
local config = {
	[PresenceType.InGame] = UserModel.PresenceType.IN_GAME,
	[PresenceType.Online] = UserModel.PresenceType.ONLINE,
	[PresenceType.InStudio] = UserModel.PresenceType.IN_STUDIO,
	[PresenceType.Offline] = UserModel.PresenceType.OFFLINE
}

return function(p1)
	-- upvalues: TModule (copy), Llama (copy), config (copy), PresenceType (copy)
	assert(TModule.table(p1), "formatUser: user should be a table")
	
	return Llama.Dictionary.join(p1, {
		name = p1.username,
		gameInstanceId = p1.gameId,
		presence = config[p1.userPresenceType] or config[PresenceType.Offline]
	})
end
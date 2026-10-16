local SquadsCore = script:FindFirstAncestor("SquadsCore")
local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)
local LuaSocialLibrariesDepsModule = require(SquadsCore.Parent.LuaSocialLibrariesDeps)

return if require(SquadsCore.Flags.FFlagSquadsPresenceStoreMigration) then nil else LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = RoduxNetworkingModule })
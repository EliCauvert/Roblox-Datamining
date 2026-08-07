local squadsCore = script:FindFirstAncestor("SquadsCore")

return if require(squadsCore.Flags.FFlagSquadsPresenceStoreMigration) then nil else require(squadsCore.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({ roduxNetworking = require(script.Parent.RoduxNetworking) })
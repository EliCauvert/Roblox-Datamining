local Parent = script.Parent.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
JestGlobalsModule.expect.extend(LuaSocialLibrariesDepsModule.CollisionMatchers.Jest)

return {
	JestGlobals = JestGlobalsModule,
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "SharedTest.Users" }),
	RoduxFriends = require(Parent.FriendsRodux).config({ keyPath = "SharedTest.Friends" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "SharedTest.Presence" })
}
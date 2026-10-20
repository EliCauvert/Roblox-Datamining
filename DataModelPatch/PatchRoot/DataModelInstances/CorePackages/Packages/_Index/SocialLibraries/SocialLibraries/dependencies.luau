local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LazyRequireFunction = require(Parent.LazyRequire).lazyRequire
local UIBloxModule = require(Parent.UIBlox)
local RoduxPresenceModule = require(Parent.RoduxPresence)
local RoduxFriendsModule = require(Parent.RoduxFriends)

return if game:DefineFastFlag("LuaAppSocialLibUseLazyRequire", false) then {
	Roact = require(Parent.Roact),
	React = require(Parent.React),
	UIBlox = UIBloxModule,
	Foundation = require(Parent.Foundation),
	RoactFitComponents = LazyRequireFunction(Parent.RoactFitComponents),
	GenericPagination = LazyRequireFunction(Parent.GenericPagination),
	Cryo = require(Parent.Cryo),
	RoactNavigation = require(Parent.RoactNavigation),
	Rodux = require(Parent.Rodux),
	Lumberyak = require(Parent.Lumberyak),
	tutils = require(Parent.tutils),
	t = require(Parent.t),
	Promise = LazyRequireFunction(Parent.Promise),
	Symbol = LazyRequireFunction(Parent.Symbol),
	LuauPolyfill = LazyRequireFunction(Parent.LuauPolyfill),
	Otter = LazyRequireFunction(Parent.Otter),
	llama = LazyRequireFunction(Parent.llama),
	RoduxPresence = RoduxPresenceModule.config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = RoduxFriendsModule.config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(Parent.enumerate),
	Players = Players,
	UserInputService = UserInputService,
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
} else {
	Roact = require(Parent.Roact),
	React = require(Parent.React),
	UIBlox = UIBloxModule,
	Foundation = require(Parent.Foundation),
	RoactFitComponents = require(Parent.RoactFitComponents),
	GenericPagination = require(Parent.GenericPagination),
	Cryo = require(Parent.Cryo),
	RoactNavigation = require(Parent.RoactNavigation),
	Rodux = require(Parent.Rodux),
	Lumberyak = require(Parent.Lumberyak),
	tutils = require(Parent.tutils),
	t = require(Parent.t),
	Promise = require(Parent.Promise),
	Symbol = require(Parent.Symbol),
	LuauPolyfill = require(Parent.LuauPolyfill),
	Otter = require(Parent.Otter),
	llama = require(Parent.llama),
	RoduxPresence = RoduxPresenceModule.config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = RoduxFriendsModule.config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(Parent.enumerate),
	Players = Players,
	UserInputService = UserInputService,
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
}
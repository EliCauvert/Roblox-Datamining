-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:24 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local lazyRequire = require(parent.LazyRequire).lazyRequire
local UIBloxModule = require(parent.UIBlox)
local roduxPresenceModule = require(parent.RoduxPresence)
local roduxFriendsModule = require(parent.RoduxFriends)

return if game:DefineFastFlag("LuaAppSocialLibUseLazyRequire", false) then {
	Roact = require(parent.Roact),
	React = require(parent.React),
	UIBlox = UIBloxModule,
	Foundation = require(parent.Foundation),
	RoactFitComponents = lazyRequire(parent.RoactFitComponents),
	GenericPagination = lazyRequire(parent.GenericPagination),
	Cryo = require(parent.Cryo),
	RoactNavigation = require(parent.RoactNavigation),
	Rodux = require(parent.Rodux),
	Lumberyak = require(parent.Lumberyak),
	tutils = require(parent.tutils),
	t = require(parent.t),
	Promise = lazyRequire(parent.Promise),
	Symbol = lazyRequire(parent.Symbol),
	LuauPolyfill = lazyRequire(parent.LuauPolyfill),
	Otter = lazyRequire(parent.Otter),
	llama = lazyRequire(parent.llama),
	RoduxPresence = roduxPresenceModule.config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = roduxFriendsModule.config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(parent.enumerate),
	Players = playersService,
	UserInputService = userInputService,
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
} else {
	Roact = require(parent.Roact),
	React = require(parent.React),
	UIBlox = UIBloxModule,
	Foundation = require(parent.Foundation),
	RoactFitComponents = require(parent.RoactFitComponents),
	GenericPagination = require(parent.GenericPagination),
	Cryo = require(parent.Cryo),
	RoactNavigation = require(parent.RoactNavigation),
	Rodux = require(parent.Rodux),
	Lumberyak = require(parent.Lumberyak),
	tutils = require(parent.tutils),
	t = require(parent.t),
	Promise = require(parent.Promise),
	Symbol = require(parent.Symbol),
	LuauPolyfill = require(parent.LuauPolyfill),
	Otter = require(parent.Otter),
	llama = require(parent.llama),
	RoduxPresence = roduxPresenceModule.config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = roduxFriendsModule.config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(parent.enumerate),
	Players = playersService,
	UserInputService = userInputService,
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
}
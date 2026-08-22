local parent = script.Parent.Parent

return {
	Roact = require(parent.Roact),
	React = require(parent.React),
	UIBlox = require(parent.UIBlox),
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
	RoduxPresence = require(parent.RoduxPresence).config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = require(parent.RoduxFriends).config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(parent.enumerate),
	Players = game:GetService("Players"),
	UserInputService = game:GetService("UserInputService"),
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
}
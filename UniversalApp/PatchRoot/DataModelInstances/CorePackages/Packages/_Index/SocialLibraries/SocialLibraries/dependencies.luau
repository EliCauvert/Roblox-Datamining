local Parent = script.Parent.Parent

return {
	Roact = require(Parent.Roact),
	React = require(Parent.React),
	UIBlox = require(Parent.UIBlox),
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
	RoduxPresence = require(Parent.RoduxPresence).config({ keyPath = "SocialLibraries.Presence" }),
	RoduxFriends = require(Parent.RoduxFriends).config({ keyPath = "SocialLibraries.Friends" }),
	enumerate = require(Parent.enumerate),
	Players = game:GetService("Players"),
	UserInputService = game:GetService("UserInputService"),
	Text = require(script.Parent.temp.Text),
	UserModel = require(script.Parent.temp.User)
}
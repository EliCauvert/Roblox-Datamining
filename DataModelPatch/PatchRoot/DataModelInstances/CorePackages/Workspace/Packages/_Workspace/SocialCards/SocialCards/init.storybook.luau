local SocialCards = script:FindFirstAncestor("SocialCards")
local Parent = SocialCards.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AppStyleProvider = require(Parent.Dev.UIBlox).App.Style.AppStyleProvider
local config = {
	Default = FoundationModule.Enums.Theme.Dark,
	Light = FoundationModule.Enums.Theme.Light,
	Dark = FoundationModule.Enums.Theme.Dark
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = SocialCards.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	storyRoot = SocialCards,
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), FoundationModule (copy), config1 (copy), AppStyleProvider (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), FoundationModule (upval), config1 (upval), AppStyleProvider (upval), p1 (copy)
			local Entry = p2 and config[p2.theme] or config.Default
			
			return ReactModule.createElement(FoundationModule.FoundationProvider, {
				theme = Entry,
				device = p2 and config1[p2.platform] or "Desktop"
			}, {
				AppStyleProvider = ReactModule.createElement(AppStyleProvider, {
					style = { fontName = "Gotham", themeName = Entry.themeName }
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}
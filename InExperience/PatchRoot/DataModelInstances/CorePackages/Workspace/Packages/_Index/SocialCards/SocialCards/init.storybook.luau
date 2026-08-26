local socialCards = script:FindFirstAncestor("SocialCards")
local parent = socialCards.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local appStyleProvider = require(parent.Dev.UIBlox).App.Style.AppStyleProvider
local t = {
	Default = foundationModule.Enums.ColorMode.Dark,
	Light = foundationModule.Enums.ColorMode.Light,
	Dark = foundationModule.Enums.ColorMode.Dark
}
local t_1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = socialCards.Name,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	storyRoot = socialCards,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), foundationModule (ref), t_1 (ref), appStyleProvider (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), foundationModule (copy), t_1 (copy), appStyleProvider (copy), p1 (ref)
			local var1 = if p2 then t[p2.theme] else t.Default
			
			return reactModule.createElement(foundationModule.FoundationProvider, {
				colorMode = var1,
				device = if p2 then t_1[p2.platform] else "Desktop"
			}, {
				AppStyleProvider = reactModule.createElement(appStyleProvider, {
					style = { fontName = "Gotham", themeName = var1.themeName }
				}, { Child = reactModule.createElement(p1, p2) })
			})
		end
	end
}
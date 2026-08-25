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
	mapStory = function(p0)
		-- upvalues: t (ref), reactModule (ref), foundationModule (ref), t_1 (ref), appStyleProvider (ref)
		return function(p1)
			-- upvalues: t (copy), reactModule (copy), foundationModule (copy), t_1 (copy), appStyleProvider (copy), p0 (ref)
			local var6 = if p1 then t[p1.theme] else t.Default
			
			return reactModule.createElement(foundationModule.FoundationProvider, {
				colorMode = var6,
				device = if p1 then t_1[p1.platform] else "Desktop"
			}, {
				AppStyleProvider = reactModule.createElement(appStyleProvider, {
					style = { fontName = "Gotham", themeName = var6.themeName }
				}, { Child = reactModule.createElement(p0, p1) })
			})
		end
	end
}
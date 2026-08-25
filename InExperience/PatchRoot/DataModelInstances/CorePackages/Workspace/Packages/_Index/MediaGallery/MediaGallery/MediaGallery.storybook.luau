local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roduxModule = require(parent.Dev.Rodux)
local roactRoduxModule = require(parent.Dev.RoactRodux)
local roactNavigationModule = require(parent.Dev.RoactNavigation)
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local var9 = roduxModule.Store.new(function(p0)
	return p0
end, {
	ScreenSize = Vector2.new(1920, 1080),
	TopBar = { topBarHeight = 0 },
	GlobalGuiInset = { bottom = 0, left = 0, right = 0, top = 0 }
}, {})
local t_1 = {
	isFocused = function()
		return true
	end,
	addListener = function(_, _, _)
		return { remove = function() end }
	end
}

return {
	name = mediaGallery.Name,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), roactRoduxModule (ref), var9 (ref), roactNavigationModule (ref), t_1 (ref), foundationProvider (ref), t (ref), device (ref), appStyleProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), roactRoduxModule (copy), var9 (copy), roactNavigationModule (copy), t_1 (copy), foundationProvider (copy), t (copy), device (copy), appStyleProvider (copy), p1 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var9 }, {
					NavigationContext = reactModule.createElement(roactNavigationModule.Context.Provider, { value = t_1 }, {
						FoundationContext = reactModule.createElement(foundationProvider, {
							colorMode = t[p2.theme],
							device = device[p2.platform],
							preferences = p2.settings,
							scale = p2.settings and p2.settings.scale
						}, {
							StyleProvider = reactModule.createElement(appStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { Child = reactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end,
	storyRoots = { mediaGallery }
}
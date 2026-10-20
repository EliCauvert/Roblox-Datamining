local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoduxModule = require(Parent.Dev.Rodux)
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local RoactNavigationModule = require(Parent.Dev.RoactNavigation)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local NewResult = RoduxModule.Store.new(function(p1)
	return p1
end, {
	ScreenSize = Vector2.new(1920, 1080),
	TopBar = { topBarHeight = 0 },
	GlobalGuiInset = { bottom = 0, left = 0, right = 0, top = 0 }
}, {})
local config1 = {
	isFocused = function(): boolean
		return true
	end,
	addListener = function(_, _, _)
		return { remove = function() end }
	end
}

return {
	name = MediaGallery.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), NewResult (copy), RoactNavigationModule (copy), config1 (copy), FoundationProvider (copy), config (copy), Device (copy), AppStyleProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), RoactRoduxModule (upval), NewResult (upval), RoactNavigationModule (upval), config1 (upval), FoundationProvider (upval), config (upval), Device (upval), AppStyleProvider (upval), p1 (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, {
					NavigationContext = ReactModule.createElement(RoactNavigationModule.Context.Provider, { value = config1 }, {
						FoundationContext = ReactModule.createElement(FoundationProvider, {
							colorMode = config[p2.theme],
							device = Device[p2.platform],
							preferences = p2.settings,
							scale = p2.settings and p2.settings.scale
						}, {
							StyleProvider = ReactModule.createElement(AppStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, { Child = ReactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end,
	storyRoots = { MediaGallery }
}
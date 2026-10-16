local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local NewResult = require(Parent.Rodux).Store.new(function(p1) --[[ Line: 17 ]]
	return p1
end, {
	ScreenSize = Vector2.new(1920, 1080),
	TopBar = { topBarHeight = 10 },
	GlobalGuiInset = { bottom = 0, left = 0, right = 0, top = 0 },
	GamesProductInfoKey = {},
	PlayabilityStatus = {},
	FetchingStatus = {},
	GameDetails = {},
	Personalization = { GameInfosKey = {} },
	GameIconsKey = {},
	UserGameVotes = {},
	AgeRecommendations = {},
	ShowAgeVerificationOverlay = {}
}, {})

return {
	name = "ServerDrivenUiContent",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 34 ]]
		-- upvalues: ReactModule (copy), RoactRoduxModule (copy), NewResult (copy), FoundationProvider (copy), config (copy), Device (copy)
		return function(p2) --[[ Line: 35 ]]
			-- upvalues: ReactModule (upval), RoactRoduxModule (upval), NewResult (upval), FoundationProvider (upval), config (upval), Device (upval), p1 (copy)
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
					FoundationContext = ReactModule.createElement(FoundationProvider, {
						colorMode = config[p2.theme],
						device = Device[p2.platform],
						preferences = p2.settings,
						scale = p2.settings and p2.settings.scale
					}, { Child = ReactModule.createElement(p1, p2) })
				})
			})
		end
	end,
	storyRoot = script.Parent.Content
}
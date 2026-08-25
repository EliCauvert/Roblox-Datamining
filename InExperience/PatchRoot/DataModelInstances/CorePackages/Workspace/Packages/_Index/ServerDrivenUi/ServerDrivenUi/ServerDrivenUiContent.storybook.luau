local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local roactRoduxModule = require(parent.Dev.RoactRodux)
local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local var6 = roduxModule.Store.new(function(p0)
	return p0
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
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), roactRoduxModule (ref), var6 (ref), foundationProvider (ref), t (ref), device (ref)
		return function(p2)
			-- upvalues: reactModule (copy), roactRoduxModule (copy), var6 (copy), foundationProvider (copy), t (copy), device (copy), p1 (ref)
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
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var6 }, {
					FoundationContext = reactModule.createElement(foundationProvider, {
						colorMode = t[p2.theme],
						device = device[p2.platform],
						preferences = p2.settings,
						scale = p2.settings and p2.settings.scale
					}, { Child = reactModule.createElement(p1, p2) })
				})
			})
		end
	end,
	storyRoot = script.Parent.Content
}
local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local styleModule = require(parent.Style)
local foundationModule = require(parent.Foundation)
local gameInviteReducerModule = require(gameInvite.State.Reducers.GameInviteReducer)

return {
	name = "GameInvite",
	storyRoot = gameInvite,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), styleModule (ref), roactRoduxModule (ref), roduxModule (ref), gameInviteReducerModule (ref), foundationModule (ref)
		return function(p2)
			-- upvalues: reactModule (copy), styleModule (copy), roactRoduxModule (copy), roduxModule (copy), gameInviteReducerModule (copy), foundationModule (copy), p1 (ref)
			return reactModule.createElement(styleModule.StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
				StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
					store = roduxModule.Store.new(gameInviteReducerModule, nil, { roduxModule.thunkMiddleware })
				}, {
					FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, { Story = p1(p2) })
				})
			})
		end
	end
}
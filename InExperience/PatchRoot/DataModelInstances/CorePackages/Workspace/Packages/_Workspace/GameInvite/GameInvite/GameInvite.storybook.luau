local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local StyleModule = require(Parent.Style)
local FoundationModule = require(Parent.Foundation)
local GameInviteReducerModule = require(GameInvite.State.Reducers.GameInviteReducer)

return {
	name = "GameInvite",
	storyRoot = GameInvite,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(Callback) --[[ Line: 18 ]]
		-- upvalues: ReactModule (copy), StyleModule (copy), RoactRoduxModule (copy), RoduxModule (copy), GameInviteReducerModule (copy), FoundationModule (copy)
		return function(p1) --[[ Line: 19 ]]
			-- upvalues: ReactModule (upval), StyleModule (upval), RoactRoduxModule (upval), RoduxModule (upval), GameInviteReducerModule (upval), FoundationModule (upval), Callback (copy)
			return ReactModule.createElement(StyleModule.StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
					store = RoduxModule.Store.new(GameInviteReducerModule, nil, { RoduxModule.thunkMiddleware })
				}, {
					FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, { Story = Callback(p1) })
				})
			})
		end
	end
}
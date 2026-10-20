local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local StyleModule = require(Parent.Style)
local LocalizationModule = require(Parent.Localization)
local Signal = require(Parent.Dev.AppCommonLib).Signal
local RoactNavigationModule = require(Parent.Dev.RoactNavigation)

local function staticReducer(p1)
	return p1
end

return function(Child, p1)
	-- upvalues: ReactModule (copy), RoactRoduxModule (copy), RoduxModule (copy), staticReducer (copy), RoactNavigationModule (copy), StyleModule (copy), LocalizationModule (copy), Signal (copy)
	return ReactModule.createElement(RoactRoduxModule.StoreProvider, {
		store = RoduxModule.Store.new(staticReducer, {}, { RoduxModule.thunkMiddleware })
	}, {
		Navigation = ReactModule.createElement(RoactNavigationModule.Provider, {
			value = p1 and p1.navigation or { navigate = function() end }
		}, {
			UiModeStyle = ReactModule.createElement(StyleModule.UiModeStyleProvider, { style = { themeName = "Dark", fontName = "Gotham" } }, {
				DesignTokenProvider = ReactModule.createElement(StyleModule.DesignTokenProvider, { tokenMappers = {} }, {
					localization = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
						localization = {
							Format = function(_, p2, _)
								return p2
							end,
							changed = Signal.new()
						}
					}, { child = Child })
				})
			})
		})
	})
end
local Parent = script:FindFirstAncestor("UserRelationshipModals").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RoactRoduxModule = require(Parent.RoactRodux)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoduxModule = require(Parent.Rodux)
local MockLocalizationModule = require(script.Parent.mockLocalization)

return function(Component, p1)
	-- upvalues: RoduxModule (copy), ReactModule (copy), LocalizationProvider (copy), MockLocalizationModule (copy), FoundationModule (copy), RoactRoduxModule (copy)
	return ReactModule.createElement(LocalizationProvider, { localization = MockLocalizationModule }, {
		Provider = ReactModule.createElement(FoundationModule.FoundationProvider, {
			colorMode = "Dark",
			preferences = { reducedMotion = true }
		}, {
			ReactModule.createElement(RoactRoduxModule.StoreProvider, {
				store = if p1 == nil then RoduxModule.Store.new(function()
					return {
						UserRelationshipModals = { LocalUserId = 456, NetworkStatus = {} }
					}
				end, {}, { RoduxModule.thunkMiddleware }) else p1.store
			}, { component = Component })
		})
	})
end
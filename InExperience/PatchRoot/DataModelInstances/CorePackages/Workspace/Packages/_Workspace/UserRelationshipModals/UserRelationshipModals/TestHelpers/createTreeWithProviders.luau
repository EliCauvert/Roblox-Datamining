local parent = script:FindFirstAncestor("UserRelationshipModals").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local roactRoduxModule = require(parent.RoactRodux)
local localizationProvider = require(parent.Localization).LocalizationProvider
local roduxModule = require(parent.Rodux)
local mockLocalizationModule = require(script.Parent.mockLocalization)

return function(p0, p1)
	-- upvalues: roduxModule (ref), reactModule (ref), localizationProvider (ref), mockLocalizationModule (ref), foundationModule (ref), roactRoduxModule (ref)
	return reactModule.createElement(localizationProvider, { localization = mockLocalizationModule }, {
		Provider = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = "Dark",
			preferences = { reducedMotion = true }
		}, {
			reactModule.createElement(roactRoduxModule.StoreProvider, {
				store = if p1 ~= nil then roduxModule.Store.new(function()
					return {
						UserRelationshipModals = { LocalUserId = 456, NetworkStatus = {} }
					}
				end, {}, { roduxModule.thunkMiddleware }) else p1.store
			}, { component = p0 })
		})
	})
end
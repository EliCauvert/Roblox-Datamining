local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local inspectAndBuyReducerModule = require(parent.Reducers.InspectAndBuyReducer)
local constantsModule = require(parent.Constants)
local compactViewModule = require(parent.CompactView)
local wideViewModule = require(parent.WideView)
local renderWithCoreScriptsStyleProviderModule = require(parent_1.Common.renderWithCoreScriptsStyleProvider)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local testContainer = roactModule.Component:extend("TestContainer")

function testContainer.init(p0)
	-- upvalues: roduxModule (ref), inspectAndBuyReducerModule (ref), constantsModule (ref), compactViewModule (ref), wideViewModule (ref)
	p0.store = p0.props.overrideStore or roduxModule.Store.new(inspectAndBuyReducerModule, {}, { roduxModule.thunkMiddleware })
	p0.views = {}
	p0.views[constantsModule.View.Compact] = compactViewModule
	p0.views[constantsModule.View.Wide] = wideViewModule
end

function testContainer.render(p1)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), roactRoduxModule (ref), renderWithCoreScriptsStyleProviderModule (ref)
	local var11 = 0
	
	for i, v in p1.props[roactModule.Children] do
		var11 += 1
	end
	assert(var11 > 0, "TestContainer: no children provided, nothing will be tested")
	
	return roactModule.createElement(inspectAndBuyContextModule.Provider, { value = p1.views }, {
		roactModule.createElement(roactRoduxModule.StoreProvider, { store = p1.store }, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				InspectMenu = roactModule.createElement("ScreenGui", {}, p1.props[roactModule.Children])
			})
		})
	})
end

return testContainer
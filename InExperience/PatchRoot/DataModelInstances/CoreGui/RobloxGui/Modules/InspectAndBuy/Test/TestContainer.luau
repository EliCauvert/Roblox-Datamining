local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local InspectAndBuyReducerModule = require(Parent.Reducers.InspectAndBuyReducer)
local ConstantsModule = require(Parent.Constants)
local CompactViewModule = require(Parent.CompactView)
local WideViewModule = require(Parent.WideView)
local RenderWithCoreScriptsStyleProviderModule = require(Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local TestContainer = RoactModule.Component:extend("TestContainer")

function TestContainer.init(p1) --[[ Line: 23 ]]
	-- upvalues: RoduxModule (copy), InspectAndBuyReducerModule (copy), ConstantsModule (copy), CompactViewModule (copy), WideViewModule (copy)
	p1.store = p1.props.overrideStore or RoduxModule.Store.new(InspectAndBuyReducerModule, {}, { RoduxModule.thunkMiddleware })
	p1.views = {}
	p1.views[ConstantsModule.View.Compact] = CompactViewModule
	p1.views[ConstantsModule.View.Wide] = WideViewModule
end

function TestContainer.render(p1) --[[ Line: 33 ]]
	-- upvalues: RoactModule (copy), InspectAndBuyContextModule (copy), RoactRoduxModule (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	local Count = 0
	
	for _, _ in p1.props[RoactModule.Children] do
		Count += 1
	end
	assert(Count > 0, "TestContainer: no children provided, nothing will be tested")
	
	return RoactModule.createElement(InspectAndBuyContextModule.Provider, { value = p1.views }, {
		RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p1.store }, {
			ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
				InspectMenu = RoactModule.createElement("ScreenGui", {}, p1.props[RoactModule.Children])
			})
		})
	})
end

return TestContainer
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local BubbleChatBillboardsModule = require(script.Parent.BubbleChatBillboards)
local App = RoactModule.Component:extend("App")
App.validateProps = TModule.strictInterface({ store = TModule.table })

function App.render(p1)
	-- upvalues: RoactModule (copy), RoactRoduxModule (copy), BubbleChatBillboardsModule (copy)
	return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p1.props.store }, {
		BubbleChatBillboards = RoactModule.createElement(BubbleChatBillboardsModule)
	})
end

return App
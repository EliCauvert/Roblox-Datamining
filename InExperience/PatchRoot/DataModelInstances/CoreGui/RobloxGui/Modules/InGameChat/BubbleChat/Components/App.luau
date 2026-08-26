local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local bubbleChatBillboardsModule = require(script.Parent.BubbleChatBillboards)
local app = roactModule.Component:extend("App")
app.validateProps = tModule.strictInterface({ store = tModule.table })

function app.render(p1)
	-- upvalues: roactModule (ref), roactRoduxModule (ref), bubbleChatBillboardsModule (ref)
	return roactModule.createElement(roactRoduxModule.StoreProvider, { store = p1.props.store }, {
		BubbleChatBillboards = roactModule.createElement(bubbleChatBillboardsModule)
	})
end

return app
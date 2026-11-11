local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local SignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Signal)
local TopBarSearchSignalProvider = RoactModule.Component:extend("TopBarSearchSignalProvider")
local Context = RoactModule.createContext(nil)
local FFlagAXMigrateCatalogPageInputBindings = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings

function TopBarSearchSignalProvider.init(p1)
	-- upvalues: SignalModule (copy)
	p1.signal = SignalModule.new()
end

function TopBarSearchSignalProvider.render(p1)
	-- upvalues: RoactModule (copy), Context (copy)
	return RoactModule.createElement(Context.Provider, { value = p1.signal }, p1.props[RoactModule.Children])
end

return {
	Provider = TopBarSearchSignalProvider,
	Consumer = Context.Consumer,
	Context = if FFlagAXMigrateCatalogPageInputBindings then Context else nil
}
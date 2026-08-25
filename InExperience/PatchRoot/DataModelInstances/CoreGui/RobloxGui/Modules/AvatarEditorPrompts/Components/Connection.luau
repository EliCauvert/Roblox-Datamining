local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local contextActionsBinderModule = require(script.ContextActionsBinder)
local connection = roactModule.PureComponent:extend("Connection")

function connection.render(_)
	-- upvalues: roactModule (ref), contextActionsBinderModule (ref)
	return roactModule.createFragment({
		ContextActionsBinder = roactModule.createElement(contextActionsBinderModule)
	})
end

return connection
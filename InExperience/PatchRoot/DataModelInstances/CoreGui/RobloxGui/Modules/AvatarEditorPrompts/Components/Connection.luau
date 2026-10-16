local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ContextActionsBinderModule = require(script.ContextActionsBinder)
local Connection = RoactModule.PureComponent:extend("Connection")

function Connection:render() --[[ Line: 9 ]]
	-- upvalues: RoactModule (copy), ContextActionsBinderModule (copy)
	return RoactModule.createFragment({
		ContextActionsBinder = RoactModule.createElement(ContextActionsBinderModule)
	})
end

return Connection
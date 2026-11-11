local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local SignalConnection = require(CorePackages.Packages.Roact).PureComponent:extend("SignalConnection")
SignalConnection.validateProps = TModule.strictInterface({ callback = TModule.callback, signal = TModule.table })

function SignalConnection.init(p1)
	p1.connection = nil
end

function SignalConnection:render()
	return nil
end

function SignalConnection.didMount(p1)
	p1.connection = p1.props.signal:connect(p1.props.callback)
end

function SignalConnection.didUpdate(p1, p2)
	if p1.props.callback ~= p2.callback or p1.props.signal ~= p2.signal then
		p1.connection:disconnect()
		p1.connection = p1.props.signal:connect(p1.props.callback)
	end
end

function SignalConnection.willUnmount(p1)
	if p1.connection then
		p1.connection:disconnect()
		p1.connection = nil
	end
end

return SignalConnection
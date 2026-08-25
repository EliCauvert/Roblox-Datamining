local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local dataConsumerModule = require(script.Parent.Parent.DataConsumer)
local logOutputModule = require(script.Parent.LogOutput)
local clientLog = roactModule.Component:extend("ClientLog")

function clientLog.init(p0)
	function p0.initClientLogData()
		-- upvalues: p0 (ref)
		return p0.props.ClientLogData:getLogData()
	end
end

function clientLog.render(p1)
	-- upvalues: roactModule (ref), logOutputModule (ref)
	return roactModule.createElement(logOutputModule, {
		layoutOrder = p1.props.layoutOrder,
		size = p1.props.size,
		initLogOutput = p1.initClientLogData,
		targetSignal = p1.props.ClientLogData:Signal()
	})
end

return dataConsumerModule(clientLog, "ClientLogData")
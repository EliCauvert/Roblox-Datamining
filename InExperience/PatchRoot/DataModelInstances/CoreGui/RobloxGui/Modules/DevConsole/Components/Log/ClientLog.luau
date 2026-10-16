local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DataConsumerModule = require(script.Parent.Parent.DataConsumer)
local LogOutputModule = require(script.Parent.LogOutput)
local ClientLog = RoactModule.Component:extend("ClientLog")

function ClientLog.init(p1) --[[ Line: 9 ]]
	function p1.initClientLogData() --[[ Line: 10 ]]
		-- upvalues: p1 (copy)
		return p1.props.ClientLogData:getLogData()
	end
end

function ClientLog.render(p1) --[[ Line: 14 ]]
	-- upvalues: RoactModule (copy), LogOutputModule (copy)
	return RoactModule.createElement(LogOutputModule, {
		layoutOrder = p1.props.layoutOrder,
		size = p1.props.size,
		initLogOutput = p1.initClientLogData,
		targetSignal = p1.props.ClientLogData:Signal()
	})
end

return DataConsumerModule(ClientLog, "ClientLogData")
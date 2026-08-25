local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local dataConsumerModule = require(script.Parent.Parent.DataConsumer)
local commandLineHeight = require(script.Parent.Parent.Parent.Constants).LogFormatting.CommandLineHeight
local devConsoleCommandLineModule = require(script.Parent.DevConsoleCommandLine)
local logOutputModule = require(script.Parent.LogOutput)
local serverLog = roactModule.Component:extend("ServerLog")

function serverLog.init(p0)
	function p0.initServerLogData()
		-- upvalues: p0 (ref)
		return p0.props.ServerLogData:getLogData()
	end
end

function serverLog.render(p1)
	-- upvalues: roactModule (ref), logOutputModule (ref), commandLineHeight (ref), devConsoleCommandLineModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.size,
		LayoutOrder = p1.props.layoutOrder
	}, {
		Scroll = roactModule.createElement(logOutputModule, {
			size = UDim2.new(1, 0, 1, -(commandLineHeight + 4)),
			targetSignal = p1.props.ServerLogData:Signal(),
			initLogOutput = p1.initServerLogData
		}),
		CommandLine = roactModule.createElement(devConsoleCommandLineModule, {
			pos = UDim2.new(0, 0, 1, -commandLineHeight),
			height = commandLineHeight
		})
	})
end

return dataConsumerModule(serverLog, "ServerLogData")
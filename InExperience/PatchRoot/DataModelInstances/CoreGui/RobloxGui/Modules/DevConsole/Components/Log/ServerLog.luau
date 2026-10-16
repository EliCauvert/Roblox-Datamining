local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DataConsumerModule = require(script.Parent.Parent.DataConsumer)
local CommandLineHeight = require(script.Parent.Parent.Parent.Constants).LogFormatting.CommandLineHeight
local DevConsoleCommandLineModule = require(script.Parent.DevConsoleCommandLine)
local LogOutputModule = require(script.Parent.LogOutput)
local ServerLog = RoactModule.Component:extend("ServerLog")

function ServerLog.init(p1) --[[ Line: 15 ]]
	function p1.initServerLogData() --[[ Line: 16 ]]
		-- upvalues: p1 (copy)
		return p1.props.ServerLogData:getLogData()
	end
end

function ServerLog.render(p1) --[[ Line: 21 ]]
	-- upvalues: RoactModule (copy), LogOutputModule (copy), CommandLineHeight (copy), DevConsoleCommandLineModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.size,
		LayoutOrder = p1.props.layoutOrder
	}, {
		Scroll = RoactModule.createElement(LogOutputModule, {
			size = UDim2.new(1, 0, 1, -(CommandLineHeight + 4)),
			targetSignal = p1.props.ServerLogData:Signal(),
			initLogOutput = p1.initServerLogData
		}),
		CommandLine = RoactModule.createElement(DevConsoleCommandLineModule, {
			pos = UDim2.new(0, 0, 1, -CommandLineHeight),
			height = CommandLineHeight
		})
	})
end

return DataConsumerModule(ServerLog, "ServerLogData")
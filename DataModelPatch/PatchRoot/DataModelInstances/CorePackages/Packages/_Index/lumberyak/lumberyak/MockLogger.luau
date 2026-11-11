local MockLoggerModule = {
	Levels = {
		Error = "MockError",
		Warning = "MockWarning",
		Info = "MockInfo",
		Debug = "MockDebug",
		Trace = "MockTrace",
		fromString = function(): string
			return "MockInfo"
		end
	}
}
MockLoggerModule.__index = MockLoggerModule

function MockLoggerModule.new()
	-- upvalues: MockLoggerModule (copy)
	return (setmetatable({}, MockLoggerModule))
end

function MockLoggerModule.setParent() end

function MockLoggerModule.setContext() end

function MockLoggerModule.addSink() end

function MockLoggerModule.error() end

function MockLoggerModule.warning() end

function MockLoggerModule.info() end

function MockLoggerModule.debug() end

function MockLoggerModule.trace() end

return MockLoggerModule
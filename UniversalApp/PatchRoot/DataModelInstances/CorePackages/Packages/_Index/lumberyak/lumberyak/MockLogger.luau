local MockLoggerModule = {
	Levels = {
		Error = "MockError",
		Warning = "MockWarning",
		Info = "MockInfo",
		Debug = "MockDebug",
		Trace = "MockTrace",
		fromString = function(): string --[[ Line: 12 ]]
			return "MockInfo"
		end
	}
}
MockLoggerModule.__index = MockLoggerModule

function MockLoggerModule.new() --[[ Line: 19 ]]
	-- upvalues: MockLoggerModule (copy)
	return (setmetatable({}, MockLoggerModule))
end

function MockLoggerModule.setParent() --[[ Line: 23 ]] end

function MockLoggerModule.setContext() --[[ Line: 26 ]] end

function MockLoggerModule.addSink() --[[ Line: 29 ]] end

function MockLoggerModule.error() --[[ Line: 32 ]] end

function MockLoggerModule.warning() --[[ Line: 35 ]] end

function MockLoggerModule.info() --[[ Line: 38 ]] end

function MockLoggerModule.debug() --[[ Line: 41 ]] end

function MockLoggerModule.trace() --[[ Line: 44 ]] end

return MockLoggerModule
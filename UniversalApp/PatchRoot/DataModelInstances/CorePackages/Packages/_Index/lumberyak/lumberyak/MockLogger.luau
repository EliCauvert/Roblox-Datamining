local t = {
	Levels = {
		Error = "MockError",
		Warning = "MockWarning",
		Info = "MockInfo",
		Debug = "MockDebug",
		Trace = "MockTrace",
		fromString = function()
			return "MockInfo"
		end
	}
}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.setParent() end

function t.setContext() end

function t.addSink() end

function t.error() end

function t.warning() end

function t.info() end

function t.debug() end

function t.trace() end

return t
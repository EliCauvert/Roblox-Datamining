local LoggerModule = require(game.LoadedCode.Packages.Lumberyak.Logger)

local function timeit(Callback, Callback1: (any) -> ()): number
	local CallbackResult = Callback()
	local CurrentTime = tick()
	
	for _ = 1, 2000000 do
		Callback1(CallbackResult)
	end
	return (tick() - CurrentTime) / 2000000
end

local function callSimple(p1)
	p1:info("foo")
end

local function callInterp(p1)
	p1:info("foo {}", 2)
end

local function simple()
	-- upvalues: LoggerModule (copy)
	local NewNumber = 0
	local config = {
		maxLevel = LoggerModule.Levels.Info,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local NewLogger = LoggerModule.new()
	NewLogger:setContext({ number = 1 })
	NewLogger:addSink(config)
	
	return NewLogger
end

local function empty()
	return { info = function() end }
end

local function off()
	-- upvalues: LoggerModule (copy)
	local NewNumber = 0
	local config = {
		maxLevel = LoggerModule.Levels.Error,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local NewLogger = LoggerModule.new()
	NewLogger:setContext({ number = 1 })
	NewLogger:addSink(config)
	
	return NewLogger
end

local function short()
	-- upvalues: LoggerModule (copy)
	local NewNumber = 0
	local config = {
		maxLevel = LoggerModule.Levels.Info,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local NewLogger = LoggerModule.new()
	local NewResult = NewLogger:new()
	NewLogger:setContext({ number = 1 })
	NewLogger:addSink(config)
	
	return NewResult
end

local function long()
	-- upvalues: LoggerModule (copy)
	local NewNumber = 0
	local config = {
		maxLevel = LoggerModule.Levels.Info,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local NewLogger = LoggerModule.new()
	NewLogger:setContext({ number = 1 })
	NewLogger:addSink(config)
	
	return (NewLogger:new():new():new():new())
end

local function many()
	-- upvalues: LoggerModule (copy)
	local NewNumber = 0
	local config = {
		maxLevel = LoggerModule.Levels.Error,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local config1 = {
		maxLevel = LoggerModule.Levels.Warning,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local config2 = {
		maxLevel = LoggerModule.Levels.Info,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local config3 = {
		maxLevel = LoggerModule.Levels.Debug,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local config4 = {
		maxLevel = LoggerModule.Levels.Trace,
		log = function(_, _, p1)
			-- upvalues: NewNumber (ref)
			NewNumber += p1.number
		end
	}
	local NewLogger = LoggerModule.new()
	NewLogger:setContext({ number = 1 })
	NewLogger:addSink(config)
	NewLogger:addSink(config1)
	NewLogger:addSink(config2)
	NewLogger:addSink(config3)
	NewLogger:addSink(config4)
	
	return NewLogger
end

local TimeitResult: number = timeit(empty, callSimple)
local TimeitResult1: number = timeit(empty, callInterp)
local config = {
	["Log level off"] = off,
	["Simple logger"] = simple,
	["Short chain"] = short,
	["Long chain"] = long,
	["Many sinks"] = many
}

local function _(Text, Text1, p1)
	-- upvalues: TimeitResult (copy)
	print(string.format("%-40s %0.3e [%0.4fx]", Text .. " - " .. Text1, p1, p1 / TimeitResult))
end

print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Simple", TimeitResult, TimeitResult / TimeitResult))
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Interpolation", TimeitResult1, TimeitResult1 / TimeitResult))

for i, value in pairs(config) do
	local TimeitResult2: number = timeit(value, callSimple)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Simple", TimeitResult2, TimeitResult2 / TimeitResult))
	local TimeitResult3: number = timeit(value, callInterp)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Interpolation", TimeitResult3, TimeitResult3 / TimeitResult))
end
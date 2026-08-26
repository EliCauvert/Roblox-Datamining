local loggerModule = require(game.LoadedCode.Packages.Lumberyak.Logger)

local function timeit(p1, p2)
	local var1 = p1()
	local currentTime = tick()
	
	for _ = 1, 2000000 do
		p2(var1)
	end
	return (tick() - currentTime) / 2000000
end

local function callSimple(p3)
	p3:info("foo")
end

local function callInterp(p3)
	p3:info("foo {}", 2)
end

local function simple()
	-- upvalues: loggerModule (ref)
	local var2 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local var3 = loggerModule.new()
	var3:setContext({ number = 1 })
	var3:addSink(t)
	
	return var3
end

local function empty()
	return { info = function() end }
end

local function off()
	-- upvalues: loggerModule (ref)
	local var2 = 0
	local t = {
		maxLevel = loggerModule.Levels.Error,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local var3 = loggerModule.new()
	var3:setContext({ number = 1 })
	var3:addSink(t)
	
	return var3
end

local function short()
	-- upvalues: loggerModule (ref)
	local var2 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local var3 = loggerModule.new()
	local var4 = var3:new()
	var3:setContext({ number = 1 })
	var3:addSink(t)
	
	return var4
end

local function long()
	-- upvalues: loggerModule (ref)
	local var2 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local var3 = loggerModule.new()
	var3:setContext({ number = 1 })
	var3:addSink(t)
	
	return var3:new():new():new():new()
end

local function many()
	-- upvalues: loggerModule (ref)
	local var2 = 0
	local t = {
		maxLevel = loggerModule.Levels.Error,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local t_1 = {
		maxLevel = loggerModule.Levels.Warning,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local t_2 = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local t_3 = {
		maxLevel = loggerModule.Levels.Debug,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local t_4 = {
		maxLevel = loggerModule.Levels.Trace,
		log = function(_, _, p3)
			-- upvalues: var2 (write)
			var2 += p3.number
		end
	}
	local var3 = loggerModule.new()
	var3:setContext({ number = 1 })
	var3:addSink(t)
	var3:addSink(t_1)
	var3:addSink(t_2)
	var3:addSink(t_3)
	var3:addSink(t_4)
	
	return var3
end

local var2 = timeit(empty, callSimple)
local var3 = timeit(empty, callInterp)
local t = {
	["Log level off"] = off,
	["Simple logger"] = simple,
	["Short chain"] = short,
	["Long chain"] = long,
	["Many sinks"] = many
}

local function _(p3, p4, p5)
	-- upvalues: var2 (ref)
	print(string.format("%-40s %0.3e [%0.4fx]", p3 .. " - " .. p14, p5, p5 / var2))
end

print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Simple", var2, var2 / var2))
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Interpolation", var3, var3 / var2))

for i, v in pairs(t) do
	local var4 = timeit(v, callSimple)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Simple", var4, var4 / var2))
	local var5 = timeit(v, callInterp)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Interpolation", var5, var5 / var2))
end
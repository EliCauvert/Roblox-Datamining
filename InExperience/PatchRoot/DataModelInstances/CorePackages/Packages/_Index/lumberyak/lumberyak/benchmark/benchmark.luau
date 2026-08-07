local loggerModule = require(game.LoadedCode.Packages.Lumberyak.Logger)

local function timeit(p0, p1) --[[ line: 5 ]]
	local var15 = p0()
	local currentTime = tick()
	
	for _ = 1, 2000000 do
		p1(var15)
	end
	return (tick() - currentTime) / 2000000
end

local function callSimple(p2) --[[ line: 15 ]]
	p2:info("foo")
end

local function callInterp(p3) --[[ line: 19 ]]
	p3:info("foo {}", 2)
end

local function simple() --[[ line: 23 ]]
	-- upvalues: loggerModule (ref)
	local var17 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p4) --[[ line: 27 ]]
			-- upvalues: var17 (write)
			var17 += p4.number
		end
	}
	local var19 = loggerModule.new()
	var19:setContext({ number = 1 })
	var19:addSink(t)
	
	return var19
end

local function empty() --[[ line: 38 ]]
	return { info = function() --[[ line: 40 ]] end }
end

local function off() --[[ line: 44 ]]
	-- upvalues: loggerModule (ref)
	local var20 = 0
	local t = {
		maxLevel = loggerModule.Levels.Error,
		log = function(_, _, p5) --[[ line: 48 ]]
			-- upvalues: var20 (write)
			var20 += p5.number
		end
	}
	local var22 = loggerModule.new()
	var22:setContext({ number = 1 })
	var22:addSink(t)
	
	return var22
end

local function short() --[[ line: 59 ]]
	-- upvalues: loggerModule (ref)
	local var23 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p6) --[[ line: 63 ]]
			-- upvalues: var23 (write)
			var23 += p6.number
		end
	}
	local var25 = loggerModule.new()
	local var26 = var25:new()
	var25:setContext({ number = 1 })
	var25:addSink(t)
	
	return var26
end

local function long() --[[ line: 75 ]]
	-- upvalues: loggerModule (ref)
	local var27 = 0
	local t = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p7) --[[ line: 79 ]]
			-- upvalues: var27 (write)
			var27 += p7.number
		end
	}
	local var29 = loggerModule.new()
	var29:setContext({ number = 1 })
	var29:addSink(t)
	
	return var29:new():new():new():new()
end

local function many() --[[ line: 94 ]]
	-- upvalues: loggerModule (ref)
	local var30 = 0
	local t = {
		maxLevel = loggerModule.Levels.Error,
		log = function(_, _, p8) --[[ line: 98 ]]
			-- upvalues: var30 (write)
			var30 += p8.number
		end
	}
	local t_1 = {
		maxLevel = loggerModule.Levels.Warning,
		log = function(_, _, p9) --[[ line: 104 ]]
			-- upvalues: var30 (write)
			var30 += p9.number
		end
	}
	local t_2 = {
		maxLevel = loggerModule.Levels.Info,
		log = function(_, _, p10) --[[ line: 110 ]]
			-- upvalues: var30 (write)
			var30 += p10.number
		end
	}
	local t_3 = {
		maxLevel = loggerModule.Levels.Debug,
		log = function(_, _, p11) --[[ line: 116 ]]
			-- upvalues: var30 (write)
			var30 += p11.number
		end
	}
	local t_4 = {
		maxLevel = loggerModule.Levels.Trace,
		log = function(_, _, p12) --[[ line: 122 ]]
			-- upvalues: var30 (write)
			var30 += p12.number
		end
	}
	local var36 = loggerModule.new()
	var36:setContext({ number = 1 })
	var36:addSink(t)
	var36:addSink(t_1)
	var36:addSink(t_2)
	var36:addSink(t_3)
	var36:addSink(t_4)
	
	return var36
end

local var10 = timeit(empty, callSimple)
local var11 = timeit(empty, callInterp)
local t = {
	["Log level off"] = off,
	["Simple logger"] = simple,
	["Short chain"] = short,
	["Long chain"] = long,
	["Many sinks"] = many
}

local function _(p13, p14, p15) --[[ line: 148 | named "fmt" ]]
	-- upvalues: var10 (ref)
	print(string.format("%-40s %0.3e [%0.4fx]", p13 .. " - " .. p14, p15, p15 / var10))
end

print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Simple", var10, var10 / var10))
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function - Interpolation", var11, var11 / var10))

for i, v in pairs(t) do
	local var13 = timeit(v, callSimple)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Simple", var13, var13 / var10))
	local var14 = timeit(v, callInterp)
	print(string.format("%-40s %0.3e [%0.4fx]", i .. " - " .. "Interpolation", var14, var14 / var10))
end
local appDebug = script:FindFirstAncestor("AppDebug")
local parent = appDebug.Parent
local dashModule = require(parent.Dash)
local lumberyakModule = require(parent.Lumberyak)
local levels = lumberyakModule.Logger.Levels
local sharedSinkModule = require(appDebug.SharedSink)
local root = lumberyakModule.Logger.new(nil, "root")
local currentTime = tick()
local t = { ["*"] = root }
root:setContext({
	tostring = function(p1)
		-- upvalues: dashModule (ref)
		if typeof(p1) == "string" then
			return p1
		end
		local var1 = getmetatable(p1)
		
		return if var1 and var1.__tostring then tostring(p1) else dashModule.pretty(p1)
	end
})

local function _(p1, p2)
	-- upvalues: lumberyakModule (ref), t (ref)
	local var1 = lumberyakModule.Logger.new(p1, p2)
	t[p2] = var1
	
	return var1
end

local function createLoggerTree(p1)
	-- upvalues: root (ref), t (ref), lumberyakModule (ref)
	local var1 = p1:split(".")
	local var2 = ""
	local var3 = root
	
	for i, v in var1 do
		if v == "" then
			error("Invalid log tag: " .. p3)
		end
		var2 = if i == 1 then v else var2 .. "." .. v
		local var4 = t[var2]
		
		if not var4 then
			local var5 = var2
			local var6 = lumberyakModule.Logger.new(var3, var5)
			t[var5] = var6
			var4 = var6
		end
		var3 = var4
	end
	return var3
end

local function logger(p2)
	-- upvalues: t (ref), createLoggerTree (ref)
	return t[p2] or createLoggerTree(p2)
end

local _ = function(value)
	-- upvalues: dashModule (ref), levels (ref)
	local var7 = value:split(":")
	
	if #var7 == 2 then
		local unpacked, unpacked_1 = table.unpack(var7)
		
		return dashModule.trim(unpacked), levels.fromString(unpacked_1)
	end
	warn("Invalid LogTree value: " .. value)
	
	return nil, nil
end

local _ = function(p2)
	-- upvalues: dashModule (ref)
	return dashModule.filter(dashModule.splitOn(p2, "%s+"), function(p3)
		return #p3 > 0
	end)
end

return {
	logger = logger,
	formatLog = function(p2, p3, p4)
		-- upvalues: currentTime (ref)
		local formattedText = string.format("%s [%s] %s", p3.level:sub(1, 1), p3.loggerName, p2)
		
		if p4 then
			formattedText = string.format("[%0.3f] %s", tick() - currentTime, formattedText)
		end
		return formattedText
	end,
	logToConsole = function(_, p2, p3)
		-- upvalues: levels (ref)
		local level = p3.level
		local formattedText = string.format("%s [%s] %s", p3.level:sub(1, 1), p3.loggerName, p2)
		
		if level == levels.Error or level == levels.Warning then
			warn(formattedText)
			
			return
		end
		print(formattedText)
	end,
	setLogTags = function(value, p2)
		-- upvalues: sharedSinkModule (ref), dashModule (ref), levels (ref), t (ref), createLoggerTree (ref)
		local var7 = sharedSinkModule.new(p2)
		
		for i, v in dashModule.filter(dashModule.splitOn(value, "%s+"), function(p3)
			return #p3 > 0
		end) do
			local var8, var9
			local var10 = v:split(":")
			
			if #var10 == 2 then
				local unpacked, unpacked_1 = table.unpack(var10)
				var8 = dashModule.trim(unpacked)
				var9 = levels.fromString(unpacked_1)
			else
				warn("Invalid LogTree value: " .. v)
				var8 = nil
				var9 = nil
			end
			if var8 ~= nil then
				local var11 = tostring(var8);
				(t[var11] or createLoggerTree(var11)):addSink(var7:newSink(var9))
			end
		end
	end
}
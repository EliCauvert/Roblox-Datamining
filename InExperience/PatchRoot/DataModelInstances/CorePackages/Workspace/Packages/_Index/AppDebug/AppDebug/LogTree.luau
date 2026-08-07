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
	tostring = function(p0) --[[ line: 46 ]]
		-- upvalues: dashModule (ref)
		if typeof(p0) == "string" then
			return p0
		end
		local var9 = getmetatable(p0)
		
		return if var9 and var9.__tostring then tostring(p0) else dashModule.pretty(p0)
	end
})

local function _(p1, p2) --[[ line: 63 | named "newLogger" ]]
	-- upvalues: lumberyakModule (ref), t (ref)
	local var10 = lumberyakModule.Logger.new(p1, p2)
	t[p2] = var10
	
	return var10
end

local function createLoggerTree(p3) --[[ line: 69 ]]
	-- upvalues: root (ref), t (ref), lumberyakModule (ref)
	local var11 = p3:split(".")
	local var12 = ""
	local var13 = root
	
	for i, v in var11 do
		if v == "" then
			error("Invalid log tag: " .. p3)
		end
		var12 = if i == 1 then v else var12 .. "." .. v
		local var14 = t[var12]
		
		if not var14 then
			local var15 = var12
			local var16 = lumberyakModule.Logger.new(var13, var15)
			t[var15] = var16
			var14 = var16
		end
		var13 = var14
	end
	return var13
end

local function logger(p4) --[[ line: 88 ]]
	-- upvalues: t (ref), createLoggerTree (ref)
	return t[p4] or createLoggerTree(p4)
end

local _ = function(value) --[[ line: 92 | named "parseTag" ]]
	-- upvalues: dashModule (ref), levels (ref)
	local var17 = value:split(":")
	
	if #var17 == 2 then
		local unpacked, unpacked_1 = table.unpack(var17)
		
		return dashModule.trim(unpacked), levels.fromString(unpacked_1)
	end
	warn("Invalid LogTree value: " .. value)
	
	return nil, nil
end

local _ = function(p5) --[[ line: 123 | named "splitNonEmpty" ]]
	-- upvalues: dashModule (ref)
	return dashModule.filter(dashModule.splitOn(p5, "%s+"), function(p6) --[[ line: 125 ]]
		return #p6 > 0
	end)
end

return {
	logger = logger,
	formatLog = function(p7, p8, p9) --[[ line: 103 ]]
		-- upvalues: currentTime (ref)
		local formattedText = string.format("%s [%s] %s", p8.level:sub(1, 1), p8.loggerName, p7)
		
		if p9 then
			formattedText = string.format("[%0.3f] %s", tick() - currentTime, formattedText)
		end
		return formattedText
	end,
	logToConsole = function(_, p10, p11) --[[ line: 113 ]]
		-- upvalues: levels (ref)
		local level = p11.level
		local formattedText = string.format("%s [%s] %s", p11.level:sub(1, 1), p11.loggerName, p10)
		
		if level == levels.Error or level == levels.Warning then
			warn(formattedText)
			
			return
		end
		print(formattedText)
	end,
	setLogTags = function(value, p12) --[[ line: 130 ]]
		-- upvalues: sharedSinkModule (ref), dashModule (ref), levels (ref), t (ref), createLoggerTree (ref)
		local var22 = sharedSinkModule.new(p12)
		
		for i, v in dashModule.filter(dashModule.splitOn(value, "%s+"), function(p13) --[[ line: 125 ]]
			return #p13 > 0
		end) do
			local var24, var25
			local var23 = v:split(":")
			
			if #var23 == 2 then
				local unpacked, unpacked_1 = table.unpack(var23)
				var24 = dashModule.trim(unpacked)
				var25 = levels.fromString(unpacked_1)
			else
				warn("Invalid LogTree value: " .. v)
				var24 = nil
				var25 = nil
			end
			if var24 ~= nil then
				local var28 = tostring(var24);
				(t[var28] or createLoggerTree(var28)):addSink(var22:newSink(var25))
			end
		end
	end
}
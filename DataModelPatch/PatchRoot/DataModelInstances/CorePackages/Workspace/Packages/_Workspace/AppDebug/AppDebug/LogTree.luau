local AppDebug = script:FindFirstAncestor("AppDebug")
local Parent = AppDebug.Parent
local DashModule = require(Parent.Dash)
local LumberyakModule = require(Parent.Lumberyak)
local Levels = LumberyakModule.Logger.Levels
local SharedSinkModule = require(AppDebug.SharedSink)
local Root = LumberyakModule.Logger.new(nil, "root")
local CurrentTime = tick()
local NewResults = { ["*"] = Root }
Root:setContext({
	tostring = function(p1)
		-- upvalues: DashModule (copy)
		if typeof(p1) == "string" then
			return p1
		else
			local Meta = getmetatable(p1)
			
			return if Meta and Meta.__tostring then tostring(p1) else DashModule.pretty(p1)
		end
	end
})

local function _(p1, Key)
	-- upvalues: LumberyakModule (copy), NewResults (copy)
	local NewResult = LumberyakModule.Logger.new(p1, Key)
	NewResults[Key] = NewResult
	
	return NewResult
end

local function createLoggerTree(Text: string)
	-- upvalues: Root (copy), NewResults (copy), LumberyakModule (copy)
	local Text1 = ""
	local Root1 = Root
	
	for i, value in Text:split(".") do
		if value == "" then
			error("Invalid log tag: " .. Text)
		end
		if i == 1 then
			Text1 = value
		else
			Text1 ..= "." .. value
		end
		local NewResult = NewResults[Text1]
		
		if not NewResult then
			local NewResult1 = LumberyakModule.Logger.new(Root1, Text1)
			NewResults[Text1] = NewResult1
			NewResult = NewResult1
		end
		Root1 = NewResult
	end
	return Root1
end

local _ = function(Text: string)
	-- upvalues: DashModule (copy), Levels (copy)
	local v1 = Text:split(":")
	
	if #v1 == 2 then
		local Unpacked, Unpacked2 = table.unpack(v1)
		
		return DashModule.trim(Unpacked), Levels.fromString(Unpacked2)
	else
		warn("Invalid LogTree value: " .. Text)
		
		return nil, nil
	end
end

local _ = function(p1)
	-- upvalues: DashModule (copy)
	return DashModule.filter(DashModule.splitOn(p1, "%s+"), function(p2): boolean
		return #p2 > 0
	end)
end

return {
	logger = function(p1)
		-- upvalues: NewResults (copy), createLoggerTree (copy)
		return NewResults[p1] or createLoggerTree(p1)
	end,
	formatLog = function(p1, p2, p3): string
		-- upvalues: CurrentTime (copy)
		local Formatted = string.format("%s [%s] %s", p2.level:sub(1, 1), p2.loggerName, p1)
		
		if p3 then
			Formatted = string.format("[%0.3f] %s", tick() - CurrentTime, Formatted)
		end
		return Formatted
	end,
	logToConsole = function(_, p1, p2)
		-- upvalues: Levels (copy)
		local Level = p2.level
		local Formatted = string.format("%s [%s] %s", p2.level:sub(1, 1), p2.loggerName, p1)
		
		if Level == Levels.Error or Level == Levels.Warning then
			warn(Formatted)
			
			return
		else
			print(Formatted)
		end
	end,
	setLogTags = function(p1, p2)
		-- upvalues: SharedSinkModule (copy), DashModule (copy), Levels (copy), NewResults (copy), createLoggerTree (copy)
		local NewSharedSink = SharedSinkModule.new(p2)
		
		for _, Text in DashModule.filter(DashModule.splitOn(p1, "%s+"), function(p3): boolean
			return #p3 > 0
		end) do
			local v1 = Text:split(":")
			local TrimResult = nil
			local FromStringResult = nil
			
			if #v1 == 2 then
				local Unpacked, Unpacked2 = table.unpack(v1)
				TrimResult = DashModule.trim(Unpacked)
				FromStringResult = Levels.fromString(Unpacked2)
			else
				warn("Invalid LogTree value: " .. Text)
				TrimResult = nil
				FromStringResult = nil
			end
			if TrimResult ~= nil then
				local Text1 = tostring(TrimResult);
				(NewResults[Text1] or createLoggerTree(Text1)):addSink((NewSharedSink:newSink(FromStringResult)))
			end
		end
	end
}
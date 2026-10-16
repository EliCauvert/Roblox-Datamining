local CryoModule = require(script.Parent.Parent.Cryo)
local LoggerModule = {}
LoggerModule.__index = LoggerModule
LoggerModule.Levels = {
	Error = "Error",
	Warning = "Warning",
	Info = "Info",
	Debug = "Debug",
	Trace = "Trace"
}
local list = {
	LoggerModule.Levels.Error,
	LoggerModule.Levels.Warning,
	LoggerModule.Levels.Info,
	LoggerModule.Levels.Debug,
	LoggerModule.Levels.Trace
}
local t = {}

for i, value in pairs(list) do
	t[value] = i
end
function LoggerModule.Levels.fromString(Text: string): string? --[[ Line: 28 ]]
	-- upvalues: list (copy)
	if type(Text) ~= "string" then
		return nil
	end
	for _, value in pairs(list) do
		if string.lower(value) == string.lower(Text) then
			return value
		end
	end
	return nil
end

function LoggerModule.new(Parent, Name) --[[ Line: 40 ]]
	-- upvalues: LoggerModule (copy)
	local config = {
		dirty = true,
		name = Name,
		sinks = {},
		children = {},
		parent = Parent,
		context = {},
		active = {},
		cache = { sinks = {}, context = {} }
	}
	
	for i, _ in pairs(LoggerModule.Levels) do
		if Parent then
			config.active[i] = Parent.active[i]
		else
			config.active[i] = false
		end
	end
	if Parent then
		Parent.children[config] = true
	end
	setmetatable(config, LoggerModule)
	
	return config
end

local function setActive(MaxLevel, p1) --[[ Line: 72 ]]
	-- upvalues: t (copy), list (copy), setActive (copy)
	local Entry = t[MaxLevel]
	
	if Entry then
		for i = 1, Entry do
			p1.active[list[i]] = true
		end
		for i1, _ in pairs(p1.children) do
			setActive(MaxLevel, i1)
		end
	end
end

local function setDirty(p2) --[[ Line: 85 ]]
	-- upvalues: setDirty (copy)
	p2.dirty = true
	
	for i, _ in pairs(p2.children) do
		setDirty(i)
	end
end

local function updateCache(Parent) --[[ Line: 93 ]]
	-- upvalues: updateCache (copy), CryoModule (copy)
	if not Parent.dirty then return end
	if not Parent.parent then
		Parent.cache.context = Parent.context
		Parent.cache.sinks = Parent.sinks
		Parent.dirty = false
		
		return
	end
	updateCache(Parent.parent)
	Parent.cache.context = CryoModule.Dictionary.join(Parent.parent.cache.context, Parent.context)
	
	if Parent.parent.cache.context.prefix and Parent.context.prefix then
		Parent.cache.context.prefix = Parent.parent.cache.context.prefix .. Parent.context.prefix
	end
	Parent.cache.sinks = CryoModule.List.join(Parent.parent.cache.sinks, Parent.sinks)
	Parent.dirty = false
end

function LoggerModule:setParent(Parent) --[[ Line: 117 ]]
	-- upvalues: updateCache (copy), t (copy), setActive (copy), list (copy), setDirty (copy)
	if self.parent then
		self.parent.children[self] = nil
	end
	updateCache(Parent)
	self.parent = Parent
	self.parent.children[self] = true
	local Largest = -1
	
	for _, sink in pairs(Parent.cache.sinks) do
		if t[sink.maxLevel] then
			Largest = math.max(Largest, t[sink.maxLevel])
		end
	end
	if Largest > -1 then
		setActive(list[Largest], self)
	end
	self.dirty = true
	
	for i, _ in pairs(self.children) do
		setDirty(i)
	end
end

function LoggerModule:addSink(p3) --[[ Line: 141 ]]
	-- upvalues: setActive (copy), setDirty (copy)
	setActive(p3.maxLevel, self)
	table.insert(self.sinks, p3)
	self.dirty = true
	
	for i, _ in pairs(self.children) do
		setDirty(i)
	end
end

function LoggerModule:setContext(Context) --[[ Line: 147 ]]
	-- upvalues: setDirty (copy)
	self.context = Context
	self.dirty = true
	
	for i, _ in pairs(self.children) do
		setDirty(i)
	end
end

local function log(Level, p4, Entry) --[[ Line: 152 ]]
	-- upvalues: updateCache (copy), t (copy)
	if p4.dirty then
		updateCache(p4)
	end
	local config = { level = Level, rawMessage = Entry, loggerName = p4.name }
	
	for i, value in pairs(p4.cache.context) do
		if type(value) == "function" then
			config[i] = value()
		else
			config[i] = value
		end
	end
	local LUMBERYAKINTERNALNoLogMessageGiven = if Entry.n == 0 then "LUMBERYAK INTERNAL: No log message given" else Entry[1]
	
	if config.prefix then
		LUMBERYAKINTERNALNoLogMessageGiven = config.prefix .. LUMBERYAKINTERNALNoLogMessageGiven
	end
	if LUMBERYAKINTERNALNoLogMessageGiven:find("{") then
		local Count = 1
		LUMBERYAKINTERNALNoLogMessageGiven = LUMBERYAKINTERNALNoLogMessageGiven:gsub("{(.-)}", function(p5) --[[ Line: 186 ]]
			-- upvalues: Count (ref), Entry (copy), config (copy)
			if p5 == "" then
				Count += 1
				
				return (tostring(Entry[Count]))
			else
				local Entry1 = config[p5]
				
				return Entry1 and tostring(Entry1)
			end
		end)
		
		if Count < Entry.n then
			LUMBERYAKINTERNALNoLogMessageGiven ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
		elseif Entry.n < Count then
			LUMBERYAKINTERNALNoLogMessageGiven ..= "\nLUMBERYAK INTERNAL: Too few arguments given for format string"
		end
	elseif Entry.n > 1 then
		LUMBERYAKINTERNALNoLogMessageGiven ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
	end
	local Entry1 = t[Level]
	
	for _, sink in pairs(p4.cache.sinks) do
		if t[sink.maxLevel] and Entry1 <= t[sink.maxLevel] then
			sink:log(LUMBERYAKINTERNALNoLogMessageGiven, config)
		end
	end
end

function LoggerModule:error(...) --[[ Line: 213 ]]
	-- upvalues: LoggerModule (copy), log (copy)
	if self.active[LoggerModule.Levels.Error] then
		log(LoggerModule.Levels.Error, self, table.pack(...))
		
		return
	end
end

function LoggerModule:warning(...) --[[ Line: 220 ]]
	-- upvalues: LoggerModule (copy), log (copy)
	if self.active[LoggerModule.Levels.Warning] then
		log(LoggerModule.Levels.Warning, self, table.pack(...))
		
		return
	end
end

function LoggerModule:info(...) --[[ Line: 227 ]]
	-- upvalues: LoggerModule (copy), log (copy)
	if self.active[LoggerModule.Levels.Info] then
		log(LoggerModule.Levels.Info, self, table.pack(...))
		
		return
	end
end

function LoggerModule:debug(...) --[[ Line: 234 ]]
	-- upvalues: LoggerModule (copy), log (copy)
	if self.active[LoggerModule.Levels.Debug] then
		log(LoggerModule.Levels.Debug, self, table.pack(...))
		
		return
	end
end

function LoggerModule:trace(...) --[[ Line: 241 ]]
	-- upvalues: LoggerModule (copy), log (copy)
	if self.active[LoggerModule.Levels.Trace] then
		log(LoggerModule.Levels.Trace, self, table.pack(...))
		
		return
	end
end

return LoggerModule
local cryoModule = require(script.Parent.Parent.Cryo)
local t = {}
t.__index = t
t.Levels = {
	Error = "Error",
	Warning = "Warning",
	Info = "Info",
	Debug = "Debug",
	Trace = "Trace"
}
local list = {
	t.Levels.Error,
	t.Levels.Warning,
	t.Levels.Info,
	t.Levels.Debug,
	t.Levels.Trace
}
local t_1 = {}

for i, v in pairs(list) do
	t_1[v] = i
end
function t.Levels.fromString(p0) --[[ line: 28 ]]
	-- upvalues: list (ref)
	if type(p0) ~= "string" then
		return nil
	end
	for i, v in pairs(list) do
		if string.lower(v) == string.lower(p0) then
			return v
		end
	end
	return nil
end

function t.new(p1, p2) --[[ line: 40 ]]
	-- upvalues: t (ref)
	local t_1 = {
		dirty = true,
		name = p2,
		sinks = {},
		children = {},
		parent = p1,
		context = {},
		active = {},
		cache = { sinks = {}, context = {} }
	}
	
	for i, v in pairs(t.Levels) do
		if p1 then
			t_1.active[i] = p1.active[i]
		else
			t_1.active[i] = false
		end
	end
	if p1 then
		p1.children[t_1] = true
	end
	setmetatable(t_1, t)
	
	return t_1
end

local function setActive(value, p3) --[[ line: 72 ]]
	-- upvalues: t_1 (ref), list (ref), setActive (ref)
	local var9 = t_1[value]
	
	if var9 then
		for i = 1, var9 do
			p3.active[list[i]] = true
		end
		for i_1, v in pairs(p3.children) do
			setActive(value, i_1)
		end
	end
end

local function setDirty(value) --[[ line: 85 ]]
	-- upvalues: setDirty (ref)
	value.dirty = true
	
	for i, v in pairs(value.children) do
		setDirty(i)
	end
end

local function updateCache(p4) --[[ line: 93 ]]
	-- upvalues: updateCache (ref), cryoModule (ref)
	if not p4.dirty then return end
	if not p4.parent then
		p4.cache.context = p4.context
		p4.cache.sinks = p4.sinks
		p4.dirty = false
		
		return
	end
	updateCache(p4.parent)
	p4.cache.context = cryoModule.Dictionary.join(p4.parent.cache.context, p4.context)
	
	if p4.parent.cache.context.prefix and p4.context.prefix then
		p4.cache.context.prefix = p4.parent.cache.context.prefix .. p4.context.prefix
	end
	p4.cache.sinks = cryoModule.List.join(p4.parent.cache.sinks, p4.sinks)
	p4.dirty = false
end

function t:setParent(p5) --[[ line: 117 ]]
	-- upvalues: updateCache (ref), t_1 (ref), setActive (ref), list (ref), setDirty (ref)
	if self.parent then
		self.parent.children[self] = nil
	end
	updateCache(p5)
	self.parent = p5
	self.parent.children[self] = true
	local var10 = -1
	
	for i, v in pairs(p5.cache.sinks) do
		if t_1[v.maxLevel] then
			var10 = math.max(var10, t_1[v.maxLevel])
		end
	end
	if var10 > -1 then
		setActive(list[var10], self)
	end
	self.dirty = true
	
	for i_1, v_1 in pairs(self.children) do
		setDirty(i_1)
	end
end

function t:addSink(p6) --[[ line: 141 ]]
	-- upvalues: setActive (ref), setDirty (ref)
	setActive(p6.maxLevel, self)
	table.insert(self.sinks, p6)
	self.dirty = true
	
	for i, v in pairs(self.children) do
		setDirty(i)
	end
end

function t:setContext(p7) --[[ line: 147 ]]
	-- upvalues: setDirty (ref)
	self.context = p7
	self.dirty = true
	
	for i, v in pairs(self.children) do
		setDirty(i)
	end
end

local function log(p8, p9, p10) --[[ line: 152 ]]
	-- upvalues: updateCache (ref), t_1 (ref)
	if p9.dirty then
		updateCache(p9)
	end
	local t = { level = p8, rawMessage = p10, loggerName = p9.name }
	
	for i, v in pairs(p9.cache.context) do
		if type(v) == "function" then
			t[i] = v()
		else
			t[i] = v
		end
	end
	local var13
	local var12 = if p10.n == 0 then "LUMBERYAK INTERNAL: No log message given" else p10[1]
	
	if t.prefix then
		var12 = t.prefix .. var12
	end
	if var12:find("{") then
		var13 = 1
		var12 = var12:gsub("{(.-)}", function(p11) --[[ line: 186 ]]
			-- upvalues: var13 (write), p10 (ref), t (ref)
			if p11 == "" then
				var13 += 1
				
				return tostring(p10[var13])
			end
			local var14 = t[p11]
			
			return var14 and tostring(var14)
		end)
		
		if var13 < p10.n then
			var12 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
		elseif p10.n < var13 then
			var12 ..= "\nLUMBERYAK INTERNAL: Too few arguments given for format string"
		end
	elseif p10.n > 1 then
		var12 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
	end
	var13 = t_1[p8]
	
	for i_1, v_1 in pairs(p9.cache.sinks) do
		if t_1[v_1.maxLevel] and var13 <= t_1[v_1.maxLevel] then
			v_1:log(var12, t)
		end
	end
end

function t:error(...) --[[ line: 213 ]]
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Error] then
		log(t.Levels.Error, self, table.pack(...))
		
		return
	end
end

function t:warning(...) --[[ line: 220 ]]
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Warning] then
		log(t.Levels.Warning, self, table.pack(...))
		
		return
	end
end

function t:info(...) --[[ line: 227 ]]
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Info] then
		log(t.Levels.Info, self, table.pack(...))
		
		return
	end
end

function t:debug(...) --[[ line: 234 ]]
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Debug] then
		log(t.Levels.Debug, self, table.pack(...))
		
		return
	end
end

function t:trace(...) --[[ line: 241 ]]
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Trace] then
		log(t.Levels.Trace, self, table.pack(...))
		
		return
	end
end

return t
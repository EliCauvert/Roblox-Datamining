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
function t.Levels.fromString(p1)
	-- upvalues: list (ref)
	if type(p1) ~= "string" then
		return nil
	end
	for i, v in pairs(list) do
		if string.lower(v) == string.lower(p1) then
			return v
		end
	end
	return nil
end

function t.new(p2, p3)
	-- upvalues: t (ref)
	local t_1 = {
		dirty = true,
		name = p3,
		sinks = {},
		children = {},
		parent = p2,
		context = {},
		active = {},
		cache = { sinks = {}, context = {} }
	}
	
	for i, v in pairs(t.Levels) do
		if p2 then
			t_1.active[i] = p2.active[i]
		else
			t_1.active[i] = false
		end
	end
	if p2 then
		p2.children[t_1] = true
	end
	setmetatable(t_1, t)
	
	return t_1
end

local function setActive(value, p4)
	-- upvalues: t_1 (ref), list (ref), setActive (ref)
	local var1 = t_1[value]
	
	if var1 then
		for i = 1, var1 do
			p4.active[list[i]] = true
		end
		for i_1, v in pairs(p4.children) do
			setActive(value, i_1)
		end
	end
end

local function setDirty(value)
	-- upvalues: setDirty (ref)
	value.dirty = true
	
	for i, v in pairs(value.children) do
		setDirty(i)
	end
end

local function updateCache(p5)
	-- upvalues: updateCache (ref), cryoModule (ref)
	if not p5.dirty then return end
	if not p5.parent then
		p5.cache.context = p5.context
		p5.cache.sinks = p5.sinks
		p5.dirty = false
		
		return
	end
	updateCache(p5.parent)
	p5.cache.context = cryoModule.Dictionary.join(p5.parent.cache.context, p5.context)
	
	if p5.parent.cache.context.prefix and p5.context.prefix then
		p5.cache.context.prefix = p5.parent.cache.context.prefix .. p4.context.prefix
	end
	p5.cache.sinks = cryoModule.List.join(p5.parent.cache.sinks, p5.sinks)
	p5.dirty = false
end

function t:setParent(p5)
	-- upvalues: updateCache (ref), t_1 (ref), setActive (ref), list (ref), setDirty (ref)
	if self.parent then
		self.parent.children[self] = nil
	end
	updateCache(p5)
	self.parent = p5
	self.parent.children[self] = true
	local var2 = -1
	
	for i, v in pairs(p5.cache.sinks) do
		if t_1[v.maxLevel] then
			var2 = math.max(var2, t_1[v.maxLevel])
		end
	end
	if var2 > -1 then
		setActive(list[var2], self)
	end
	self.dirty = true
	
	for i_1, v_1 in pairs(self.children) do
		setDirty(i_1)
	end
end

function t:addSink(p6)
	-- upvalues: setActive (ref), setDirty (ref)
	setActive(p6.maxLevel, self)
	table.insert(self.sinks, p6)
	self.dirty = true
	
	for i, v in pairs(self.children) do
		setDirty(i)
	end
end

function t:setContext(p7)
	-- upvalues: setDirty (ref)
	self.context = p7
	self.dirty = true
	
	for i, v in pairs(self.children) do
		setDirty(i)
	end
end

local function log(p8, p9, p10)
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
	local var3
	local var4 = if p10.n == 0 then "LUMBERYAK INTERNAL: No log message given" else p10[1]
	
	if t.prefix then
		var4 = t.prefix .. var12
	end
	if var4:find("{") then
		var3 = 1
		var4 = var4:gsub("{(.-)}", function(p11)
			-- upvalues: var3 (write), p10 (ref), t (ref)
			if p11 == "" then
				var3 += 1
				
				return tostring(p10[var3])
			end
			local var5 = t[p11]
			
			return var5 and tostring(var5)
		end)
		
		if var3 < p10.n then
			var4 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
		elseif p10.n < var3 then
			var4 ..= "\nLUMBERYAK INTERNAL: Too few arguments given for format string"
		end
	elseif p10.n > 1 then
		var4 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
	end
	var3 = t_1[p8]
	
	for i_1, v_1 in pairs(p9.cache.sinks) do
		if t_1[v_1.maxLevel] and var3 <= t_1[v_1.maxLevel] then
			v_1:log(var4, t)
		end
	end
end

function t:error(...)
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Error] then
		log(t.Levels.Error, self, table.pack(...))
		
		return
	end
end

function t:warning(...)
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Warning] then
		log(t.Levels.Warning, self, table.pack(...))
		
		return
	end
end

function t:info(...)
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Info] then
		log(t.Levels.Info, self, table.pack(...))
		
		return
	end
end

function t:debug(...)
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Debug] then
		log(t.Levels.Debug, self, table.pack(...))
		
		return
	end
end

function t:trace(...)
	-- upvalues: t (ref), log (ref)
	if self.active[t.Levels.Trace] then
		log(t.Levels.Trace, self, table.pack(...))
		
		return
	end
end

return t
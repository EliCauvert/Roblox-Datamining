local AppDebug = script:FindFirstAncestor("AppDebug")
local LogTreeModule = require(AppDebug.LogTree)
local Levels = require(AppDebug.Parent.Lumberyak).Logger.Levels
local config = {
	[Levels.Error] = "pink",
	[Levels.Warning] = "orange",
	[Levels.Info] = "yellow",
	[Levels.Debug] = "cyan",
	[Levels.Trace] = "green"
}
local config1 = {
	[Levels.Error] = 1,
	[Levels.Warning] = 2,
	[Levels.Info] = 3,
	[Levels.Debug] = 4,
	[Levels.Trace] = 5
}

local function _(p1): string
	-- upvalues: config (copy)
	local Entry = config[p1]
	
	return Entry and string.format(" fillcolor=%s style=filled", Entry) or ""
end

local _ = function(p1)
	-- upvalues: config1 (copy)
	return config1[p1] or 0
end

local _ = function(p1, p2)
	-- upvalues: config1 (copy)
	return (config1[p2] or 0) < (config1[p1] or 0) and p1 or p2
end

local function dfsGraphviz(p1, p2): string
	-- upvalues: config1 (copy), config (copy), dfsGraphviz (copy)
	local v1 = ""
	local Text = tostring(p1.name)
	
	for _, sink in p1.sinks do
		Text ..= "\\n(sink: " .. tostring(sink.maxLevel) .. ")"
		local MaxLevel = sink.maxLevel
		p2 = (config1[MaxLevel] or 0) < (config1[p2] or 0) and p2 or MaxLevel
	end
	local Entry = config[p2]
	local Text1 = v1 .. string.format("\"%s\" [label=\"%s\"%s];\n", p1.name, Text, Entry and string.format(" fillcolor=%s style=filled", Entry) or "")
	
	for i, _ in p1.children do
		Text1 = (Text1 .. string.format("\"%s\" -> \"%s\"\n", tostring(i.name), p1.name)) .. dfsGraphviz(i, p2)
	end
	return Text1
end

return function(): string
	-- upvalues: LogTreeModule (copy), dfsGraphviz (copy)
	return "digraph {\n" .. dfsGraphviz((LogTreeModule.logger("*"))) .. "}\n"
end
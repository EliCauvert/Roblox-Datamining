local appDebug = script:FindFirstAncestor("AppDebug")
local logTreeModule = require(appDebug.LogTree)
local levels = require(appDebug.Parent.Lumberyak).Logger.Levels
local t = {
	[levels.Error] = "pink",
	[levels.Warning] = "orange",
	[levels.Info] = "yellow",
	[levels.Debug] = "cyan",
	[levels.Trace] = "green"
}
local t_1 = {
	[levels.Error] = 1,
	[levels.Warning] = 2,
	[levels.Info] = 3,
	[levels.Debug] = 4,
	[levels.Trace] = 5
}

local function _(a)
	-- upvalues: t (ref)
	local var1 = t[a]
	
	return var1 and string.format(" fillcolor=%s style=filled", var1) or ""
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1] or 0
end

local _ = function(a, b)
	-- upvalues: t_1 (ref)
	return if (t_1[b] or 0) < (t_1[a] or 0) then a else b
end

local function dfsGraphviz(p1, p2)
	-- upvalues: t_1 (ref), t (ref), dfsGraphviz (ref)
	local var1 = ""
	local var2 = tostring(p1.name)
	
	for i, v in p1.sinks do
		var2 ..= "\\n(sink: " .. tostring(v.maxLevel) .. ")"
		local var3 = p2
		local maxLevel = v.maxLevel
		p2 = if (t_1[maxLevel] or 0) < (t_1[var3] or 0) then var3 else maxLevel
	end
	local var4 = t[p2]
	var1 ..= string.format("\"%s\" [label=\"%s\"%s];\n", p1.name, var2, if var4 then string.format(" fillcolor=%s style=filled", var4) else "")
	
	for i_1, v_1 in p1.children do
		var1 = (var1 .. string.format("\"%s\" -> \"%s\"\n", tostring(i_1.name), p1.name)) .. dfsGraphviz(i_1, p2)
	end
	return var1
end

return function()
	-- upvalues: logTreeModule (ref), dfsGraphviz (ref)
	return "digraph {\n" .. dfsGraphviz(logTreeModule.logger("*")) .. "}\n"
end
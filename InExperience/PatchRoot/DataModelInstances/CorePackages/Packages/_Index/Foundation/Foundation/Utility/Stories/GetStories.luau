local foundation = script:FindFirstAncestor("Foundation")
local unknownModule = require(foundation)
local components = foundation.Components
local planned = script.Parent:FindFirstChild("Planned")
local elements = script.Parent:FindFirstChild("Elements")
local flags = script.Parent:FindFirstChild("Flags")
local t = {}

for i in unknownModule.Hooks do
	t[i] = true
end
local t_1 = {}

for i_1 in unknownModule.Utility do
	t_1[i_1] = true
end
local function _(p1)
	-- upvalues: unknownModule (ref)
	return pcall(function()
		-- upvalues: unknownModule (copy), p1 (ref)
		return unknownModule[p1]
	end)
end

local _ = function(p1, p2)
	local var1 = p1
	while var1.Parent and var1.Parent ~= p2 do
		var1 = var1.Parent
	end
	return var1
end

local _ = function(p3)
	local ok, status = pcall(require, p3)
	
	return ok and (typeof(status) == "table" and status.deprecated == true)
end

local _ = function(p3)
	local ok, status = pcall(require, p3)
	
	return ok and (typeof(status) == "table" and status.engineeringOnly == true)
end

local function getStoryScope(p3)
	-- upvalues: planned (ref), elements (ref), flags (ref), t (ref), t_1 (ref), components (ref), unknownModule (ref)
	if planned and p3:IsDescendantOf(planned) then
		return "planned"
	elseif elements and p3:IsDescendantOf(elements) then
		return "elements"
	elseif flags and p3:IsDescendantOf(flags) then
		return "flags"
	end
	local var2 = p3.Name:gsub("%.story$", "")
	local ok, status = pcall(require, p3)
	
	if ok and (typeof(status) == "table" and status.deprecated == true) then
		return "deprecated"
	end
	local ok_1, status_1 = pcall(require, p3)
	
	if ok_1 and (typeof(status_1) == "table" and status_1.engineeringOnly == true) then
		return "engineering-only"
	elseif t[var2] then
		return "hooks"
	elseif t_1[var2] then
		return "utilities"
	elseif p3:IsDescendantOf(components) then
		local var3 = p3
		while var3.Parent and var3.Parent ~= components do
			var3 = var3.Parent
		end
		local name = var3.Name
		
		return if pcall(function()
			-- upvalues: unknownModule (copy), name (ref)
			return unknownModule[name]
		end) then "components" else "internal"
	end
end

local _ = function(p4, p5)
	local parent = p4.Parent
	while parent do
		if not p5[parent] then
			parent = parent.Parent
			continue
		end
		return true
	end
	return false
end

return function(p6)
	-- upvalues: foundation (ref), getStoryScope (ref)
	local t = {}
	
	for i, v in foundation:GetDescendants() do
		if v:IsA("ModuleScript") and v.Name:match("%.story$") and getStoryScope(v) == p6 then
			t[v.Parent] = true
		end
	end
	local t_1 = {}
	
	for i_1 in t do
		local var4
		local parent = i_1.Parent
	end
	return t_1
end
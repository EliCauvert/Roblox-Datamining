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
local function _(p0)
	-- upvalues: unknownModule (ref)
	return pcall(function()
		-- upvalues: unknownModule (copy), p0 (ref)
		return unknownModule[p0]
	end)
end

local _ = function(p1, p2)
	local var8 = p1
	while var8.Parent and var8.Parent ~= p2 do
		var8 = var8.Parent
	end
	return var8
end

local _ = function(p3)
	local ok, status = pcall(require, p3)
	
	return ok and (typeof(status) == "table" and status.deprecated == true)
end

local _ = function(p4)
	local ok, status = pcall(require, p4)
	
	return ok and (typeof(status) == "table" and status.engineeringOnly == true)
end

local function getStoryScope(p5)
	-- upvalues: planned (ref), elements (ref), flags (ref), t (ref), t_1 (ref), components (ref), unknownModule (ref)
	if planned and p5:IsDescendantOf(planned) then
		return "planned"
	elseif elements and p5:IsDescendantOf(elements) then
		return "elements"
	elseif flags and p5:IsDescendantOf(flags) then
		return "flags"
	end
	local var9 = p5.Name:gsub("%.story$", "")
	local ok, status = pcall(require, p5)
	
	if ok and (typeof(status) == "table" and status.deprecated == true) then
		return "deprecated"
	end
	local ok_1, status_1 = pcall(require, p5)
	
	if ok_1 and (typeof(status_1) == "table" and status_1.engineeringOnly == true) then
		return "engineering-only"
	elseif t[var9] then
		return "hooks"
	elseif t_1[var9] then
		return "utilities"
	elseif p5:IsDescendantOf(components) then
		local var10 = p5
		while var10.Parent and var10.Parent ~= components do
			var10 = var10.Parent
		end
		local name = var10.Name
		
		return if pcall(function()
			-- upvalues: unknownModule (copy), name (ref)
			return unknownModule[name]
		end) then "components" else "internal"
	end
end

local _ = function(p6, p7)
	local parent = p6.Parent
	while parent do
		if not p7[parent] then
			parent = parent.Parent
			continue
		end
		return true
	end
	return false
end

return function(p8)
	-- upvalues: foundation (ref), getStoryScope (ref)
	local t = {}
	
	for i, v in foundation:GetDescendants() do
		if v:IsA("ModuleScript") and v.Name:match("%.story$") and getStoryScope(v) == p8 then
			t[v.Parent] = true
		end
	end
	local t_1 = {}
	
	for i_1 in t do
		local var13
		local parent = i_1.Parent
	end
	return t_1
end
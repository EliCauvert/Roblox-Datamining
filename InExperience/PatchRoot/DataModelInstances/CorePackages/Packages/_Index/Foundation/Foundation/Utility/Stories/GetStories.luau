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
	
	return ok and (typeof(status) == "table" and status.base == true)
end

local _ = function(p3)
	return p3.Name:match("^[%w]+%.[%w]+%.story") ~= nil and p3.Name:match("%.Root%.story") == nil
end

local _ = function(p3)
	-- upvalues: components (ref)
	if not p3:IsDescendantOf(components) then
		return nil
	end
	local var2 = p3
	while var2.Parent and var2.Parent ~= components do
		var2 = var2.Parent
	end
	local name = var2:FindFirstChild(`{var2.Name}.Root.story`)
	
	return if name and name:IsA("ModuleScript") then name else nil
end

local function getStoryScope(p4)
	-- upvalues: planned (ref), elements (ref), flags (ref), components (ref), t (ref), t_1 (ref), unknownModule (ref)
	if planned and p4:IsDescendantOf(planned) then
		return "planned"
	elseif elements and p4:IsDescendantOf(elements) then
		return "elements"
	elseif flags and p4:IsDescendantOf(flags) then
		return "flags"
	end
	local var3 = p4.Name:gsub("%.story$", "")
	local ok, status = pcall(require, p4)
	
	if ok and (typeof(status) == "table" and status.deprecated == true) then
		return "deprecated"
	end
	local ok_1, status_1 = pcall(require, p4)
	
	if ok_1 and (typeof(status_1) == "table" and status_1.base == true) then
		return "base"
	end
	local ok_2
	local var4 = p4.Name:match("^[%w]+%.[%w]+%.story") ~= nil and p4.Name:match("%.Root%.story") == nil
	
	if var4 then
		if p4:IsDescendantOf(components) then
			local var5 = p4
			while var5.Parent and var5.Parent ~= components do
				var5 = var5.Parent
			end
			local var6 = var5
			ok_2 = var6:FindFirstChild(`{var6.Name}.Root.story`)
			var4 = if ok_2 and ok_2:IsA("ModuleScript") then ok_2 else nil
		else
			var4 = nil
		end
		if var4 then
			ok_2, status_2 = pcall(require, var4)
			
			if ok_2 and (typeof(status_2) == "table" and status_2.base == true) then
				return "base"
			elseif t[var3] then
				return "hooks"
			elseif t_1[var3] then
				return "utilities"
			elseif p4:IsDescendantOf(components) then
				ok_2 = p4
				while ok_2.Parent and ok_2.Parent ~= components do
					ok_2 = ok_2.Parent
				end
				local name_1 = ok_2.Name
				
				if not pcall(function()
					-- upvalues: unknownModule (copy), name_1 (ref)
					return unknownModule[name_1]
				end) then
					return if p4.Name:match("^[%w]+%.[%w]+%.story") ~= nil and p4.Name:match("%.Root%.story") == nil then nil elseif pcall(function()
						-- upvalues: unknownModule (copy), name_1 (ref)
						return unknownModule[name_1]
					end) then "components" else "internal"
				end
			end
		end
	end
end

local _ = function(p5, p6)
	local parent = p5.Parent
	while parent do
		if not p6[parent] then
			parent = parent.Parent
			continue
		end
		return true
	end
	return false
end

return {
	getStorybookRoots = function(p7)
		-- upvalues: components (ref), foundation (ref), getStoryScope (ref)
		if p7 == "components" or p7 == "base" then
			return { components }
		end
		local t = {}
		
		for i, v in foundation:GetDescendants() do
			if v:IsA("ModuleScript") and v.Name:match("%.story$") and getStoryScope(v) == p7 then
				t[v.Parent] = true
			end
		end
		local t_1 = {}
		
		for i_1 in t do
			local var7
			local parent = i_1.Parent
		end
		return t_1
	end,
	getComponentFolderExcludeList = function(p8)
		-- upvalues: foundation (ref), components (ref), getStoryScope (ref)
		local t = {}
		
		for i, v in foundation:GetDescendants() do
			if v:IsA("ModuleScript") and v.Name:match("%.story$") and (v:IsDescendantOf(components) and getStoryScope(v) ~= p8) then
				local var8 = v
				while var8.Parent and var8.Parent ~= components do
					var8 = var8.Parent
				end
				t[var8.Name] = true
			end
		end
		local t_1 = {}
		
		for i_1 in t do
			table.insert(t_1, i_1)
		end
		table.sort(t_1)
		
		return t_1
	end
}
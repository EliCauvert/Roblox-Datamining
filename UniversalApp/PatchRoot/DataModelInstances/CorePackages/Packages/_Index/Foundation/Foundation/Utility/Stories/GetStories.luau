local Foundation = script:FindFirstAncestor("Foundation")
local Module = require(Foundation)
local Components = Foundation.Components
local Planned = script.Parent:FindFirstChild("Planned")
local Elements = script.Parent:FindFirstChild("Elements")
local Flags = script.Parent:FindFirstChild("Flags")
local t = {}

for hook in Module.Hooks do
	t[hook] = true
end
local t1 = {}

for i in Module.Utility do
	t1[i] = true
end
local function _(p1) --[[ Line: 40 | Named "isFoundationExport" ]]
	-- upvalues: Module (copy)
	return (pcall(function() --[[ Line: 41 ]]
		-- upvalues: Module (upval), p1 (copy)
		return Module[p1]
	end))
end

local _ = function(Parent, Parent1) --[[ Line: 46 | Named "topChild" ]]
	local Parent2 = Parent
	while Parent2.Parent and Parent2.Parent ~= Parent1 do
		Parent2 = Parent2.Parent
	end
	return Parent2
end

local _ = function(p1): boolean --[[ Line: 54 | Named "isDeprecatedStory" ]]
	local Success, Result = pcall(require, p1)
	
	return Success and (typeof(Result) == "table" and Result.deprecated == true)
end

local _ = function(p1): boolean --[[ Line: 59 | Named "isBaseStory" ]]
	local Success, Result = pcall(require, p1)
	
	return Success and (typeof(Result) == "table" and Result.base == true)
end

local _ = function(p1): boolean --[[ Line: 64 | Named "isCompoundSubPartStory" ]]
	return p1.Name:match("^[%w]+%.[%w]+%.story") ~= nil and p1.Name:match("%.Root%.story") == nil
end

local _ = function(Object) --[[ Line: 68 | Named "getComponentRootStory" ]]
	-- upvalues: Components (copy)
	if not Object:IsDescendantOf(Components) then
		return nil
	end
	local Parent = Object
	while Parent.Parent and Parent.Parent ~= Components do
		Parent = Parent.Parent
	end
	local Child = Parent:FindFirstChild(`{Parent.Name}.Root.story`)
	
	return if Child and Child:IsA("ModuleScript") then Child else nil
end

local function getStoryScope(Object): string? --[[ Line: 80 ]]
	-- upvalues: Planned (copy), Elements (copy), Flags (copy), Components (copy), t (copy), t1 (copy), Module (copy)
	if Planned and Object:IsDescendantOf(Planned) then
		return "planned"
	end
	if Elements and Object:IsDescendantOf(Elements) then
		return "elements"
	end
	if Flags and Object:IsDescendantOf(Flags) then
		return "flags"
	end
	local Story = Object.Name:gsub("%.story$", "")
	local Success, Result = pcall(require, Object)
	
	if Success then
		Success = typeof(Result) == "table" and Result.deprecated == true
	end
	if Success then
		return "deprecated"
	end
	local Success1, Result1 = pcall(require, Object)
	
	if Success1 then
		Success1 = typeof(Result1) == "table" and Result1.base == true
	end
	if Success1 then
		return "base"
	end
	if Object.Name:match("^[%w]+%.[%w]+%.story") ~= nil and Object.Name:match("%.Root%.story") == nil then
		local v1 = nil
		if Object:IsDescendantOf(Components) then
			local Parent = Object
			while Parent.Parent and Parent.Parent ~= Components do
				Parent = Parent.Parent
			end
			local Child = Parent:FindFirstChild(`{Parent.Name}.Root.story`)
			v1 = if Child and Child:IsA("ModuleScript") then Child else nil
		else
			v1 = nil
		end
		if v1 then
			local Success2, Result2 = pcall(require, v1)
			
			if Success2 then
				Success2 = typeof(Result2) == "table" and Result2.base == true
			end
			if Success2 then
				return "base"
			end
		end
	end
	if t[Story] then
		return "hooks"
	end
	if t1[Story] then
		return "utilities"
	end
	if Object:IsDescendantOf(Components) then
		local Parent = Object
		while Parent.Parent and Parent.Parent ~= Components do
			Parent = Parent.Parent
		end
		local Name = Parent.Name
		
		if not pcall(function() --[[ Line: 41 ]]
			-- upvalues: Module (upval), Name (copy)
			return Module[Name]
		end) and (Object.Name:match("^[%w]+%.[%w]+%.story") ~= nil and Object.Name:match("%.Root%.story") == nil) then
			return nil
		elseif pcall(function() --[[ Line: 41 ]]
			-- upvalues: Module (upval), Name (copy)
			return Module[Name]
		end) then
			return "components"
		end
	end
	return "internal"
end

local _ = function(p1, p2): boolean --[[ Line: 127 | Named "isNested" ]]
	local Parent = p1.Parent
	while Parent do
		if p2[Parent] then
			return true
		end
		Parent = Parent.Parent
	end
	return false
end

return {
	getStorybookRoots = function(p3) --[[ Line: 161 ]]
		-- upvalues: Components (copy), Foundation (copy), getStoryScope (copy)
		if p3 == "components" or p3 == "base" then
			return { Components }
		end
		local t = {}
		
		for _, ModuleScript in Foundation:GetDescendants() do
			if ModuleScript:IsA("ModuleScript") and ModuleScript.Name:match("%.story$") and getStoryScope(ModuleScript) == p3 then
				t[ModuleScript.Parent] = true
			end
		end
		local List = {}
		
		for i in t do
			local Parent = i.Parent
			local Flag = nil
			while Parent do
				if not t[Parent] then
					Parent = Parent.Parent
					continue
				end
				Flag = true
				if not Flag then
					table.insert(List, i)
				end
			end
			Flag = false
		end
		return List
	end,
	getComponentFolderExcludeList = function(p4) --[[ Line: 138 ]]
		-- upvalues: Foundation (copy), Components (copy), getStoryScope (copy)
		local t = {}
		
		for _, ModuleScript in Foundation:GetDescendants() do
			if ModuleScript:IsA("ModuleScript") and ModuleScript.Name:match("%.story$") and ModuleScript:IsDescendantOf(Components) and getStoryScope(ModuleScript) ~= p4 then
				local Parent = ModuleScript
				while Parent.Parent and Parent.Parent ~= Components do
					Parent = Parent.Parent
				end
				t[Parent.Name] = true
			end
		end
		local List = {}
		
		for i in t do
			table.insert(List, i)
		end
		table.sort(List)
		
		return List
	end
}
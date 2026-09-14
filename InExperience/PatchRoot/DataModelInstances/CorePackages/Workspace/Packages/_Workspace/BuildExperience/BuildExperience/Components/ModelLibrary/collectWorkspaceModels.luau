local function defaultGetUniqueId(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return game:GetService("UniqueIdLookupService"):GetOrCreateUniqueId(p1)
	end)
	
	if ok and type(status) == "string" and status ~= "" then
		return status
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: p1 (ref)
		return tostring(p1.UniqueId)
	end)
	
	return if ok_1 and type(status_1) == "string" and status_1 ~= "" then status_1 else nil
end

local function defaultDependencies()
	-- upvalues: defaultGetUniqueId (ref)
	return { workspace = workspace, getUniqueId = defaultGetUniqueId }
end

local function _(p1)
	return p1:FindFirstChildOfClass("Humanoid") ~= nil
end

local _ = function(p1)
	local children = p1:GetChildren()
	table.sort(children, function(p2, p3)
		return if p2.Name == p3.Name then if p2.ClassName == p3.ClassName then p2:GetFullName() < p3:GetFullName() else p2.ClassName < p3.ClassName else p2.Name < p3.Name
	end)
	
	return children
end

local function containsSemanticModel(p1)
	-- upvalues: containsSemanticModel (ref)
	local children = p1:GetChildren()
	table.sort(children, function(p2, p3)
		return if p2.Name == p3.Name then if p2.ClassName == p3.ClassName then p2:GetFullName() < p3:GetFullName() else p2.ClassName < p3.ClassName else p2.Name < p3.Name
	end)
	
	for i, v in children do
		if v:IsA("Model") then
			if v:FindFirstChildOfClass("Humanoid") == nil then
				return true
			end
		elseif containsSemanticModel(v) then
			return true
		end
	end
	return false
end

return {
	collectWorkspaceModels = function(p2)
		-- upvalues: defaultGetUniqueId (ref), containsSemanticModel (ref)
		p2 = p2 or { workspace = workspace, getUniqueId = defaultGetUniqueId }
		local t = {}
		local children = p2.workspace:GetChildren()
		table.sort(children, function(p3, p4)
			return if p3.Name == p4.Name then if p3.ClassName == p4.ClassName then p3:GetFullName() < p4:GetFullName() else p3.ClassName < p4.ClassName else p3.Name < p4.Name
		end)
		
		for i, v in children do
			if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") == nil or not v:IsA("Model") and containsSemanticModel(v) then
				table.insert(t, {
					id = p2.getUniqueId(v) or v:GetFullName(),
					path = v:GetFullName(),
					name = v.Name,
					model = v
				})
			end
		end
		table.sort(t, function(p3, p4)
			return if p3.name == p4.name then p3.id < p4.id else p3.name < p4.name
		end)
		
		return t
	end,
	defaultDependencies = defaultDependencies
}
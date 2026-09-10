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

return {
	MAX_MODELS = 200,
	collectWorkspaceModels = function(p1)
		-- upvalues: defaultGetUniqueId (ref)
		p1 = p1 or { workspace = workspace, getUniqueId = defaultGetUniqueId }
		local t = {}
		
		local function collectFrom(p2)
			-- upvalues: t (ref), p1 (ref), collectFrom (ref)
			local children = p2:GetChildren()
			table.sort(children, function(p3, p4)
				return if p3.Name == p4.Name then if p3.ClassName == p4.ClassName then p3:GetFullName() < p4:GetFullName() else p3.ClassName < p4.ClassName else p3.Name < p4.Name
			end)
			
			for i, v in children do
				if #t < 200 then
					if not v:IsA("Model") then
						if collectFrom(v) then
							return true
						end
					elseif v:FindFirstChildOfClass("Humanoid") == nil then
						table.insert(t, {
							id = p1.getUniqueId(v) or v:GetFullName(),
							name = v.Name,
							model = v
						})
					end
				end
				return true
			end
			return false
		end
		
		collectFrom(p1.workspace)
		table.sort(t, function(p3, p4)
			return if p3.name == p4.name then p3.id < p4.id else p3.name < p4.name
		end)
		
		return t
	end,
	defaultDependencies = defaultDependencies
}
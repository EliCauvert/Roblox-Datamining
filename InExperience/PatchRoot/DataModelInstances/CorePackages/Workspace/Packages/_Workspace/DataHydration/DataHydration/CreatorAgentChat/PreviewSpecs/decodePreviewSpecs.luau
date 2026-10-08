local previewSpecsTypesModule = require(script.Parent.PreviewSpecsTypes)

local function _(p1)
	return if typeof(p1) == "string" then p1 else nil
end

local _ = function(p1)
	-- upvalues: previewSpecsTypesModule (ref)
	return if p1 == previewSpecsTypesModule.PreviewSpecPinned.Pr or p1 == previewSpecsTypesModule.PreviewSpecPinned.Hash then p1 else nil
end

local function decodeItem(p1)
	-- upvalues: previewSpecsTypesModule (ref)
	if typeof(p1) ~= "table" then
		return nil
	end
	local prNumber = p1.pr_number
	local override = p1.override
	
	if typeof(prNumber) ~= "number" or typeof(override) ~= "string" or override == "" then
		return nil
	end
	local t = { prNumber = prNumber }
	local title = p1.title
	t.title = (if typeof(title) == "string" then title else nil) or ""
	t.draft = p1.draft == true
	t.override = override
	local publishedAt = p1.published_at
	t.publishedAt = if typeof(publishedAt) == "string" then publishedAt else nil
	local status = p1.status
	t.status = (if typeof(status) == "string" then status else nil) or previewSpecsTypesModule.PreviewSpecStatus.Unverified
	local pinned = p1.pinned
	t.pinned = if pinned == previewSpecsTypesModule.PreviewSpecPinned.Pr or pinned == previewSpecsTypesModule.PreviewSpecPinned.Hash then pinned else nil
	
	return t
end

return function(p1)
	-- upvalues: decodeItem (ref)
	if typeof(p1) ~= "table" then
		error("preview-specs: response is not an object")
	end
	if p1.schema_version ~= 1 then
		error(`preview-specs: unsupported schema_version {tostring(p1.schema_version)}`)
	end
	if typeof(p1.items) ~= "table" then
		error("preview-specs: items is not an array")
	end
	local t = {}
	
	for i, v in ipairs(p1.items) do
		local var1 = decodeItem(v)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	local t_1 = {}
	local environment = p1.environment
	t_1.environment = if typeof(environment) == "string" then environment else nil
	local agent = p1.agent
	t_1.agent = if typeof(agent) == "string" then agent else nil
	local refreshedAt = p1.refreshed_at
	t_1.refreshedAt = if typeof(refreshedAt) == "string" then refreshedAt else nil
	t_1.items = t
	
	return t_1
end
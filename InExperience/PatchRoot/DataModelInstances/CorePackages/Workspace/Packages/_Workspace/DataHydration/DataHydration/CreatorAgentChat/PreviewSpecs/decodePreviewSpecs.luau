local PreviewSpecsTypesModule = require(script.Parent.PreviewSpecsTypes)

local function _(p1)
	return if typeof(p1) == "string" then p1 else nil
end

local _ = function(Hash)
	-- upvalues: PreviewSpecsTypesModule (copy)
	return if Hash == PreviewSpecsTypesModule.PreviewSpecPinned.Pr or Hash == PreviewSpecsTypesModule.PreviewSpecPinned.Hash then Hash else nil
end

local function decodeItem(p1)
	-- upvalues: PreviewSpecsTypesModule (copy)
	if typeof(p1) ~= "table" then
		return nil
	end
	local PrNumber = p1.pr_number
	local Override = p1.override
	
	if typeof(PrNumber) == "number" and typeof(Override) == "string" and Override ~= "" then
		local Title = p1.title
		local PublishedAt = p1.published_at
		local Status = p1.status
		local Status1 = (if typeof(Status) == "string" then Status else nil) or PreviewSpecsTypesModule.PreviewSpecStatus.Unverified
		local Pinned = p1.pinned
		
		return {
			prNumber = PrNumber,
			title = (if typeof(Title) == "string" then Title else nil) or "",
			draft = p1.draft == true,
			override = Override,
			publishedAt = if typeof(PublishedAt) == "string" then PublishedAt else nil,
			status = Status1,
			pinned = if Pinned == PreviewSpecsTypesModule.PreviewSpecPinned.Pr or Pinned == PreviewSpecsTypesModule.PreviewSpecPinned.Hash then Pinned else nil
		}
	else
		return nil
	end
end

return function(p1)
	-- upvalues: decodeItem (copy)
	if typeof(p1) ~= "table" then
		error("preview-specs: response is not an object")
	end
	if p1.schema_version ~= 1 then
		error(`preview-specs: unsupported schema_version {tostring(p1.schema_version)}`)
	end
	if typeof(p1.items) ~= "table" then
		error("preview-specs: items is not an array")
	end
	local Items = {}
	
	for _, item in ipairs(p1.items) do
		local DecodeItemResult = decodeItem(item)
		
		if DecodeItemResult ~= nil then
			table.insert(Items, DecodeItemResult)
		end
	end
	local Environment = p1.environment
	local Environment1 = if typeof(Environment) == "string" then Environment else nil
	local Agent = p1.agent
	local Agent1 = if typeof(Agent) == "string" then Agent else nil
	local RefreshedAt = p1.refreshed_at
	
	return {
		environment = Environment1,
		agent = Agent1,
		refreshedAt = if typeof(RefreshedAt) == "string" then RefreshedAt else nil,
		items = Items
	}
end
local JoinFunction = require(script:FindFirstAncestor("Foundation").Parent.Dash).join
local t = {}
local StudioUriModule = {
	equals = function(p1, p2): boolean --[[ Line: 26 ]]
		return if rawequal(p1, p2) then true else p1.DataModel == p2.DataModel and (p1.PluginType == p2.PluginType and (p1.PluginId == p2.PluginId and p1.Category == p2.Category)) and p1.ItemId == p2.ItemId
	end
}
StudioUriModule.RESTRICTED_Mt = table.freeze({
	__eq = function(p1, p2) --[[ Line: 39 ]]
		-- upvalues: StudioUriModule (copy)
		return StudioUriModule.equals(p1, p2)
	end
})

function StudioUriModule.wrap(Tbl) --[[ Line: 45 ]]
	-- upvalues: StudioUriModule (copy)
	if table.isfrozen(Tbl) and getmetatable(Tbl) == StudioUriModule.RESTRICTED_Mt then
		return Tbl
	end
	if table.isfrozen(Tbl) then
		Tbl = table.clone(Tbl)
	end
	return table.freeze((setmetatable(Tbl, StudioUriModule.RESTRICTED_Mt)))
end

function StudioUriModule.join(p1, p2) --[[ Line: 57 ]]
	-- upvalues: StudioUriModule (copy), JoinFunction (copy)
	return StudioUriModule.wrap(JoinFunction(p1, p2))
end

function StudioUriModule.toString(p1): string --[[ Line: 61 ]]
	-- upvalues: t (copy)
	local Buffer = table.create(5)
	local P6 = p1 or t
	
	if not P6 then
		return ""
	end
	if P6.DataModel then
		table.insert(Buffer, `DataModel:{P6.DataModel}`)
	end
	if P6.PluginType then
		table.insert(Buffer, `PluginType:{P6.PluginType}`)
	end
	if P6.PluginId then
		table.insert(Buffer, `PluginId:{P6.PluginId}`)
	end
	if P6.Category then
		table.insert(Buffer, `Category:{P6.Category}`)
	end
	if P6.ItemId then
		table.insert(Buffer, `ItemId:{P6.ItemId}`)
	end
	return table.concat(Buffer, ", ")
end

function StudioUriModule.child(p1, p2) --[[ Line: 89 ]]
	-- upvalues: StudioUriModule (copy)
	return StudioUriModule.join(p1, { ItemId = if p1.ItemId then `{p1.ItemId}/{p2}` else p2 })
end

function StudioUriModule.isNull(p1): boolean --[[ Line: 95 ]]
	return p1.DataModel == "Null"
end

function StudioUriModule.isValid(p1): boolean --[[ Line: 99 ]]
	return type(p1) == "table"
end

function StudioUriModule.isStudioUri(p1): boolean --[[ Line: 105 ]]
	return type(p1) == "table" and (p1.DataModel ~= nil or (p1.PluginType ~= nil or (p1.PluginId ~= nil or p1.Category ~= nil)) or p1.ItemId ~= nil)
end

function StudioUriModule.fromAction(PluginId, ItemId) --[[ Line: 116 ]]
	-- upvalues: StudioUriModule (copy)
	return StudioUriModule.wrap({
		DataModel = "Standalone",
		Category = "Actions",
		PluginId = PluginId,
		ItemId = ItemId
	})
end

function StudioUriModule.fromSetting(PluginId, ItemId) --[[ Line: 125 ]]
	-- upvalues: StudioUriModule (copy)
	return StudioUriModule.wrap({
		DataModel = "Standalone",
		Category = "Settings",
		PluginId = PluginId,
		ItemId = ItemId
	})
end

function StudioUriModule.fromWidget(PluginId, ItemId) --[[ Line: 134 ]]
	-- upvalues: StudioUriModule (copy)
	return StudioUriModule.wrap({
		DataModel = "Standalone",
		Category = "Widgets",
		PluginId = PluginId,
		ItemId = ItemId
	})
end

function StudioUriModule.fromPanel(PluginId, ItemId) --[[ Line: 143 ]]
	-- upvalues: StudioUriModule (copy)
	return StudioUriModule.wrap({
		DataModel = "Standalone",
		Category = "Panels",
		PluginId = PluginId,
		ItemId = ItemId
	})
end

return StudioUriModule
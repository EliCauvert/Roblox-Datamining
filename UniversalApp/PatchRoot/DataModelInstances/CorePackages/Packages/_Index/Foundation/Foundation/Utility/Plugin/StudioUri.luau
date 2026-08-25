local join = require(script:FindFirstAncestor("Foundation").Parent.Dash).join
local t = {}
local t_1 = {
	equals = function(p1, p2)
		return if rawequal(p1, p2) then true else p1.DataModel == p2.DataModel and (p1.PluginType == p2.PluginType and (p1.PluginId == p2.PluginId and (p1.Category == p2.Category and p1.ItemId == p2.ItemId)))
	end
}
t_1.RESTRICTED_Mt = table.freeze({
	__eq = function(p1, p2)
		-- upvalues: t_1 (ref)
		return t_1.equals(p1, p2)
	end
})

function t_1.wrap(p1)
	-- upvalues: t_1 (ref)
	if table.isfrozen(p1) and getmetatable(p1) == t_1.RESTRICTED_Mt then
		return p1
	elseif table.isfrozen(p1) then
		p1 = table.clone(p1)
	end
	return table.freeze(setmetatable(p1, t_1.RESTRICTED_Mt))
end

function t_1.join(p1, p2)
	-- upvalues: t_1 (ref), join (ref)
	return t_1.wrap(join(p1, p2))
end

function t_1.toString(p1)
	-- upvalues: t (ref)
	local list = table.create(5)
	p1 = p1 or t
	
	if not p1 then
		return ""
	elseif p1.DataModel then
		table.insert(list, `DataModel:{p1.DataModel}`)
	end
	if p1.PluginType then
		table.insert(list, `PluginType:{p1.PluginType}`)
	end
	if p1.PluginId then
		table.insert(list, `PluginId:{p1.PluginId}`)
	end
	if p1.Category then
		table.insert(list, `Category:{p1.Category}`)
	end
	if p1.ItemId then
		table.insert(list, `ItemId:{p1.ItemId}`)
	end
	return table.concat(list, ", ")
end

function t_1.child(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.join(p1, { ItemId = if p1.ItemId then `{p1.ItemId}/{p2}` else p2 })
end

function t_1.isNull(p1)
	return p1.DataModel == "Null"
end

function t_1.isValid(p1)
	return type(p1) == "table"
end

function t_1.isStudioUri(p1)
	return type(p1) == "table" and (if p1.DataModel == nil then if p1.PluginType == nil then if p1.PluginId == nil then if p1.Category == nil then p1.ItemId ~= nil else true else true else true else true)
end

function t_1.fromAction(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Actions",
		PluginId = p1,
		ItemId = p2
	})
end

function t_1.fromSetting(value, p1)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Settings",
		PluginId = value,
		ItemId = p1
	})
end

function t_1.fromWidget(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Widgets",
		PluginId = p1,
		ItemId = p2
	})
end

function t_1.fromPanel(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Panels",
		PluginId = p1,
		ItemId = p2
	})
end

return t_1
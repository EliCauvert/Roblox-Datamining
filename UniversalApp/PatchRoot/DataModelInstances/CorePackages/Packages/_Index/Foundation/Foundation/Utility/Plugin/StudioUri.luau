local join = require(script:FindFirstAncestor("Foundation").Parent.Dash).join
local t = {}
local t_1 = {
	equals = function(p0, p1)
		return if rawequal(p0, p1) then true else p0.DataModel == p1.DataModel and (p0.PluginType == p1.PluginType and (p0.PluginId == p1.PluginId and (p0.Category == p1.Category and p0.ItemId == p1.ItemId)))
	end
}
t_1.RESTRICTED_Mt = table.freeze({
	__eq = function(p2, p3)
		-- upvalues: t_1 (ref)
		return t_1.equals(p2, p3)
	end
})

function t_1.wrap(p4)
	-- upvalues: t_1 (ref)
	if table.isfrozen(p4) and getmetatable(p4) == t_1.RESTRICTED_Mt then
		return p4
	elseif table.isfrozen(p4) then
		p4 = table.clone(p4)
	end
	return table.freeze(setmetatable(p4, t_1.RESTRICTED_Mt))
end

function t_1.join(p5, p6)
	-- upvalues: t_1 (ref), join (ref)
	return t_1.wrap(join(p5, p6))
end

function t_1.toString(p7)
	-- upvalues: t (ref)
	local list = table.create(5)
	p7 = p7 or t
	
	if not p7 then
		return ""
	elseif p7.DataModel then
		table.insert(list, `DataModel:{p7.DataModel}`)
	end
	if p7.PluginType then
		table.insert(list, `PluginType:{p7.PluginType}`)
	end
	if p7.PluginId then
		table.insert(list, `PluginId:{p7.PluginId}`)
	end
	if p7.Category then
		table.insert(list, `Category:{p7.Category}`)
	end
	if p7.ItemId then
		table.insert(list, `ItemId:{p7.ItemId}`)
	end
	return table.concat(list, ", ")
end

function t_1.child(p8, p9)
	-- upvalues: t_1 (ref)
	return t_1.join(p8, { ItemId = if p8.ItemId then `{p8.ItemId}/{p9}` else p9 })
end

function t_1.isNull(p10)
	return p10.DataModel == "Null"
end

function t_1.isValid(p11)
	return type(p11) == "table"
end

function t_1.isStudioUri(p12)
	return type(p12) == "table" and (if p12.DataModel == nil then if p12.PluginType == nil then if p12.PluginId == nil then if p12.Category == nil then p12.ItemId ~= nil else true else true else true else true)
end

function t_1.fromAction(p13, p14)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Actions",
		PluginId = p13,
		ItemId = p14
	})
end

function t_1.fromSetting(value, p15)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Settings",
		PluginId = value,
		ItemId = p15
	})
end

function t_1.fromWidget(p16, p17)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Widgets",
		PluginId = p16,
		ItemId = p17
	})
end

function t_1.fromPanel(p18, p19)
	-- upvalues: t_1 (ref)
	return t_1.wrap({
		DataModel = "Standalone",
		Category = "Panels",
		PluginId = p18,
		ItemId = p19
	})
end

return t_1
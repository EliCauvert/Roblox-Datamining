local cryoModule = require(script.Parent.Cryo)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	return setmetatable({ ids = t.makeArray(p2), delimiter = p3 }, p1)
end

function t:setIds(p1)
	-- upvalues: t (ref)
	self.ids = t.makeArray(p1)
end

function t.makeArray(p1)
	return if type(p1) == "table" then p1 else { p1 }
end

function t:__tostring()
	return table.concat(self.ids, self.delimiter)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref)
	local t = {
		configurableIds = nil,
		idsDelimiter = ",",
		statusIds = nil,
		baseUrl = p1:gsub("/*$", ""),
		args = {},
		pathElements = {},
		namedIds = {},
		options = { queryArgs = nil, postBody = nil, headers = nil },
		useExpandedForm = {},
		additionalData = p2 or {}
	}
	setmetatable(t, t_1)
	
	return t
end

function t_1:path(p1)
	table.insert(self.pathElements, p1:gsub("^/", ""):gsub("/$", ""))
	
	return self
end

function t_1:id(p1, p2)
	-- upvalues: t (ref)
	if not p2 and #self.pathElements < 1 then
		warn("Cannot name id or ids because there is no leading path segment and no name is provided")
	end
	self.namedIds[p2 or self.pathElements[#self.pathElements]] = p1
	self.configurableIds = t:new(p1, self.idsDelimiter)
	table.insert(self.pathElements, self.configurableIds)
	
	return self
end

function t_1:queryArgWithIds(p1, p2)
	-- upvalues: cryoModule (ref), t (ref)
	local var1 = cryoModule.List.join(p2, self.namedIds[p1] or {})
	self.namedIds[p1] = var1
	self.configurableIds = t:new(var1, self.idsDelimiter)
	self.args = cryoModule.Dictionary.join(self.args, { [p1] = self.configurableIds })
	
	return self
end

function t_1:expandedQueryArgsWithIds(p1, p2)
	self.useExpandedForm[p1] = true
	self:queryArgWithIds(p1, p2)
	
	return self
end

function t_1:queryArgs(p1)
	-- upvalues: cryoModule (ref)
	self.args = cryoModule.Dictionary.join(self.args, p1)
	self.options.queryArgs = cryoModule.Dictionary.join(p1, self.options.queryArgs or {})
	
	return self
end

function t_1:body(p1)
	self.options.postBody = p1
	
	return self
end

function t_1:headers(p1)
	self.options.headers = p1
	
	return self
end

function t_1.makeKeyMapper(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		return p1:getStatusIds() and p1:makeStatusUrl(p2) or p1:makeNamedIdsUrl(p2)
	end
end

function t_1._normalize(_, p1)
	return p1:gsub("/+", "/")
end

function t_1:makeUri()
	local var1 = ""
	
	for i, v in ipairs(self.pathElements) do
		var1 ..= "/" .. tostring(v)
	end
	return self:_normalize(var1)
end

local function concatArguments(p1, p2, p3, p4)
	-- upvalues: concatArguments (ref)
	if p4 then
		for i, v in pairs(p3.ids) do
			p1 = concatArguments(p1, p2, v)
		end
		return p1
	else
		local text = tostring(p2) .. "=" .. tostring(p3)
		
		return if p1:len() > 1 then p1 .. "&" .. text else text
	end
end

function t_1:makeQueryArgs(p5, p6)
	-- upvalues: concatArguments (ref)
	self:_plugInConfigurableIds(p5)
	local var2 = ""
	
	for i, v in pairs(self.args) do
		if p6 and self.namedIds[i] or not p6 then
			var2 = concatArguments(var2, i, v, self.useExpandedForm[i])
		end
	end
	return if var2:len() > 1 then "?" .. var8 else ""
end

function t_1:makeUrl(p7, p8)
	self:_plugInConfigurableIds(p7)
	
	return self.baseUrl .. self:makeUri() .. self:makeQueryArgs(p7, p8)
end

function t_1:makeStatusUrl(p7)
	local text = self.baseUrl .. self:makeUri()
	
	if not p7 then
		return text
	end
	local var3 = ""
	
	for i, v in pairs(if type(p7) == "table" then p7 else { p7 }) do
		var3 = if i > 1 then var3 .. "&" .. v else v
	end
	return text .. "?" .. var10
end

function t_1:makeNamedIdsUrl(p8)
	return self:makeUrl(p8, true)
end

function t_1:makeOptions()
	return self.options
end

function t_1:_plugInConfigurableIds(p8)
	if p8 ~= nil and self.configurableIds then
		self.configurableIds:setIds(p8)
	end
end

function t_1:getIds()
	return if self.configurableIds and self.configurableIds.ids then self.configurableIds.ids elseif self.statusIds then self.statusIds else {}
end

function t_1:getNamedIds()
	return self.namedIds
end

function t_1:setStatusIds(p8)
	-- upvalues: cryoModule (ref)
	if self.configurableIds then
		warn("Cannot set statusIds because ids already provided in URl")
		
		return self
	end
	self.statusIds = cryoModule.List.join(self.statusIds or {}, p8)
	
	return self
end

function t_1:getStatusIds()
	return if self.configurableIds then nil else self.statusIds
end

function t_1:getAdditionalData()
	return self.additionalData or {}
end

return t_1
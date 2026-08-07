local cryoModule = require(script.Parent.Cryo)
local t = {}
t.__index = t

function t.new(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: t (ref)
	return setmetatable({ ids = t.makeArray(p1), delimiter = p2 }, p0)
end

function t:setIds(p3) --[[ line: 14 ]]
	-- upvalues: t (ref)
	self.ids = t.makeArray(p3)
end

function t.makeArray(p4) --[[ line: 18 ]]
	return if type(p4) == "table" then p4 else { p4 }
end

function t:__tostring() --[[ line: 25 ]]
	return table.concat(self.ids, self.delimiter)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p5, p6) --[[ line: 54 ]]
	-- upvalues: t_1 (ref)
	local t = {
		configurableIds = nil,
		idsDelimiter = ",",
		statusIds = nil,
		baseUrl = p5:gsub("/*$", ""),
		args = {},
		pathElements = {},
		namedIds = {},
		options = { queryArgs = nil, postBody = nil, headers = nil },
		useExpandedForm = {},
		additionalData = p6 or {}
	}
	setmetatable(t, t_1)
	
	return t
end

function t_1:path(p7) --[[ line: 80 ]]
	table.insert(self.pathElements, p7:gsub("^/", ""):gsub("/$", ""))
	
	return self
end

function t_1:id(p8, p9) --[[ line: 87 ]]
	-- upvalues: t (ref)
	if not p9 and #self.pathElements < 1 then
		warn("Cannot name id or ids because there is no leading path segment and no name is provided")
	end
	self.namedIds[p9 or self.pathElements[#self.pathElements]] = p8
	self.configurableIds = t:new(p8, self.idsDelimiter)
	table.insert(self.pathElements, self.configurableIds)
	
	return self
end

function t_1:queryArgWithIds(p10, p11) --[[ line: 99 ]]
	-- upvalues: cryoModule (ref), t (ref)
	local var5 = cryoModule.List.join(p11, self.namedIds[p10] or {})
	self.namedIds[p10] = var5
	self.configurableIds = t:new(var5, self.idsDelimiter)
	self.args = cryoModule.Dictionary.join(self.args, { [p10] = self.configurableIds })
	
	return self
end

function t_1:expandedQueryArgsWithIds(p12, p13) --[[ line: 109 ]]
	self.useExpandedForm[p12] = true
	self:queryArgWithIds(p12, p13)
	
	return self
end

function t_1:queryArgs(p14) --[[ line: 115 ]]
	-- upvalues: cryoModule (ref)
	self.args = cryoModule.Dictionary.join(self.args, p14)
	self.options.queryArgs = cryoModule.Dictionary.join(p14, self.options.queryArgs or {})
	
	return self
end

function t_1:body(p15) --[[ line: 121 ]]
	self.options.postBody = p15
	
	return self
end

function t_1:headers(p16) --[[ line: 126 ]]
	self.options.headers = p16
	
	return self
end

function t_1.makeKeyMapper(p17) --[[ line: 131 ]]
	return function(p18) --[[ line: 132 ]]
		-- upvalues: p17 (ref)
		return p17:getStatusIds() and p17:makeStatusUrl(p18) or p17:makeNamedIdsUrl(p18)
	end
end

function t_1._normalize(_, p19) --[[ line: 139 ]]
	return p19:gsub("/+", "/")
end

function t_1:makeUri() --[[ line: 143 ]]
	local var6 = ""
	
	for i, v in ipairs(self.pathElements) do
		var6 ..= "/" .. tostring(v)
	end
	return self:_normalize(var6)
end

local function concatArguments(p20, p21, p22, p23) --[[ line: 151 ]]
	-- upvalues: concatArguments (ref)
	if p23 then
		for i, v in pairs(p22.ids) do
			p20 = concatArguments(p20, p21, v)
		end
		return p20
	else
		local text = tostring(p21) .. "=" .. tostring(p22)
		
		return if p20:len() > 1 then p20 .. "&" .. text else text
	end
end

function t_1:makeQueryArgs(p24, p25) --[[ line: 168 ]]
	-- upvalues: concatArguments (ref)
	self:_plugInConfigurableIds(p24)
	local var8 = ""
	
	for i, v in pairs(self.args) do
		if p25 and self.namedIds[i] or not p25 then
			var8 = concatArguments(var8, i, v, self.useExpandedForm[i])
		end
	end
	return if var8:len() > 1 then "?" .. var8 else ""
end

function t_1:makeUrl(p26, p27) --[[ line: 184 ]]
	self:_plugInConfigurableIds(p26)
	
	return self.baseUrl .. self:makeUri() .. self:makeQueryArgs(p26, p27)
end

function t_1:makeStatusUrl(p28) --[[ line: 190 ]]
	local text = self.baseUrl .. self:makeUri()
	
	if not p28 then
		return text
	end
	local var10 = ""
	
	for i, v in pairs(if type(p28) == "table" then p28 else { p28 }) do
		var10 = if i > 1 then var10 .. "&" .. v else v
	end
	return text .. "?" .. var10
end

function t_1:makeNamedIdsUrl(p29) --[[ line: 205 ]]
	return self:makeUrl(p29, true)
end

function t_1:makeOptions() --[[ line: 209 ]]
	return self.options
end

function t_1:_plugInConfigurableIds(p30) --[[ line: 213 ]]
	if p30 ~= nil and self.configurableIds then
		self.configurableIds:setIds(p30)
	end
end

function t_1:getIds() --[[ line: 219 ]]
	return if self.configurableIds and self.configurableIds.ids then self.configurableIds.ids elseif self.statusIds then self.statusIds else {}
end

function t_1:getNamedIds() --[[ line: 229 ]]
	return self.namedIds
end

function t_1:setStatusIds(p31) --[[ line: 233 ]]
	-- upvalues: cryoModule (ref)
	if self.configurableIds then
		warn("Cannot set statusIds because ids already provided in URl")
		
		return self
	end
	self.statusIds = cryoModule.List.join(self.statusIds or {}, p31)
	
	return self
end

function t_1:getStatusIds() --[[ line: 242 ]]
	return if self.configurableIds then nil else self.statusIds
end

function t_1:getAdditionalData() --[[ line: 250 ]]
	return self.additionalData or {}
end

return t_1
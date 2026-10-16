local CryoModule = require(script.Parent.Cryo)
local Module = {}
Module.__index = Module

function Module.new(p1, JoinResult, IdsDelimiter) --[[ Line: 7 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		ids = Module.makeArray(JoinResult),
		delimiter = IdsDelimiter
	}, p1))
end

function Module:setIds(p1) --[[ Line: 14 ]]
	-- upvalues: Module (copy)
	self.ids = Module.makeArray(p1)
end

function Module.makeArray(p1) --[[ Line: 18 ]]
	return if type(p1) == "table" then p1 else { p1 }
end

function Module:__tostring(): string --[[ Line: 25 ]]
	return table.concat(self.ids, self.delimiter)
end

local RequestBuilderModule = {}
RequestBuilderModule.__index = RequestBuilderModule

function RequestBuilderModule.new(Text: string, p1) --[[ Line: 54 ]]
	-- upvalues: RequestBuilderModule (copy)
	local config = {
		configurableIds = nil,
		idsDelimiter = ",",
		statusIds = nil,
		baseUrl = Text:gsub("/*$", ""),
		args = {},
		pathElements = {},
		namedIds = {},
		options = { queryArgs = nil, postBody = nil, headers = nil },
		useExpandedForm = {},
		additionalData = p1 or {}
	}
	setmetatable(config, RequestBuilderModule)
	
	return config
end

function RequestBuilderModule:path(Text: string) --[[ Line: 80 ]]
	table.insert(self.pathElements, (Text:gsub("^/", ""):gsub("/$", "")))
	
	return self
end

function RequestBuilderModule:id(p1, p2) --[[ Line: 87 ]]
	-- upvalues: Module (copy)
	if not p2 and #self.pathElements < 1 then
		warn("Cannot name id or ids because there is no leading path segment and no name is provided")
	end
	self.namedIds[p2 or self.pathElements[#self.pathElements]] = p1
	self.configurableIds = Module:new(p1, self.idsDelimiter)
	table.insert(self.pathElements, self.configurableIds)
	
	return self
end

function RequestBuilderModule:queryArgWithIds(p1, p2) --[[ Line: 99 ]]
	-- upvalues: CryoModule (copy), Module (copy)
	local JoinResult = CryoModule.List.join(p2, self.namedIds[p1] or {})
	self.namedIds[p1] = JoinResult
	self.configurableIds = Module:new(JoinResult, self.idsDelimiter)
	self.args = CryoModule.Dictionary.join(self.args, { [p1] = self.configurableIds })
	
	return self
end

function RequestBuilderModule:expandedQueryArgsWithIds(p1, p2) --[[ Line: 109 ]]
	self.useExpandedForm[p1] = true
	self:queryArgWithIds(p1, p2)
	
	return self
end

function RequestBuilderModule:queryArgs(p1) --[[ Line: 115 ]]
	-- upvalues: CryoModule (copy)
	self.args = CryoModule.Dictionary.join(self.args, p1)
	self.options.queryArgs = CryoModule.Dictionary.join(p1, self.options.queryArgs or {})
	
	return self
end

function RequestBuilderModule:body(PostBody) --[[ Line: 121 ]]
	self.options.postBody = PostBody
	
	return self
end

function RequestBuilderModule:headers(Headers) --[[ Line: 126 ]]
	self.options.headers = Headers
	
	return self
end

function RequestBuilderModule.makeKeyMapper(p1) --[[ Line: 131 ]]
	return function(p2) --[[ Line: 132 ]]
		-- upvalues: p1 (copy)
		return p1:getStatusIds() and p1:makeStatusUrl(p2) or p1:makeNamedIdsUrl(p2)
	end
end

function RequestBuilderModule:_normalize(Text: string): string --[[ Line: 139 ]]
	return Text:gsub("/+", "/")
end

function RequestBuilderModule:makeUri() --[[ Line: 143 ]]
	local Text = ""
	
	for _, pathElement in ipairs(self.pathElements) do
		Text ..= "/" .. tostring(pathElement)
	end
	return self:_normalize(Text)
end

local function concatArguments(Text, p1, p2, UseExpandedFormEntry) --[[ Line: 151 ]]
	-- upvalues: concatArguments (copy)
	if not UseExpandedFormEntry then
		local Text1 = tostring(p1) .. "=" .. tostring(p2)
		
		return if Text:len() > 1 then Text .. "&" .. Text1 else Text1
	end
	for _, id in pairs(p2.ids) do
		Text = concatArguments(Text, p1, id)
	end
	return Text
end

function RequestBuilderModule:makeQueryArgs(p3, p4): string --[[ Line: 168 ]]
	-- upvalues: concatArguments (copy)
	self:_plugInConfigurableIds(p3)
	local Text = ""
	
	for i, arg in pairs(self.args) do
		if p4 and self.namedIds[i] or not p4 then
			Text = concatArguments(Text, i, arg, self.useExpandedForm[i])
		end
	end
	return if Text:len() > 1 then "?" .. Text else ""
end

function RequestBuilderModule:makeUrl(p5, p6): string --[[ Line: 184 ]]
	self:_plugInConfigurableIds(p5)
	
	return self.baseUrl .. self:makeUri() .. self:makeQueryArgs(p5, p6)
end

function RequestBuilderModule:makeStatusUrl(p5): string --[[ Line: 190 ]]
	local Text = self.baseUrl .. self:makeUri()
	
	if not p5 then
		return Text
	end
	local v1 = ""
	
	for i, value in pairs(type(p5) == "table" and p5 or { p5 }) do
		v1 = i > 1 and v1 .. "&" .. value or value
	end
	return Text .. "?" .. v1
end

function RequestBuilderModule:makeNamedIdsUrl(p6) --[[ Line: 205 ]]
	return self:makeUrl(p6, true)
end

function RequestBuilderModule:makeOptions() --[[ Line: 209 ]]
	return self.options
end

function RequestBuilderModule:_plugInConfigurableIds(p6) --[[ Line: 213 ]]
	if p6 ~= nil and self.configurableIds then
		self.configurableIds:setIds(p6)
	end
end

function RequestBuilderModule.getIds(p6) --[[ Line: 219 ]]
	return if p6.configurableIds and p6.configurableIds.ids then p6.configurableIds.ids elseif p6.statusIds then p6.statusIds else {}
end

function RequestBuilderModule:getNamedIds() --[[ Line: 229 ]]
	return self.namedIds
end

function RequestBuilderModule:setStatusIds(p6) --[[ Line: 233 ]]
	-- upvalues: CryoModule (copy)
	if self.configurableIds then
		warn("Cannot set statusIds because ids already provided in URl")
		
		return self
	else
		self.statusIds = CryoModule.List.join(self.statusIds or {}, p6)
		
		return self
	end
end

function RequestBuilderModule.getStatusIds(p6) --[[ Line: 242 ]]
	return if p6.configurableIds then nil else p6.statusIds
end

function RequestBuilderModule:getAdditionalData() --[[ Line: 250 ]]
	return self.additionalData or {}
end

return RequestBuilderModule
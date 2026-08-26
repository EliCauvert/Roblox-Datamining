local parent = script.Parent.Parent
local language = parent.language
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local httpService = game:GetService("HttpService")
local isObjectLike = require(parent.jsutils.isObjectLike).isObjectLike
local _ = require(language.ast)
local _ = require(language.source)
local getLocation = require(language.location).getLocation
local printLocationModule = require(language.printLocation)
local printLocation = printLocationModule.printLocation
local printSourceLocation = printLocationModule.printSourceLocation
local var1 = nil
local undefinedIfEmpty = nil
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl:__tostring()
	-- upvalues: var1 (write)
	return var1(self)
end

function tbl.new(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: error (ref), undefinedIfEmpty (write), array (ref), getLocation (ref), isObjectLike (ref), object (ref), tbl (ref)
	local graphQLError = error.new(p1)
	graphQLError.name = "GraphQLError"
	graphQLError.originalError = p6
	graphQLError.nodes = undefinedIfEmpty(if array.isArray(p2) then p2 elseif p2 then { p2 } else nil)
	local t = {}
	
	if graphQLError.nodes then
		for i, v in ipairs(graphQLError.nodes) do
			local loc = v.loc
			
			if loc ~= nil then
				table.insert(t, loc)
			end
		end
	end
	local var2 = undefinedIfEmpty(t)
	graphQLError.source = p3 or (if var2 == nil then nil else var2[1].source)
	graphQLError.positions = p4 or (if not var2 then nil else array.map(var2, function(p8)
		return p8.start
	end))
	var2 = if p4 and p3 then array.map(p4, function(p8)
		-- upvalues: getLocation (copy), p3 (ref)
		return getLocation(p3, p8)
	end) elseif var2 then array.map(var2, function(p8)
		-- upvalues: getLocation (copy)
		return getLocation(p8.source, p8.start)
	end) else nil
	graphQLError.locations = var2
	graphQLError.path = p5 or nil
	local var3 = if not p6 then nil else p6.extensions
	
	if p7 == nil and isObjectLike(var3) then
		graphQLError.extensions = object.assign({}, var3)
	else
		graphQLError.extensions = p7 or nil
	end
	if p6 and p6.stack then
		graphQLError.stack = p6.stack
	end
	return setmetatable(graphQLError, tbl)
end

function tbl.toString(p8)
	-- upvalues: var1 (write)
	return var1(p8)
end

function tbl:toJSON()
	-- upvalues: array (ref), httpService (ref)
	local list = { "message" }
	
	if self.locations ~= nil then
		table.insert(list, "locations")
	end
	if self.path ~= nil then
		table.insert(list, "path")
	end
	if self.extensions ~= nil then
		table.insert(list, "extensions")
	end
	return "{" .. array.join(array.map(list, function(p8)
		-- upvalues: httpService (copy), self (ref)
		return httpService:JSONEncode(p8) .. ":" .. httpService:JSONEncode(self[p8])
	end), ",") .. "}"
end

undefinedIfEmpty = function(p8)
	return if p8 == nil or #p8 == 0 then nil else p8
end

return {
	printError = function(p8)
		-- upvalues: printLocation (ref), printSourceLocation (ref)
		local message = p8.message
		
		if p8.nodes == nil then
			if p8.source ~= nil and p8.locations ~= nil then
				for i_1 = 1, #p8.locations do
					message ..= "\n\n" .. printSourceLocation(p8.source, p8.locations[i_1])
				end
			end
			return message
		else
			for i = 1, #p8.nodes do
				local var4 = p8.nodes[i]
				
				if var4.loc ~= nil then
					message ..= "\n\n" .. printLocation(var4.loc)
				end
			end
			return message
		end
	end,
	GraphQLError = tbl
}
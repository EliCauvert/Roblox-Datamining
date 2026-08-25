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
local var3 = nil
local undefinedIfEmpty = nil
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl:__tostring()
	-- upvalues: var3 (write)
	return var3(self)
end

function tbl.new(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: error (ref), undefinedIfEmpty (write), array (ref), getLocation (ref), isObjectLike (ref), object (ref), tbl (ref)
	local graphQLError = error.new(p0)
	graphQLError.name = "GraphQLError"
	graphQLError.originalError = p5
	graphQLError.nodes = undefinedIfEmpty(if array.isArray(p1) then p1 elseif p1 then { p1 } else nil)
	local t = {}
	
	if graphQLError.nodes then
		for i, v in ipairs(graphQLError.nodes) do
			local loc = v.loc
			
			if loc ~= nil then
				table.insert(t, loc)
			end
		end
	end
	local var8 = undefinedIfEmpty(t)
	graphQLError.source = p2 or (if var8 == nil then nil else var8[1].source)
	graphQLError.positions = p3 or (if not var8 then nil else array.map(var8, function(p7)
		return p7.start
	end))
	var8 = if p3 and p2 then array.map(p3, function(p9)
		-- upvalues: getLocation (copy), p2 (ref)
		return getLocation(p2, p9)
	end) elseif var8 then array.map(var8, function(p8)
		-- upvalues: getLocation (copy)
		return getLocation(p8.source, p8.start)
	end) else nil
	graphQLError.locations = var8
	graphQLError.path = p4 or nil
	local var9 = if not p5 then nil else p5.extensions
	
	if p6 == nil and isObjectLike(var9) then
		graphQLError.extensions = object.assign({}, var9)
	else
		graphQLError.extensions = p6 or nil
	end
	if p5 and p5.stack then
		graphQLError.stack = p5.stack
	end
	return setmetatable(graphQLError, tbl)
end

function tbl.toString(p10)
	-- upvalues: var3 (write)
	return var3(p10)
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
	return "{" .. array.join(array.map(list, function(p11)
		-- upvalues: httpService (copy), self (ref)
		return httpService:JSONEncode(p11) .. ":" .. httpService:JSONEncode(self[p11])
	end), ",") .. "}"
end

undefinedIfEmpty = function(p12)
	return if p12 == nil or #p12 == 0 then nil else p12
end

return {
	printError = function(p13)
		-- upvalues: printLocation (ref), printSourceLocation (ref)
		local message = p13.message
		
		if p13.nodes == nil then
			if p13.source ~= nil and p13.locations ~= nil then
				for i_1 = 1, #p13.locations do
					message ..= "\n\n" .. printSourceLocation(p13.source, p13.locations[i_1])
				end
			end
			return message
		else
			for i = 1, #p13.nodes do
				local var11 = p13.nodes[i]
				
				if var11.loc ~= nil then
					message ..= "\n\n" .. printLocation(var11.loc)
				end
			end
			return message
		end
	end,
	GraphQLError = tbl
}
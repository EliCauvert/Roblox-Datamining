local Parent = script.Parent.Parent
local Language = Parent.language
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local HttpService = game:GetService("HttpService")
local IsObjectLikeFunction = require(Parent.jsutils.isObjectLike).isObjectLike
local _ = require(Language.ast)
local _ = require(Language.source)
local GetLocationFunction = require(Language.location).getLocation
local PrintLocationModule = require(Language.printLocation)
local PrintLocationFunction = PrintLocationModule.printLocation
local PrintSourceLocationFunction = PrintLocationModule.printSourceLocation
local Callback = nil
local Callback1 = nil
local self = setmetatable({}, { __index = Error })
self.__index = self

function self.__tostring(p1) --[[ Line: 45 ]]
	-- upvalues: Callback (ref)
	return Callback(p1)
end

function self.new(p1, p2, p3, p4, p5, OriginalError, p6) --[[ Line: 124 ]]
	-- upvalues: Error (copy), Callback1 (ref), Array (copy), GetLocationFunction (copy), IsObjectLikeFunction (copy), Object (copy), self (copy)
	local NewError = Error.new(p1)
	NewError.name = "GraphQLError"
	NewError.originalError = OriginalError
	NewError.nodes = Callback1(if Array.isArray(p2) then p2 elseif p2 then { p2 } else nil)
	local List = {}
	
	if NewError.nodes then
		for _, node in ipairs(NewError.nodes) do
			local Loc = node.loc
			
			if Loc ~= nil then
				table.insert(List, Loc)
			end
		end
	end
	local CallbackResult = Callback1(List)
	NewError.source = if p3 then p3 elseif CallbackResult == nil then nil else CallbackResult[1].source
	NewError.positions = if p4 then p4 elseif CallbackResult then Array.map(CallbackResult, function(p7) --[[ Line: 165 ]]
		return p7.start
	end) else nil
	NewError.locations = if p4 and p3 then Array.map(p4, function(p7) --[[ Line: 170 ]]
		-- upvalues: GetLocationFunction (upval), p3 (copy)
		return GetLocationFunction(p3, p7)
	end) elseif CallbackResult then Array.map(CallbackResult, function(p7) --[[ Line: 174 ]]
		-- upvalues: GetLocationFunction (upval)
		return GetLocationFunction(p7.source, p7.start)
	end) else nil
	NewError.path = p5 or nil
	local Extensions = if OriginalError then OriginalError.extensions else nil
	
	if p6 == nil and IsObjectLikeFunction(Extensions) then
		NewError.extensions = Object.assign({}, Extensions)
	else
		NewError.extensions = p6 or nil
	end
	if OriginalError and OriginalError.stack then
		NewError.stack = OriginalError.stack
	end
	return (setmetatable(NewError, self))
end

function self.toString(p7) --[[ Line: 209 ]]
	-- upvalues: Callback (ref)
	return Callback(p7)
end

function self:toJSON(): string --[[ Line: 214 ]]
	-- upvalues: Array (copy), HttpService (copy)
	local List = { "message" }
	
	if self.locations ~= nil then
		table.insert(List, "locations")
	end
	if self.path ~= nil then
		table.insert(List, "path")
	end
	if self.extensions ~= nil then
		table.insert(List, "extensions")
	end
	return "{" .. Array.join(Array.map(List, function(Input): string --[[ Line: 231 ]]
		-- upvalues: HttpService (upval), self (copy)
		return HttpService:JSONEncode(Input) .. ":" .. HttpService:JSONEncode(self[Input])
	end), ",") .. "}"
end

Callback1 = function(p7) --[[ Line: 239 | Named "undefinedIfEmpty" ]]
	return if p7 == nil or #p7 == 0 then nil else p7
end

Callback = function(p7) --[[ Line: 243 | Named "printError" ]]
	-- upvalues: PrintLocationFunction (copy), PrintSourceLocationFunction (copy)
	local Message = p7.message
	
	if p7.nodes == nil then
		if p7.source ~= nil and p7.locations ~= nil then
			for i1 = 1, #p7.locations do
				Message ..= "\n\n" .. PrintSourceLocationFunction(p7.source, p7.locations[i1])
			end
		end
		return Message
	else
		for i = 1, #p7.nodes do
			local Node = p7.nodes[i]
			
			if Node.loc ~= nil then
				Message ..= "\n\n" .. PrintLocationFunction(Node.loc)
			end
		end
		return Message
	end
end

return { printError = Callback, GraphQLError = self }
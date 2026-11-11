local ApolloLinkModule = {}
local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantError = InvariantModule.InvariantError
local Invariant = InvariantModule.invariant
local Observable = require(Parent.utilities).Observable
local _ = require(script.Parent.types)
local UtilsModule = require(script.Parent.Parent.utils)
local ValidateOperationFunction = UtilsModule.validateOperation
local CreateOperationFunction = UtilsModule.createOperation
local TransformOperationFunction = UtilsModule.transformOperation
local Module = {}
Module.__index = Module

local function passthrough(_, p1, Callback)
	-- upvalues: Boolean (copy), Observable (copy)
	return if Boolean.toJSBoolean(Callback) then Callback(p1) else Observable.of()
end

local function toLink(Request)
	-- upvalues: Module (copy)
	return if typeof(Request) == "function" then Module.new(Request) else Request
end

local function _(p1): boolean
	local DebugInfo, _ = debug.info(p1.request, "a")
	
	return DebugInfo <= 2
end

local self = setmetatable({}, { __index = Error1 })
self.__index = self

function self.new(p1, Link)
	-- upvalues: Error1 (copy), self (copy)
	local NewError = Error1.new(p1)
	NewError.link = Link
	
	return (setmetatable(NewError, self))
end

function Module.empty()
	-- upvalues: Module (copy), Observable (copy)
	return Module.new(function(_)
		-- upvalues: Observable (upval)
		return Observable.of()
	end)
end

function Module.from(p1)
	-- upvalues: Module (copy), Array (copy), toLink (copy)
	return if #p1 == 0 then Module.empty() else Array.reduce(Array.map(p1, toLink, nil), function(p2, p3)
		return p2:concat(p3)
	end)
end

function Module.split_(Callback, Request, Request1)
	-- upvalues: Module (copy), Boolean (copy), passthrough (copy), Observable (copy)
	local NewModule = if typeof(Request) == "function" then Module.new(Request) else Request
	local NewModule2 = nil
	
	if Boolean.toJSBoolean(Request1) and Request1 ~= nil then
		NewModule2 = if typeof(Request1) == "function" then Module.new(Request1) else Request1
	else
		local NewModule1 = Module.new(passthrough)
		NewModule2 = if typeof(NewModule1) == "function" then Module.new(NewModule1) else NewModule1
	end
	local DebugInfo, _ = debug.info(NewModule.request, "a")
	
	if DebugInfo <= 2 then
		local DebugInfo1, _ = debug.info(NewModule2.request, "a")
		
		if DebugInfo1 <= 2 then
			return Module.new(function(_, p1)
				-- upvalues: Callback (copy), NewModule (copy), Boolean (upval), Observable (upval), NewModule2 (ref)
				if Callback(p1) then
					local RequestResult = NewModule:request(p1)
					
					return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
				else
					local RequestResult = NewModule2:request(p1)
					
					return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
				end
			end)
		end
	end
	return Module.new(function(_, p1, p2)
		-- upvalues: Callback (copy), NewModule (copy), Boolean (upval), Observable (upval), NewModule2 (ref)
		if Callback(p1) then
			local RequestResult = NewModule:request(p1, p2)
			
			return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
		else
			local RequestResult = NewModule2:request(p1, p2)
			
			return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
		end
	end)
end

function Module:execute(p1)
	-- upvalues: CreateOperationFunction (copy), TransformOperationFunction (copy), ValidateOperationFunction (copy), Boolean (copy), Observable (copy)
	local RequestResult = self:request(CreateOperationFunction(p1.context, TransformOperationFunction(ValidateOperationFunction(p1))))
	
	return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
end

function Module.concat_(Request, Request1)
	-- upvalues: Module (copy), Invariant (copy), self (copy), Boolean (copy), Observable (copy)
	local NewModule = if typeof(Request) == "function" then Module.new(Request) else Request
	local DebugInfo, _ = debug.info(NewModule.request, "a")
	
	if DebugInfo <= 2 then
		Invariant.warn(self.new("You are calling concat on a terminating link, which will have no effect", NewModule))
		
		return NewModule
	else
		local NewModule1 = if typeof(Request1) == "function" then Module.new(Request1) else Request1
		local DebugInfo1, _ = debug.info(NewModule1.request, "a")
		
		return if DebugInfo1 <= 2 then Module.new(function(_, p1)
			-- upvalues: NewModule (copy), NewModule1 (copy), Boolean (upval), Observable (upval)
			local RequestResult = NewModule:request(p1, function(p2)
				-- upvalues: NewModule1 (upval), Boolean (upval), Observable (upval)
				local RequestResult = NewModule1:request(p2)
				
				return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
			end)
			
			return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
		end) else Module.new(function(_, p1, p2)
			-- upvalues: NewModule (copy), NewModule1 (copy), Boolean (upval), Observable (upval)
			local RequestResult = NewModule:request(p1, function(p3)
				-- upvalues: NewModule1 (upval), p2 (copy), Boolean (upval), Observable (upval)
				local RequestResult = NewModule1:request(p3, p2)
				
				return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
			end)
			
			return Boolean.toJSBoolean(RequestResult) and RequestResult or Observable.of()
		end)
	end
end

function Module.new(Request)
	-- upvalues: Boolean (copy), Module (copy)
	local t = {}
	
	if Boolean.toJSBoolean(Request) then
		t.request = Request
	end
	return (setmetatable(t, Module))
end

function Module:split(p1, p2, p3)
	-- upvalues: Module (copy), Boolean (copy), passthrough (copy)
	return self:concat(Module.split_(p1, p2, Boolean.toJSBoolean(p3) and p3 or Module.new(passthrough)))
end

function Module.concat(p1, Split_Result)
	-- upvalues: Module (copy)
	return Module.concat_(p1, Split_Result)
end

function Module:request(_, _)
	-- upvalues: InvariantError (copy)
	error(InvariantError.new("request is not implemented"))
end

function Module:onError(p1, p2): boolean?
	-- upvalues: Boolean (copy)
	if not Boolean.toJSBoolean(p2) or p2 == nil or not Boolean.toJSBoolean(p2.error) then
		error(p1)
		
		return
	end
	p2:error(p1)
	
	return false
end

function Module:setOnError(OnError)
	self.onError = OnError
	
	return self
end

ApolloLinkModule.ApolloLink = Module

return ApolloLinkModule
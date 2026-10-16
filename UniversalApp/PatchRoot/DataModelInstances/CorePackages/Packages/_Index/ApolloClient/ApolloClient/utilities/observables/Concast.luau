local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Set = LuauPolyfillModule.Set
local Array = LuauPolyfillModule.Array
local Error = LuauPolyfillModule.Error
local PromiseModule = require(Parent.Promise)
local Sub = {}
local Observable = require(script.Parent.Observable).Observable
local IterateObserversSafelyFunction = require(script.Parent.iteration).iterateObserversSafely
local FixObservableSubclassFunction: (any) -> () = require(script.Parent.subclassing).fixObservableSubclass

local function _(p1): boolean --[[ Line: 50 | Named "isPromiseLike" ]]
	-- upvalues: Boolean (copy)
	return Boolean.toJSBoolean(p1) and typeof(p1.andThen) == "function"
end

local self = setmetatable({}, { __index = Observable })
self.__index = self

function self.new(Promise) --[[ Line: 125 ]]
	-- upvalues: Observable (copy), self (copy), Set (copy), Sub (copy), PromiseModule (copy), IterateObserversSafelyFunction (copy), Boolean (copy)
	local v1 = nil
	v1 = setmetatable(Observable.new(function(p1) --[[ Line: 129 ]]
		-- upvalues: v1 (ref)
		v1:addObserver(p1)
		
		return function() --[[ Line: 131 ]]
			-- upvalues: v1 (upval), p1 (copy)
			return v1:removeObserver(p1)
		end
	end), self)
	v1.observers = Set.new()
	v1.sub = Sub
	v1.source = {}
	v1.latest = nil
	v1.addCount = 0
	v1.promise = PromiseModule.new(function(Callback, Callback1) --[[ Line: 163 ]]
		-- upvalues: v1 (ref)
		function v1:resolve(...) --[[ Line: 164 ]]
			-- upvalues: Callback (copy)
			Callback(...)
		end
		
		function v1:reject(...) --[[ Line: 167 ]]
			-- upvalues: Callback1 (copy)
			Callback1(...)
		end
	end)
	v1.handlers = {
		next = function(_, p1) --[[ Line: 175 ]]
			-- upvalues: v1 (ref), IterateObserversSafelyFunction (upval)
			if v1.sub ~= nil then
				v1.latest = { "next", p1 }
				IterateObserversSafelyFunction(v1.observers, "next", p1)
			end
		end,
		error = function(_, p1) --[[ Line: 181 ]]
			-- upvalues: v1 (ref), Boolean (upval), PromiseModule (upval), IterateObserversSafelyFunction (upval)
			local Sub = v1.sub
			
			if Sub ~= nil then
				if Boolean.toJSBoolean(Sub) then
					PromiseModule.delay(0):andThen(function() --[[ Line: 188 ]]
						-- upvalues: Sub (copy)
						return Sub:unsubscribe()
					end)
				end
				v1.sub = nil
				v1.latest = { "error", p1 }
				v1:reject(p1)
				IterateObserversSafelyFunction(v1.observers, "error", p1)
			end
		end,
		complete = function(_) --[[ Line: 198 ]]
			-- upvalues: v1 (ref), Boolean (upval), IterateObserversSafelyFunction (upval)
			if v1.sub ~= nil then
				local Removed = table.remove(v1.sources, 1)
				
				if not Boolean.toJSBoolean(Removed) then
					v1.sub = nil
					
					if v1.latest == nil or v1.latest[1] ~= "next" then
						v1:resolve()
					else
						v1:resolve(v1.latest[2])
					end
					IterateObserversSafelyFunction(v1.observers, "complete")
					
					return
				elseif Boolean.toJSBoolean(Removed) and typeof(Removed.andThen) == "function" then
					Removed:andThen(function(Result) --[[ Line: 216 ]]
						-- upvalues: v1 (upval)
						v1.sub = Result:subscribe(v1.handlers)
					end)
					
					return
				else
					v1.sub = Removed:subscribe(v1.handlers)
				end
			end
		end
	}
	
	function v1:cancel(p1) --[[ Line: 227 ]]
		-- upvalues: v1 (ref)
		v1:reject(p1)
		v1.sources = {}
		v1.handlers:complete()
	end
	
	v1.promise:catch(function() --[[ Line: 236 ]] end)
	
	if typeof(Promise) == "function" then
		Promise = { Observable.new(Promise) }
	end
	if Boolean.toJSBoolean(Promise) and typeof(Promise.andThen) == "function" then
		Promise:andThen(function(Result) --[[ Line: 246 ]]
			-- upvalues: v1 (ref)
			v1:start(Result)
		end, function(...) --[[ Line: 248 ]]
			-- upvalues: v1 (ref)
			v1.handlers:error(...)
		end)
	else
		v1:start(Promise)
	end
	return v1
end

function self:start(Promise) --[[ Line: 261 ]]
	-- upvalues: Sub (copy), Array (copy)
	if self.sub == Sub then
		self.sources = Array.from(Promise)
		self.handlers:complete()
		
		return
	end
end

function self:deliverLastMessage(p1) --[[ Line: 278 ]]
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(self.latest) then
		local LatestEntry = self.latest[1]
		local Callback: (any, any) -> () = p1[LatestEntry]
		
		if Boolean.toJSBoolean(Callback) then
			Callback(p1, self.latest[2])
		end
		if self.sub == nil and LatestEntry == "next" and p1.complete ~= nil then
			p1.complete(p1)
		end
	end
end

function self:addObserver(p1) --[[ Line: 296 ]]
	if not self.observers:has(p1) then
		self:deliverLastMessage(p1)
		self.observers:add(p1)
		self.addCount += 1
	end
end

function self:removeObserver(p1, p2) --[[ Line: 306 ]]
	-- upvalues: Error (copy)
	if self.observers:delete(p1) then
		self.addCount -= 1
		
		if self.addCount < 1 and not p2 then
			self.handlers:error(Error.new("Observable cancelled prematurely"))
		end
	end
end

function self:cleanup(Callback) --[[ Line: 322 ]]
	local Flag = false
	local v1 = nil
	
	local function once() --[[ Line: 325 ]]
		-- upvalues: Flag (ref), self (copy), v1 (ref), Callback (copy)
		if not Flag then
			Flag = true
			self.observers:delete(v1)
			Callback()
		end
	end
	
	v1 = { next = once, error = once, complete = once }
	local AddCount = self.addCount
	self:addObserver(v1)
	self.addCount = AddCount
end

function self.of(...) --[[ Line: 345 ]]
	-- upvalues: Observable (copy), self (copy)
	return Observable.of(self, ...)
end

function self.from(...) --[[ Line: 349 ]]
	-- upvalues: Observable (copy), self (copy)
	return Observable.from(self, ...)
end

local ConcastModule = { Concast = self }
FixObservableSubclassFunction(self)

return ConcastModule
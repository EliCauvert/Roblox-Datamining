local t = {}
local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local set = luauPolyfillModule.Set
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local promiseModule = require(parent.Promise)
local t_1 = {}
local observable = require(script.Parent.Observable).Observable
local iterateObserversSafely = require(script.Parent.iteration).iterateObserversSafely
local fixObservableSubclass = require(script.Parent.subclassing).fixObservableSubclass

local function _(p1)
	-- upvalues: boolean (ref)
	return boolean.toJSBoolean(p1) and typeof(p1.andThen) == "function"
end

local tbl = setmetatable({}, { __index = observable })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: observable (ref), tbl (ref), set (ref), t_1 (ref), promiseModule (ref), iterateObserversSafely (ref), boolean (ref)
	local tbl_1 = nil
	tbl_1 = setmetatable(observable.new(function(p2)
		-- upvalues: tbl_1 (write)
		tbl_1:addObserver(p2)
		
		return function()
			-- upvalues: tbl_1 (copy), p2 (ref)
			return tbl_1:removeObserver(p2)
		end
	end), tbl)
	tbl_1.observers = set.new()
	tbl_1.sub = t_1
	tbl_1.source = {}
	tbl_1.latest = nil
	tbl_1.addCount = 0
	tbl_1.promise = promiseModule.new(function(p2, p3)
		-- upvalues: tbl_1 (write)
		function tbl_1.resolve(_, ...)
			-- upvalues: p2 (ref)
			p2(...)
		end
		
		function tbl_1.reject(_, ...)
			-- upvalues: p3 (ref)
			p3(...)
		end
	end)
	tbl_1.handlers = {
		next = function(_, p2)
			-- upvalues: tbl_1 (write), iterateObserversSafely (copy)
			if tbl_1.sub ~= nil then
				tbl_1.latest = { "next", p2 }
				iterateObserversSafely(tbl_1.observers, "next", p2)
			end
		end,
		error = function(_, p2)
			-- upvalues: tbl_1 (write), boolean (copy), promiseModule (copy), iterateObserversSafely (copy)
			local sub = tbl_1.sub
			
			if sub ~= nil then
				if boolean.toJSBoolean(sub) then
					promiseModule.delay(0):andThen(function()
						-- upvalues: sub (ref)
						return sub:unsubscribe()
					end)
				end
				tbl_1.sub = nil
				tbl_1.latest = { "error", p2 }
				tbl_1:reject(p2)
				iterateObserversSafely(tbl_1.observers, "error", p2)
			end
		end,
		complete = function(_)
			-- upvalues: tbl_1 (write), boolean (copy), iterateObserversSafely (copy)
			if tbl_1.sub ~= nil then
				local removed = table.remove(tbl_1.sources, 1)
				
				if boolean.toJSBoolean(removed) then
					if boolean.toJSBoolean(removed) and typeof(removed.andThen) == "function" then
						removed:andThen(function(p2)
							-- upvalues: tbl_1 (copy)
							tbl_1.sub = p2:subscribe(tbl_1.handlers)
						end)
						
						return
					end
					tbl_1.sub = removed:subscribe(tbl_1.handlers)
				else
					tbl_1.sub = nil
					
					if tbl_1.latest == nil or tbl_1.latest[1] ~= "next" then
						tbl_1:resolve()
					else
						tbl_1:resolve(tbl_1.latest[2])
					end
					iterateObserversSafely(tbl_1.observers, "complete")
					
					return
				end
			end
		end
	}
	
	function tbl_1.cancel(_, p2)
		-- upvalues: tbl_1 (write)
		tbl_1:reject(p2)
		tbl_1.sources = {}
		tbl_1.handlers:complete()
	end
	
	tbl_1.promise:catch(function() end)
	
	if typeof(p1) == "function" then
		p1 = { observable.new(p1) }
	end
	if boolean.toJSBoolean(p1) and typeof(p1.andThen) == "function" then
		p1:andThen(function(p2)
			-- upvalues: tbl_1 (write)
			tbl_1:start(p2)
		end, function(...)
			-- upvalues: tbl_1 (write)
			tbl_1.handlers:error(...)
		end)
	else
		tbl_1:start(p1)
	end
	return tbl_1
end

function tbl:start(p1)
	-- upvalues: t_1 (ref), array (ref)
	if self.sub == t_1 then
		self.sources = array.from(p1)
		self.handlers:complete()
		
		return
	end
end

function tbl:deliverLastMessage(p1)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.latest) then
		local var1 = self.latest[1]
		local var2 = p1[var1]
		
		if boolean.toJSBoolean(var2) then
			var2(p1, self.latest[2])
		end
		if self.sub == nil and var1 == "next" and p1.complete ~= nil then
			p1:complete()
		end
	end
end

function tbl:addObserver(p1)
	if not self.observers:has(p1) then
		self:deliverLastMessage(p1)
		self.observers:add(p1)
		self.addCount += 1
	end
end

function tbl:removeObserver(p1, p2)
	-- upvalues: error (ref)
	if self.observers:delete(p1) then
		self.addCount -= 1
		
		if self.addCount < 1 and not p2 then
			self.handlers:error(error.new("Observable cancelled prematurely"))
		end
	end
end

function tbl:cleanup(p1)
	local var1 = false
	local var2 = nil
	
	local function once()
		-- upvalues: var1 (write), self (ref), var2 (write), p1 (ref)
		if not var1 then
			var1 = true
			self.observers:delete(var2)
			p1()
		end
	end
	
	local addCount = self.addCount
	self:addObserver({ next = once, error = once, complete = once })
	self.addCount = addCount
end

function tbl.of(...)
	-- upvalues: observable (ref), tbl (ref)
	return observable.of(tbl, ...)
end

function tbl.from(...)
	-- upvalues: observable (ref), tbl (ref)
	return observable.from(tbl, ...)
end

t.Concast = tbl
fixObservableSubclass(tbl)

return t
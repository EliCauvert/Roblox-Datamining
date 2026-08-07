-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 50 | named "isPromiseLike" ]]
	-- upvalues: boolean (ref)
	return boolean.toJSBoolean(p0) and typeof(p0.andThen) == "function"
end

local tbl = setmetatable({}, { __index = observable })
tbl.__index = tbl

function tbl.new(p1) --[[ line: 125 ]]
	-- upvalues: observable (ref), tbl (ref), set (ref), t_1 (ref), promiseModule (ref), iterateObserversSafely (ref), boolean (ref)
	local tbl_1 = nil
	tbl_1 = setmetatable(observable.new(function(p2) --[[ line: 129 ]]
		-- upvalues: tbl_1 (write)
		tbl_1:addObserver(p2)
		
		return function() --[[ line: 131 ]]
			-- upvalues: tbl_1 (copy), p2 (ref)
			return tbl_1:removeObserver(p2)
		end
	end), tbl)
	tbl_1.observers = set.new()
	tbl_1.sub = t_1
	tbl_1.source = {}
	tbl_1.latest = nil
	tbl_1.addCount = 0
	tbl_1.promise = promiseModule.new(function(p3, p4) --[[ line: 163 ]]
		-- upvalues: tbl_1 (write)
		function tbl_1.resolve(_, ...) --[[ line: 164 ]]
			-- upvalues: p3 (ref)
			p3(...)
		end
		
		function tbl_1.reject(_, ...) --[[ line: 167 ]]
			-- upvalues: p4 (ref)
			p4(...)
		end
	end)
	tbl_1.handlers = {
		next = function(_, p5) --[[ line: 175 ]]
			-- upvalues: tbl_1 (write), iterateObserversSafely (copy)
			if tbl_1.sub ~= nil then
				tbl_1.latest = { "next", p5 }
				iterateObserversSafely(tbl_1.observers, "next", p5)
			end
		end,
		error = function(_, p6) --[[ line: 181 ]]
			-- upvalues: tbl_1 (write), boolean (copy), promiseModule (copy), iterateObserversSafely (copy)
			local sub = tbl_1.sub
			
			if sub ~= nil then
				if boolean.toJSBoolean(sub) then
					promiseModule.delay(0):andThen(function() --[[ line: 188 ]]
						-- upvalues: sub (ref)
						return sub:unsubscribe()
					end)
				end
				tbl_1.sub = nil
				tbl_1.latest = { "error", p6 }
				tbl_1:reject(p6)
				iterateObserversSafely(tbl_1.observers, "error", p6)
			end
		end,
		complete = function(_) --[[ line: 198 ]]
			-- upvalues: tbl_1 (write), boolean (copy), iterateObserversSafely (copy)
			if tbl_1.sub ~= nil then
				local removed = table.remove(tbl_1.sources, 1)
				
				if boolean.toJSBoolean(removed) then
					if boolean.toJSBoolean(removed) and typeof(removed.andThen) == "function" then
						removed:andThen(function(p7) --[[ line: 216 ]]
							-- upvalues: tbl_1 (copy)
							tbl_1.sub = p7:subscribe(tbl_1.handlers)
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
	
	function tbl_1.cancel(_, p8) --[[ line: 227 ]]
		-- upvalues: tbl_1 (write)
		tbl_1:reject(p8)
		tbl_1.sources = {}
		tbl_1.handlers:complete()
	end
	
	tbl_1.promise:catch(function() --[[ line: 236 ]] end)
	
	if typeof(p1) == "function" then
		p1 = { observable.new(p1) }
	end
	if boolean.toJSBoolean(p1) and typeof(p1.andThen) == "function" then
		p1:andThen(function(p9) --[[ line: 246 ]]
			-- upvalues: tbl_1 (write)
			tbl_1:start(p9)
		end, function(...) --[[ line: 248 ]]
			-- upvalues: tbl_1 (write)
			tbl_1.handlers:error(...)
		end)
	else
		tbl_1:start(p1)
	end
	return tbl_1
end

function tbl:start(p10) --[[ line: 261 ]]
	-- upvalues: t_1 (ref), array (ref)
	if self.sub == t_1 then
		self.sources = array.from(p10)
		self.handlers:complete()
		
		return
	end
end

function tbl:deliverLastMessage(p11) --[[ line: 278 ]]
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.latest) then
		local var7 = self.latest[1]
		local var8 = p11[var7]
		
		if boolean.toJSBoolean(var8) then
			var8(p11, self.latest[2])
		end
		if self.sub == nil and var7 == "next" and p11.complete ~= nil then
			p11:complete()
		end
	end
end

function tbl:addObserver(p12) --[[ line: 296 ]]
	if not self.observers:has(p12) then
		self:deliverLastMessage(p12)
		self.observers:add(p12)
		self.addCount += 1
	end
end

function tbl:removeObserver(p13, p14) --[[ line: 306 ]]
	-- upvalues: error (ref)
	if self.observers:delete(p13) then
		self.addCount -= 1
		
		if self.addCount < 1 and not p14 then
			self.handlers:error(error.new("Observable cancelled prematurely"))
		end
	end
end

function tbl:cleanup(p15) --[[ line: 322 ]]
	local var9 = false
	local var10 = nil
	
	local function once() --[[ line: 325 ]]
		-- upvalues: var9 (write), self (ref), var10 (write), p15 (ref)
		if not var9 then
			var9 = true
			self.observers:delete(var10)
			p15()
		end
	end
	
	local addCount = self.addCount
	self:addObserver({ next = once, error = once, complete = once })
	self.addCount = addCount
end

function tbl.of(...) --[[ line: 345 ]]
	-- upvalues: observable (ref), tbl (ref)
	return observable.of(tbl, ...)
end

function tbl.from(...) --[[ line: 349 ]]
	-- upvalues: observable (ref), tbl (ref)
	return observable.from(tbl, ...)
end

t.Concast = tbl
fixObservableSubclass(tbl)

return t
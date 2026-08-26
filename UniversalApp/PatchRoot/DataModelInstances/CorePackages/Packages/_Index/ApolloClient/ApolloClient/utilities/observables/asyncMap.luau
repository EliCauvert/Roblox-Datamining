local parent = script.Parent.Parent.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local promiseModule = require(parent.Promise)
local t = {}
local observable = require(script.Parent.Observable).Observable

function t.asyncMap(p1, p2, p3)
	-- upvalues: observable (ref), promiseModule (ref), boolean (ref)
	return observable.new(function(p4)
		-- upvalues: promiseModule (copy), boolean (copy), p2 (ref), p3 (ref), p1 (ref)
		local var1 = nil
		local next = p4.next
		local error = p4.error
		local complete = p4.complete
		local var2 = 0
		local var3 = false
		local t = {
			andThen = function(_, p5)
				-- upvalues: promiseModule (copy)
				return promiseModule.new(function(p6)
					-- upvalues: p5 (ref)
					return p6(p5())
				end)
			end
		}
		
		local function _(p5, p6)
			-- upvalues: boolean (copy), var2 (write), t (write), promiseModule (copy), next (ref), p4 (ref), var3 (write), var1 (write), error (ref)
			return if boolean.toJSBoolean(p5) then function(_, p7)
				-- upvalues: var2 (copy), p5 (ref), t (copy), promiseModule (copy), boolean (copy), next (copy), p4 (copy), var3 (copy), var1 (copy), error (copy)
				var2 += 1
				
				local function both()
					-- upvalues: p5 (copy), p7 (ref)
					return p5(p7)
				end
				
				t = t:andThen(function()
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p8)
					-- upvalues: var2 (copy), boolean (copy), next (copy), p4 (copy), var3 (copy), var1 (copy)
					var2 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p4, p8)
					end
					if boolean.toJSBoolean(var3) then
						var1.complete()
					end
				end, function(p8)
					-- upvalues: var2 (copy)
					var2 -= 1
					error(p8)
				end):catch(function(p8)
					-- upvalues: boolean (copy), error (copy), p4 (copy)
					if boolean.toJSBoolean(error) then
						return error(p4, p8)
					end
				end)
			end else function(_, p7)
				-- upvalues: boolean (copy), p6 (ref), p4 (copy)
				if boolean.toJSBoolean(p6) then
					p6(p4, p7)
				end
			end
		end
		
		local var4 = p1:subscribe({
			next = if boolean.toJSBoolean(p2) then function(_, p5)
				-- upvalues: var2 (write), p2 (ref), t (write), promiseModule (copy), boolean (copy), next (ref), p4 (ref), var3 (write), var1 (write), error (ref)
				var2 += 1
				
				local function both()
					-- upvalues: p2 (copy), p5 (ref)
					return p2(p5)
				end
				
				t = t:andThen(function()
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p6)
					-- upvalues: var2 (copy), boolean (copy), next (copy), p4 (copy), var3 (copy), var1 (copy)
					var2 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p4, p6)
					end
					if boolean.toJSBoolean(var3) then
						var1.complete()
					end
				end, function(p6)
					-- upvalues: var2 (copy)
					var2 -= 1
					error(p6)
				end):catch(function(p6)
					-- upvalues: boolean (copy), error (copy), p4 (copy)
					if boolean.toJSBoolean(error) then
						return error(p4, p6)
					end
				end)
			end else function(_, p5)
				-- upvalues: boolean (copy), next (ref), p4 (ref)
				if boolean.toJSBoolean(next) then
					next(p4, p5)
				end
			end,
			error = if boolean.toJSBoolean(p3) then function(_, p5)
				-- upvalues: var2 (write), p3 (ref), t (write), promiseModule (copy), boolean (copy), next (ref), p4 (ref), var3 (write), var1 (write), error (ref)
				var2 += 1
				
				local function both()
					-- upvalues: p3 (copy), p5 (ref)
					return p3(p5)
				end
				
				t = t:andThen(function()
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p6)
					-- upvalues: var2 (copy), boolean (copy), next (copy), p4 (copy), var3 (copy), var1 (copy)
					var2 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p4, p6)
					end
					if boolean.toJSBoolean(var3) then
						var1.complete()
					end
				end, function(p6)
					-- upvalues: var2 (copy)
					var2 -= 1
					error(p6)
				end):catch(function(p6)
					-- upvalues: boolean (copy), error (copy), p4 (copy)
					if boolean.toJSBoolean(error) then
						return error(p4, p6)
					end
				end)
			end else function(_, p5)
				-- upvalues: boolean (copy), error (ref), p4 (ref)
				if boolean.toJSBoolean(error) then
					error(p4, p5)
				end
			end,
			complete = function()
				-- upvalues: var3 (write), boolean (copy), var2 (write), complete (ref), p4 (ref)
				var3 = true
				
				if not boolean.toJSBoolean(var2) and boolean.toJSBoolean(complete) then
					complete(p4)
				end
			end
		})
		
		return function()
			-- upvalues: var4 (ref)
			return var4:unsubscribe()
		end
	end)
end

return t
-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local promiseModule = require(parent.Promise)
local t = {}
local observable = require(script.Parent.Observable).Observable

function t.asyncMap(p0, p1, p2) --[[ line: 37 ]]
	-- upvalues: observable (ref), promiseModule (ref), boolean (ref)
	return observable.new(function(p3) --[[ line: 42 ]]
		-- upvalues: promiseModule (copy), boolean (copy), p1 (ref), p2 (ref), p0 (ref)
		local var2 = nil
		local next = p3.next
		local error = p3.error
		local complete = p3.complete
		local var3 = 0
		local var4 = false
		local t = {
			andThen = function(_, p4) --[[ line: 54 ]]
				-- upvalues: promiseModule (copy)
				return promiseModule.new(function(p5) --[[ line: 55 ]]
					-- upvalues: p4 (ref)
					return p5(p4())
				end)
			end
		}
		
		local function _(p6, p7) --[[ line: 62 | named "makeCallback" ]]
			-- upvalues: boolean (copy), var3 (write), t (write), promiseModule (copy), next (ref), p3 (ref), var4 (write), var2 (write), error (ref)
			return if boolean.toJSBoolean(p6) then function(_, p9) --[[ line: 67 ]]
				-- upvalues: var3 (copy), p6 (ref), t (copy), promiseModule (copy), boolean (copy), next (copy), p3 (copy), var4 (copy), var2 (copy), error (copy)
				var3 += 1
				
				local function both() --[[ line: 69 ]]
					-- upvalues: p6 (copy), p9 (ref)
					return p6(p9)
				end
				
				t = t:andThen(function() --[[ line: 75 ]]
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p11) --[[ line: 80 ]]
					-- upvalues: var3 (copy), boolean (copy), next (copy), p3 (copy), var4 (copy), var2 (copy)
					var3 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p3, p11)
					end
					if boolean.toJSBoolean(var4) then
						var2.complete()
					end
				end, function(p12) --[[ line: 88 ]]
					-- upvalues: var3 (copy)
					var3 -= 1
					error(p12)
				end):catch(function(p10) --[[ line: 92 ]]
					-- upvalues: boolean (copy), error (copy), p3 (copy)
					if boolean.toJSBoolean(error) then
						return error(p3, p10)
					end
				end)
			end else function(_, p8) --[[ line: 100 ]]
				-- upvalues: boolean (copy), p7 (ref), p3 (copy)
				if boolean.toJSBoolean(p7) then
					p7(p3, p8)
				end
			end
		end
		
		local var6 = p0:subscribe({
			next = if boolean.toJSBoolean(p1) then function(_, p14) --[[ line: 67 ]]
				-- upvalues: var3 (write), p1 (ref), t (write), promiseModule (copy), boolean (copy), next (ref), p3 (ref), var4 (write), var2 (write), error (ref)
				var3 += 1
				
				local function both() --[[ line: 69 ]]
					-- upvalues: p1 (copy), p14 (ref)
					return p1(p14)
				end
				
				t = t:andThen(function() --[[ line: 75 ]]
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p16) --[[ line: 80 ]]
					-- upvalues: var3 (copy), boolean (copy), next (copy), p3 (copy), var4 (copy), var2 (copy)
					var3 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p3, p16)
					end
					if boolean.toJSBoolean(var4) then
						var2.complete()
					end
				end, function(p17) --[[ line: 88 ]]
					-- upvalues: var3 (copy)
					var3 -= 1
					error(p17)
				end):catch(function(p15) --[[ line: 92 ]]
					-- upvalues: boolean (copy), error (copy), p3 (copy)
					if boolean.toJSBoolean(error) then
						return error(p3, p15)
					end
				end)
			end else function(_, p13) --[[ line: 100 ]]
				-- upvalues: boolean (copy), next (ref), p3 (ref)
				if boolean.toJSBoolean(next) then
					next(p3, p13)
				end
			end,
			error = if boolean.toJSBoolean(p2) then function(_, p19) --[[ line: 67 ]]
				-- upvalues: var3 (write), p2 (ref), t (write), promiseModule (copy), boolean (copy), next (ref), p3 (ref), var4 (write), var2 (write), error (ref)
				var3 += 1
				
				local function both() --[[ line: 69 ]]
					-- upvalues: p2 (copy), p19 (ref)
					return p2(p19)
				end
				
				t = t:andThen(function() --[[ line: 75 ]]
					-- upvalues: promiseModule (copy)
					return promiseModule.delay(0)
				end):andThen(both, both):andThen(function(p21) --[[ line: 80 ]]
					-- upvalues: var3 (copy), boolean (copy), next (copy), p3 (copy), var4 (copy), var2 (copy)
					var3 -= 1
					
					if boolean.toJSBoolean(next) then
						next(p3, p21)
					end
					if boolean.toJSBoolean(var4) then
						var2.complete()
					end
				end, function(p22) --[[ line: 88 ]]
					-- upvalues: var3 (copy)
					var3 -= 1
					error(p22)
				end):catch(function(p20) --[[ line: 92 ]]
					-- upvalues: boolean (copy), error (copy), p3 (copy)
					if boolean.toJSBoolean(error) then
						return error(p3, p20)
					end
				end)
			end else function(_, p18) --[[ line: 100 ]]
				-- upvalues: boolean (copy), error (ref), p3 (ref)
				if boolean.toJSBoolean(error) then
					error(p3, p18)
				end
			end,
			complete = function() --[[ line: 111 ]]
				-- upvalues: var4 (write), boolean (copy), var3 (write), complete (ref), p3 (ref)
				var4 = true
				
				if not boolean.toJSBoolean(var3) and boolean.toJSBoolean(complete) then
					complete(p3)
				end
			end
		})
		
		return function() --[[ line: 122 ]]
			-- upvalues: var6 (ref)
			return var6:unsubscribe()
		end
	end)
end

return t
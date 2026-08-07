local parent = script:FindFirstAncestor("HttpClient").Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.types)
local t = {}

return function(p0) --[[ line: 15 | named "asPromise" ]]
	-- upvalues: promiseModule (ref), t (ref), signalsModule (ref)
	local t_1 = {}
	
	return promiseModule.new(function(p1, p2, p3) --[[ line: 17 ]]
		-- upvalues: t (copy), t_1 (ref), p0 (ref), signalsModule (copy)
		local var4 = false
		local var5 = false
		
		local function _() --[[ line: 21 | named "cleanupEffect" ]]
			-- upvalues: var5 (write), t (copy), t_1 (copy)
			if var5 then return end
			var5 = true
			local var9 = t[t_1]
			t[t_1] = nil
			
			if var9 ~= nil then
				var9()
			end
		end
		
		local function settle(value) --[[ line: 33 ]]
			-- upvalues: var4 (write), var5 (write), t (copy), t_1 (copy), p1 (ref), p2 (ref)
			if var4 then return end
			var4 = true
			
			if not var5 then
				var5 = true
				local var10 = t[t_1]
				t[t_1] = nil
				
				if var10 ~= nil then
					var10()
				end
			end
			if value.status == "succeeded" then
				p1(value.result)
				
				return
			end
			p2({
				responseCode = value.errorCode,
				errorMessage = value.error
			})
		end
		
		local var7 = p0.state(false)
		
		if var7.status ~= "pending" then
			settle(var7)
			
			return
		end
		local _ = nil
		local var8 = signalsModule.createEffect(function(p4) --[[ line: 54 ]]
			-- upvalues: p0 (copy), settle (ref)
			local var11 = p0.state(p4)
			
			if var11.status == "pending" then
				return
			end
			settle(var11)
		end)
		t[t_1] = var8
		p3(function() --[[ line: 67 ]]
			-- upvalues: var4 (write), var5 (write), t (copy), t_1 (copy)
			if var4 then return end
			var4 = true
			
			if var5 then return end
			var5 = true
			local var12 = t[t_1]
			t[t_1] = nil
			
			if var12 ~= nil then
				var12()
			end
		end)
	end)
end
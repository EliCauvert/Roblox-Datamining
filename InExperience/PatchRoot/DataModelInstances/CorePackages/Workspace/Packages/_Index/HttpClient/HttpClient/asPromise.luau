local parent = script:FindFirstAncestor("HttpClient").Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.types)
local fFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local t = {}

return function(p1)
	-- upvalues: promiseModule (ref), t (ref), fFlagHttpClientRetryExtensionsModule (ref), signalsModule (ref)
	local t_1 = {}
	
	return promiseModule.new(function(p2, p3, p4)
		-- upvalues: t (copy), t_1 (ref), fFlagHttpClientRetryExtensionsModule (copy), p1 (ref), signalsModule (copy)
		local var1 = false
		local var2 = false
		
		local function _()
			-- upvalues: var2 (write), t (copy), t_1 (copy), fFlagHttpClientRetryExtensionsModule (copy), p1 (copy)
			if var2 then return end
			var2 = true
			local var3 = t[t_1]
			t[t_1] = nil
			
			if var3 ~= nil then
				var3()
			end
			if fFlagHttpClientRetryExtensionsModule then
				p1.dispose()
			end
		end
		
		local function settle(value)
			-- upvalues: var1 (write), var2 (write), t (copy), t_1 (copy), fFlagHttpClientRetryExtensionsModule (copy), p1 (copy), p2 (ref), p3 (ref)
			if var1 then return end
			var1 = true
			
			if not var2 then
				var2 = true
				local var3 = t[t_1]
				t[t_1] = nil
				
				if var3 ~= nil then
					var3()
				end
				if fFlagHttpClientRetryExtensionsModule then
					p1.dispose()
				end
			end
			if value.status == "succeeded" then
				p2(value.result)
				
				return
			elseif fFlagHttpClientRetryExtensionsModule then
				p3({
					responseCode = value.errorCode,
					errorMessage = value.error,
					response = value.response
				})
				
				return
			end
			p3({
				responseCode = value.errorCode,
				errorMessage = value.error
			})
		end
		
		local var3 = p1.state(false)
		
		if var3.status ~= "pending" then
			settle(var3)
			
			return
		end
		local _ = nil
		local var4 = signalsModule.createEffect(function(p5)
			-- upvalues: p1 (copy), settle (ref)
			local var5 = p1.state(p5)
			
			if var5.status == "pending" then
				return
			end
			settle(var5)
		end)
		t[t_1] = var4
		p4(function()
			-- upvalues: var1 (write), var2 (write), t (copy), t_1 (copy), fFlagHttpClientRetryExtensionsModule (copy), p1 (copy)
			if var1 then return end
			var1 = true
			
			if var2 then return end
			var2 = true
			local var5 = t[t_1]
			t[t_1] = nil
			
			if var5 ~= nil then
				var5()
			end
			if fFlagHttpClientRetryExtensionsModule then
				p1.dispose()
			end
		end)
	end)
end
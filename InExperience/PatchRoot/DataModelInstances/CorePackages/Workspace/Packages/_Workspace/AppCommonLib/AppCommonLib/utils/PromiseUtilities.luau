local parent = script:FindFirstAncestor("AppCommonLib").Parent
local resultModule = require(parent.Result)
local promiseModule = require(parent.Promise)

return {
	Batch = function(p1, p2)
		-- upvalues: promiseModule (ref), resultModule (ref)
		assert(type(p1) == "table", "PromiseUtilities expects a list of Promises!")
		local var1 = 0
		
		for i, v in pairs(p1) do
			assert(promiseModule.is(v), "PromiseUtilities expects a list of Promises!")
			var1 += 1
		end
		return promiseModule.new(function(p3, _)
			-- upvalues: resultModule (copy), var1 (write), p1 (ref), p2 (ref)
			local var2 = 0
			local t = {}
			
			local function _(p4, p5, p6)
				-- upvalues: t (ref), resultModule (copy), var2 (write), var1 (copy), p3 (ref)
				t[p4] = resultModule.new(p5, p6)
				var2 += 1
				
				if var2 == var1 then
					p3(t)
				end
			end
			
			if next(p1) == nil then
				p3(t)
			end
			for i, v in pairs(p1) do
				v:andThen(function(p4, ...)
					-- upvalues: i (ref), t (ref), resultModule (copy), var2 (write), var1 (copy), p3 (ref)
					if select("#", ...) > 0 then
						warn("Promises in PromiseUtilities.Batch should not return tuple")
					end
					t[i] = resultModule.new(true, p4)
					var2 += 1
					
					if var2 == var1 then
						p3(t)
					end
				end, function(p4)
					-- upvalues: i (ref), t (ref), resultModule (copy), var2 (write), var1 (copy), p3 (ref), p2 (copy)
					t[i] = resultModule.new(false, p4)
					var2 += 1
					
					if var2 == var1 then
						p3(t)
					end
					if p2 then
						p2(p4)
					end
				end)
			end
		end)
	end,
	CountResults = function(p3)
		local var2 = 0
		local var3 = 0
		
		for i, v in pairs(p3) do
			local var4, _ = v:unwrap()
			
			if not var4 then
				var3 += 1
			end
			var2 += 1
		end
		return {
			successCount = var2 - var3,
			failureCount = var3,
			totalCount = var2
		}
	end
}
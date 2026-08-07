local parent = script:FindFirstAncestor("AppCommonLib").Parent
local resultModule = require(parent.Result)
local promiseModule = require(parent.Promise)

return {
	Batch = function(p0, p1) --[[ line: 30 ]]
		-- upvalues: promiseModule (ref), resultModule (ref)
		assert(type(p0) == "table", "PromiseUtilities expects a list of Promises!")
		local var2 = 0
		
		for i, v in pairs(p0) do
			assert(promiseModule.is(v), "PromiseUtilities expects a list of Promises!")
			var2 += 1
		end
		return promiseModule.new(function(p2, _) --[[ line: 40 ]]
			-- upvalues: resultModule (copy), var2 (write), p0 (ref), p1 (ref)
			local var3 = 0
			local t = {}
			
			local function _(p3, p4, p5) --[[ line: 44 | named "promiseCompleted" ]]
				-- upvalues: t (ref), resultModule (copy), var3 (write), var2 (copy), p2 (ref)
				t[p3] = resultModule.new(p4, p5)
				var3 += 1
				
				if var3 == var2 then
					p2(t)
				end
			end
			
			if next(p0) == nil then
				p2(t)
			end
			for i, v in pairs(p0) do
				v:andThen(function(p6, ...) --[[ line: 58 ]]
					-- upvalues: i (ref), t (ref), resultModule (copy), var3 (write), var2 (copy), p2 (ref)
					if select("#", ...) > 0 then
						warn("Promises in PromiseUtilities.Batch should not return tuple")
					end
					t[i] = resultModule.new(true, p6)
					var3 += 1
					
					if var3 == var2 then
						p2(t)
					end
				end, function(p7) --[[ line: 63 ]]
					-- upvalues: i (ref), t (ref), resultModule (copy), var3 (write), var2 (copy), p2 (ref), p1 (copy)
					t[i] = resultModule.new(false, p7)
					var3 += 1
					
					if var3 == var2 then
						p2(t)
					end
					if p1 then
						p1(p7)
					end
				end)
			end
		end)
	end,
	CountResults = function(p8) --[[ line: 73 ]]
		local var5 = 0
		local var6 = 0
		
		for i, v in pairs(p8) do
			local var7, _ = v:unwrap()
			
			if not var7 then
				var6 += 1
			end
			var5 += 1
		end
		return {
			successCount = var5 - var6,
			failureCount = var6,
			totalCount = var5
		}
	end
}
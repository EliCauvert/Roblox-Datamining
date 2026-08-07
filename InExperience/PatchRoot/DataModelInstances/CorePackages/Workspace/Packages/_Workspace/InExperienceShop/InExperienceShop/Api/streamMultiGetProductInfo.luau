local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)
local getProductInfoModule = require(script.Parent.getProductInfo)
local _ = require(script.Parent.multiGetProductInfo)

return function(p0, p1) --[[ line: 20 | named "streamMultiGetProductInfo" ]]
	-- upvalues: promiseModule (ref), getProductInfoModule (ref)
	local p0Count = #p0
	
	if p0Count == 0 then
		return promiseModule.resolve({})
	end
	local list = table.create(p0Count)
	local var4 = 0
	
	return promiseModule.new(function(p2) --[[ line: 32 ]]
		-- upvalues: p0 (ref), getProductInfoModule (copy), list (ref), p1 (ref), var4 (write), p0Count (ref)
		for i, v in ipairs(p0) do
			getProductInfoModule(v.id, v.infoType):andThen(function(p5) --[[ line: 35 ]]
				-- upvalues: v (ref)
				return { ok = true, request = v, value = p5 }
			end):catch(function(p4) --[[ line: 38 ]]
				-- upvalues: v (ref)
				return { ok = false, request = v, err = p4 }
			end):andThen(function(p3) --[[ line: 41 ]]
				-- upvalues: list (copy), i (ref), p1 (copy), var4 (copy), p0Count (copy), p2 (ref)
				list[i] = p3
				p1.onResult(p3)
				var4 += 1
				
				if var4 == p0Count then
					p2(list)
				end
			end)
		end
	end)
end
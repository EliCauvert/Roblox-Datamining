local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)
local getProductInfoModule = require(script.Parent.getProductInfo)
local _ = require(script.Parent.multiGetProductInfo)

return function(p1, p2)
	-- upvalues: promiseModule (ref), getProductInfoModule (ref)
	local p0Count = #p1
	
	if p0Count == 0 then
		return promiseModule.resolve({})
	end
	local list = table.create(p0Count)
	local var1 = 0
	
	return promiseModule.new(function(p3)
		-- upvalues: p1 (ref), getProductInfoModule (copy), list (ref), p2 (ref), var1 (write), p0Count (ref)
		for i, v in ipairs(p1) do
			getProductInfoModule(v.id, v.infoType):andThen(function(p4)
				-- upvalues: v (ref)
				return { ok = true, request = v, value = p4 }
			end):catch(function(p4)
				-- upvalues: v (ref)
				return { ok = false, request = v, err = p4 }
			end):andThen(function(p4)
				-- upvalues: list (copy), i (ref), p2 (copy), var1 (copy), p0Count (copy), p3 (ref)
				list[i] = p4
				p2.onResult(p4)
				var1 += 1
				
				if var1 == p0Count then
					p3(list)
				end
			end)
		end
	end)
end
local enumNetworkStatusModule = require(script.Parent.EnumNetworkStatus)
local buildActionNameModule = require(script.Parent.buildActionName)
local promiseModule = require(script.Parent.Promise)

return function(p1)
	-- upvalues: buildActionNameModule (ref), enumNetworkStatusModule (ref), promiseModule (ref)
	local var1 = require(script.Parent.getStatus)(p1)
	
	local function _(p2, p3, p4)
		-- upvalues: buildActionNameModule (copy), p1 (ref)
		return {
			ids = p2,
			keymapper = p3,
			status = p4,
			type = buildActionNameModule(p1)
		}
	end
	
	local function filter(p2, p3, p4)
		-- upvalues: var1 (ref), enumNetworkStatusModule (copy)
		local t = {}
		
		for i, v in ipairs(p3) do
			if var1(p2, p4(v)) ~= enumNetworkStatusModule.Fetching then
				table.insert(t, v)
			end
		end
		return t
	end
	
	return function(p5, p6, p7, p8)
		-- upvalues: filter (ref), p1 (ref), promiseModule (copy), enumNetworkStatusModule (copy), buildActionNameModule (copy)
		local var2 = filter(p5:getState(), p6, p7)
		
		if p1.killRequestWithFilteredIds and #p6 > 0 and #var2 == 0 then
			return promiseModule.reject("Request with provided IDs already fetching.")
		end
		p5:dispatch({
			ids = var2,
			keymapper = p7,
			status = enumNetworkStatusModule.Fetching,
			type = buildActionNameModule(p1)
		})
		
		return p8(p5, var2):andThen(function(p9)
			-- upvalues: p5 (ref), var2 (ref), p7 (ref), enumNetworkStatusModule (copy), buildActionNameModule (copy), p1 (copy)
			p5:dispatch({
				ids = var2,
				keymapper = p7,
				status = enumNetworkStatusModule.Done,
				type = buildActionNameModule(p1)
			})
			
			return p9
		end, function(p9)
			-- upvalues: p5 (ref), var2 (ref), p7 (ref), enumNetworkStatusModule (copy), buildActionNameModule (copy), p1 (copy), promiseModule (copy)
			p5:dispatch({
				ids = var2,
				keymapper = p7,
				status = enumNetworkStatusModule.Failed,
				type = buildActionNameModule(p1)
			})
			
			return promiseModule.reject(p9)
		end)
	end
end
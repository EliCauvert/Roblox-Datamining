local _ = require(script:FindFirstAncestor("MomentsCommon").Media.MediaTypes)

return function()
	local t = {}
	
	return {
		register = function(p0)
			-- upvalues: t (ref)
			assert(not t[p0.kind], `mediaNodeRegistry: kind "{p0.kind}" already registered`)
			t[p0.kind] = p0
		end,
		getFactory = function(p1)
			-- upvalues: t (ref)
			return t[p1]
		end,
		create = function(p2, p3, p4)
			-- upvalues: t (ref)
			local var1 = t[p2]
			assert(var1, `mediaNodeRegistry: no factory registered for kind "{p2}"`)
			
			return var1.create(p3, p4)
		end,
		getKinds = function()
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i in t do
				table.insert(t_1, i)
			end
			table.sort(t_1)
			
			return t_1
		end
	}
end
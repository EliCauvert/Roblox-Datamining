local _ = require(script:FindFirstAncestor("MomentsCommon").Media.MediaTypes)

return function() --[[ Line: 45 | Named "createMediaNodeRegistry" ]]
	local t = {}
	
	return {
		register = function(p1) --[[ Line: 48 ]]
			-- upvalues: t (copy)
			assert(not t[p1.kind], `mediaNodeRegistry: kind "{p0.kind}" already registered`)
			t[p1.kind] = p1
		end,
		getFactory = function(p1) --[[ Line: 55 ]]
			-- upvalues: t (copy)
			return t[p1]
		end,
		create = function(p1, p2, p3) --[[ Line: 59 ]]
			-- upvalues: t (copy)
			local Entry = t[p1]
			assert(Entry, `mediaNodeRegistry: no factory registered for kind "{p2}"`)
			
			return Entry.create(p2, p3)
		end,
		getKinds = function() --[[ Line: 65 ]]
			-- upvalues: t (copy)
			local List = {}
			
			for i in t do
				table.insert(List, i)
			end
			table.sort(List)
			
			return List
		end
	}
end
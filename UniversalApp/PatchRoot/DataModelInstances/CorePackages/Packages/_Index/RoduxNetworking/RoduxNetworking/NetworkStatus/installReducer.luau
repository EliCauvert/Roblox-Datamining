local roduxModule = require(script.Parent.Rodux)
local cryoModule = require(script.Parent.Parent.Cryo)
local buildActionNameModule = require(script.Parent.buildActionName)

return function(p0) --[[ line: 11 ]]
	-- upvalues: roduxModule (ref), buildActionNameModule (ref), cryoModule (ref)
	return function() --[[ line: 12 ]]
		-- upvalues: roduxModule (copy), buildActionNameModule (copy), p0 (ref), cryoModule (copy)
		return roduxModule.createReducer({}, {
			[buildActionNameModule(p0)] = function(p1, p2) --[[ line: 14 ]]
				-- upvalues: cryoModule (copy)
				local t = {}
				
				if #p2.ids == 0 then
					t[p2.keymapper()] = p2.status
				else
					for i, v in ipairs(p2.ids) do
						t[p2.keymapper(v)] = p2.status
					end
				end
				return cryoModule.Dictionary.join(p1, t)
			end
		})
	end
end
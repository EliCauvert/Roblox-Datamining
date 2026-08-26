local roduxModule = require(script.Parent.Rodux)
local cryoModule = require(script.Parent.Parent.Cryo)
local buildActionNameModule = require(script.Parent.buildActionName)

return function(p1)
	-- upvalues: roduxModule (ref), buildActionNameModule (ref), cryoModule (ref)
	return function()
		-- upvalues: roduxModule (copy), buildActionNameModule (copy), p1 (ref), cryoModule (copy)
		return roduxModule.createReducer({}, {
			[buildActionNameModule(p1)] = function(p2, p3)
				-- upvalues: cryoModule (copy)
				local t = {}
				
				if #p3.ids == 0 then
					t[p3.keymapper()] = p3.status
				else
					for i, v in ipairs(p3.ids) do
						t[p3.keymapper(v)] = p3.status
					end
				end
				return cryoModule.Dictionary.join(p2, t)
			end
		})
	end
end
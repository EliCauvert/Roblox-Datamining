local RoduxModule = require(script.Parent.Rodux)
local CryoModule = require(script.Parent.Parent.Cryo)
local BuildActionNameModule = require(script.Parent.buildActionName)

return function(p1)
	-- upvalues: RoduxModule (copy), BuildActionNameModule (copy), CryoModule (copy)
	return function()
		-- upvalues: RoduxModule (upval), BuildActionNameModule (upval), p1 (copy), CryoModule (upval)
		return RoduxModule.createReducer({}, {
			[BuildActionNameModule(p1)] = function(p2, p3)
				-- upvalues: CryoModule (upval)
				local Statuses = {}
				
				if #p3.ids == 0 then
					Statuses[p3.keymapper()] = p3.status
				else
					for _, id in ipairs(p3.ids) do
						Statuses[p3.keymapper(id)] = p3.status
					end
				end
				return CryoModule.Dictionary.join(p2, Statuses)
			end
		})
	end
end
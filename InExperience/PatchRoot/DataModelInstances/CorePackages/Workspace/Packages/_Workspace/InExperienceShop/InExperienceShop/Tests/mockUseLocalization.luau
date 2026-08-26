local parent = script:FindFirstAncestor("InExperienceShop").Parent
local jest = require(parent.Dev.JestGlobals).jest

return function()
	-- upvalues: jest (ref), parent (ref)
	jest.mock(parent.Localization, function()
		return {
			Hooks = {
				useLocalization = function(p1)
					local t = {}
					
					for i, v in p1 do
						if typeof(v) == "table" then
							t[i] = v[1]
						else
							t[i] = v
						end
					end
					return t
				end
			},
			NumberLocalization = {
				localize = function(p2, _)
					return p2
				end
			}
		}
	end)
end
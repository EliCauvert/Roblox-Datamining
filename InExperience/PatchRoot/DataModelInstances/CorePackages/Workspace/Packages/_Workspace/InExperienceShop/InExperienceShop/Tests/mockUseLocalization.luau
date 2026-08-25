local parent = script:FindFirstAncestor("InExperienceShop").Parent
local jest = require(parent.Dev.JestGlobals).jest

return function()
	-- upvalues: jest (ref), parent (ref)
	jest.mock(parent.Localization, function()
		return {
			Hooks = {
				useLocalization = function(p0)
					local t = {}
					
					for i, v in p0 do
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
				localize = function(p1, _)
					return p1
				end
			}
		}
	end)
end
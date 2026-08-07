local parent = script:FindFirstAncestor("InExperienceShop").Parent
local jest = require(parent.Dev.JestGlobals).jest

return function() --[[ line: 22 | named "mockUseLocalization" ]]
	-- upvalues: jest (ref), parent (ref)
	jest.mock(parent.Localization, function() --[[ line: 23 ]]
		return {
			Hooks = {
				useLocalization = function(p0) --[[ line: 26 ]]
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
				localize = function(p1, _) --[[ line: 39 ]]
					return p1
				end
			}
		}
	end)
end
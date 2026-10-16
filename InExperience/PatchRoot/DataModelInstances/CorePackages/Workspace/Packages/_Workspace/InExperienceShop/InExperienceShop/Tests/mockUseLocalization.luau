local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local Jest = require(Parent.Dev.JestGlobals).jest

return function() --[[ Line: 22 | Named "mockUseLocalization" ]]
	-- upvalues: Jest (copy), Parent (copy)
	Jest.mock(Parent.Localization, function() --[[ Line: 23 ]]
		return {
			Hooks = {
				useLocalization = function(List) --[[ Line: 26 ]]
					local t = {}
					
					for i, value in List do
						if typeof(value) == "table" then
							t[i] = value[1]
						else
							t[i] = value
						end
					end
					return t
				end
			},
			NumberLocalization = {
				localize = function(p1, _) --[[ Line: 39 ]]
					return p1
				end
			}
		}
	end)
end
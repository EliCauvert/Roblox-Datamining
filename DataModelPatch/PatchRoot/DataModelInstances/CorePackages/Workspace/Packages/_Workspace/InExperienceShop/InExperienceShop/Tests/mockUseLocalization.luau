local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local Jest = require(Parent.Dev.JestGlobals).jest

return function()
	-- upvalues: Jest (copy), Parent (copy)
	Jest.mock(Parent.Localization, function()
		return {
			Hooks = {
				useLocalization = function(List)
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
				localize = function(p1, _)
					return p1
				end
			}
		}
	end)
end
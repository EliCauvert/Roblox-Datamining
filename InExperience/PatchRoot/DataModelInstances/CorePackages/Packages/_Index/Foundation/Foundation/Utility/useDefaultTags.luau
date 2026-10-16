local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Foundation.Components.Types)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)

return function(p1, p2) --[[ Line: 10 | Named "useDefaultTags" ]]
	-- upvalues: ReactModule (copy), DashModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 11 ]]
		-- upvalues: p1 (copy), p2 (copy), DashModule (upval)
		return if p1 == nil then p2 elseif type(p1) == "string" then `{p2} {p1}` else DashModule.join(p1, { [p2] = true })
	end, { p1, p2 })
end
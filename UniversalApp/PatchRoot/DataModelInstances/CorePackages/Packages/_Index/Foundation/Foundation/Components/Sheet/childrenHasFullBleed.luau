local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local fullBleedModule = require(script.Parent.FullBleed)

local function _(p0)
	return if type(p0) == "table" then p0.type else nil
end

return function(p1)
	-- upvalues: reactModule (ref), fullBleedModule (ref)
	local var2 = false
	reactModule.Children.forEach(p1, function(p2)
		-- upvalues: fullBleedModule (copy), var2 (write)
		if (if type(p2) ~= "table" then p2.type else nil) == fullBleedModule then
			var2 = true
		end
	end)
	
	return var2
end
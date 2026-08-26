local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local fullBleedModule = require(script.Parent.FullBleed)

local function _(p1)
	return if type(p1) == "table" then p1.type else nil
end

return function(p1)
	-- upvalues: reactModule (ref), fullBleedModule (ref)
	local var1 = false
	reactModule.Children.forEach(p1, function(p2)
		-- upvalues: fullBleedModule (copy), var1 (write)
		if (if type(p2) ~= "table" then p2.type else nil) == fullBleedModule then
			var1 = true
		end
	end)
	
	return var1
end
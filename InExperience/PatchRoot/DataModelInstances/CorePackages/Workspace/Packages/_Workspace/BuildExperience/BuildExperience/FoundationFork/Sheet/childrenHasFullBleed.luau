local ReactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)
local FullBleedModule = require(script.Parent.FullBleed)

local function _(p1)
	return if type(p1) == "table" then p1.type else nil
end

return function(p1): boolean
	-- upvalues: ReactModule (copy), FullBleedModule (copy)
	local Flag = false
	ReactModule.Children.forEach(p1, function(p2)
		-- upvalues: FullBleedModule (upval), Flag (ref)
		if (if type(p2) == "table" then p2.type else nil) == FullBleedModule then
			Flag = true
		end
	end)
	
	return Flag
end
local robuxUpsellModule = require(script.Parent.Parent.Models.RobuxUpsell)
local t = {
	new = function(p1)
		return { products = p1 }
	end
}

function t.fromJson(p1)
	-- upvalues: robuxUpsellModule (ref), t (ref)
	local t_1 = {}
	
	for i, v in pairs(p1.products) do
		t_1[i] = robuxUpsellModule.fromJson(v)
	end
	return t.new(t_1)
end

return t
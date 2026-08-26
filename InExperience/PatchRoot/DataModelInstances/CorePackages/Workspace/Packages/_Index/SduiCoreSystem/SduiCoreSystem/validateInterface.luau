local tModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.t)

return function(p1, p2, p3)
	-- upvalues: tModule (ref)
	if p3 == nil then
		p3 = true
	end
	return (if p3 then tModule.interface(p2) else tModule.strictInterface(p2))(p1)
end
local tModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.t)

return function(p0, p1, p2)
	-- upvalues: tModule (ref)
	if p2 == nil then
		p2 = true
	end
	return (if p2 then tModule.interface(p1) else tModule.strictInterface(p1))(p0)
end
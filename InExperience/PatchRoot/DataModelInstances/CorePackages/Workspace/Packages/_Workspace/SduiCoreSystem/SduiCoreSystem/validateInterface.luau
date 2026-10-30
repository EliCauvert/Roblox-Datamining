local TModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.t)

return function(p1, p2, p3: boolean)
	-- upvalues: TModule (copy)
	if p3 == nil then
		p3 = true
	end
	return (if p3 then TModule.interface(p2) else TModule.strictInterface(p2))(p1)
end
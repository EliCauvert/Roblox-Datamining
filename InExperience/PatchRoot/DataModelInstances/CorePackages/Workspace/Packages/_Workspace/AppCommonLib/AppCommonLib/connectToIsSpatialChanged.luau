local VRService = require(script:FindFirstAncestor("AppCommonLib").Parent.MockableProxyServices).VRService
local isSpatialModule = require(script.Parent.isSpatial)

return function(p1, p2)
	-- upvalues: isSpatialModule (ref), VRService (ref)
	local var1 = isSpatialModule()
	local var2 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
		-- upvalues: isSpatialModule (copy), var1 (write), p1 (ref)
		local var3 = isSpatialModule()
		
		if var3 == var1 then
			return
		end
		var1 = var3
		p1(var3)
	end)
	
	if p2 then
		p1(var1)
	end
	return var2
end
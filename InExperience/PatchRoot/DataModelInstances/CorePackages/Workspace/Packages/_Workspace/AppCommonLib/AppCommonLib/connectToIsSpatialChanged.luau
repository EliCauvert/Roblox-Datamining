local VRService = require(script:FindFirstAncestor("AppCommonLib").Parent.MockableProxyServices).VRService
local isSpatialModule = require(script.Parent.isSpatial)

return function(p0, p1)
	-- upvalues: isSpatialModule (ref), VRService (ref)
	local var1 = isSpatialModule()
	local var2 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
		-- upvalues: isSpatialModule (copy), var1 (write), p0 (ref)
		local var3 = isSpatialModule()
		
		if var3 == var1 then
			return
		end
		var1 = var3
		p0(var3)
	end)
	
	if p1 then
		p0(var1)
	end
	return var2
end
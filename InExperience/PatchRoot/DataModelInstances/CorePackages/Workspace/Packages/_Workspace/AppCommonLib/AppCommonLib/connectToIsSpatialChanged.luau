local VRService = require(script:FindFirstAncestor("AppCommonLib").Parent.MockableProxyServices).VRService
local IsSpatialModule = require(script.Parent.isSpatial)

return function(Callback: (any) -> (), p1) --[[ Line: 8 | Named "connectToIsSpatialChanged" ]]
	-- upvalues: IsSpatialModule (copy), VRService (copy)
	local IsSpatialModule1 = IsSpatialModule()
	local Connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 14 ]]
		-- upvalues: IsSpatialModule (upval), IsSpatialModule1 (ref), Callback (copy)
		local IsSpatialModule2 = IsSpatialModule()
		
		if IsSpatialModule2 ~= IsSpatialModule1 then
			IsSpatialModule1 = IsSpatialModule2
			Callback(IsSpatialModule2)
			
			return
		end
	end)
	
	if p1 then
		Callback(IsSpatialModule1)
	end
	return Connection
end
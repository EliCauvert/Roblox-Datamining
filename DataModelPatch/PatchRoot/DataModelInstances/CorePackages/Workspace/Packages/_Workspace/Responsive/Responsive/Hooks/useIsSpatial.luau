local Parent = script:FindFirstAncestor("Responsive").Parent
local ReactModule = require(Parent.React)
local AppCommonLibModule = require(Parent.AppCommonLib)

return function()
	-- upvalues: ReactModule (copy), AppCommonLibModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(AppCommonLibModule.isSpatial)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), AppCommonLibModule (upval)
		UseStateResult2(AppCommonLibModule.isSpatial())
		local ConnectToIsSpatialChangedResult = AppCommonLibModule.connectToIsSpatialChanged(function(p1)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p1)
		end)
		
		return function()
			-- upvalues: ConnectToIsSpatialChangedResult (copy)
			ConnectToIsSpatialChangedResult:Disconnect()
		end
	end, {})
	
	return UseStateResult
end
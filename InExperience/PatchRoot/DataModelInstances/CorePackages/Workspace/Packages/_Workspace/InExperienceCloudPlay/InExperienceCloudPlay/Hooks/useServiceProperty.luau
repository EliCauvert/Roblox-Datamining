local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local ReactModule = require(InExperienceCloudPlay.Parent.React)
local _ = require(InExperienceCloudPlay.getCloudClientService)

return function(Object, PropertyName)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if Object then Object[PropertyName] else nil)
	ReactModule.useEffect(function()
		-- upvalues: Object (copy), PropertyName (copy), UseStateResult2 (copy)
		if Object then
			local Connection = Object:GetPropertyChangedSignal(PropertyName):Connect(function()
				-- upvalues: UseStateResult2 (upval), Object (upval), PropertyName (upval)
				UseStateResult2(Object[PropertyName])
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return nil
		end
	end, { Object, PropertyName })
	
	return UseStateResult
end
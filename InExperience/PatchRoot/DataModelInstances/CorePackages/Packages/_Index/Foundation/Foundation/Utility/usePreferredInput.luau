local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService

return function() --[[ Line: 7 | Named "usePreferredInput" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserInputService.PreferredInput)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 12 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.PreferredInput)
		end)
		UseStateResult2(UserInputService.PreferredInput)
		
		return function() --[[ Line: 18 ]]
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end
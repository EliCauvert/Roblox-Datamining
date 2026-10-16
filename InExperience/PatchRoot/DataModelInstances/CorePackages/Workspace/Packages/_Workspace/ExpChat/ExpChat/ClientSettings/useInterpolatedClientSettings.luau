local Parent = script:FindFirstAncestor("ExpChat").Parent
local ReactModule = require(Parent.React)
local ParentModule = require(script.Parent)
local ClientSettingsUtilityModule = require(script.Parent.ClientSettingsUtility)
local FFlagExpChatAddressFrame0Flash = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(p1) --[[ Line: 11 ]]
	-- upvalues: ReactModule (copy), ParentModule (copy), FFlagExpChatAddressFrame0Flash (copy), ClientSettingsUtilityModule (copy)
	local UseContextResult = ReactModule.useContext(ParentModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		BackgroundColor3 = if FFlagExpChatAddressFrame0Flash then ClientSettingsUtilityModule.getBackgroundColor(p1, UseContextResult) else nil,
		BackgroundColor = if FFlagExpChatAddressFrame0Flash then nil else ClientSettingsUtilityModule.getBackgroundColor(p1, UseContextResult),
		BackgroundTransparency = ClientSettingsUtilityModule.getBackgroundTransparency(p1, UseContextResult)
	})
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: UseStateResult2 (copy), ClientSettingsUtilityModule (upval), p1 (copy), UseContextResult (copy)
		UseStateResult2({
			BackgroundColor3 = ClientSettingsUtilityModule.getBackgroundColor(p1, UseContextResult),
			BackgroundTransparency = ClientSettingsUtilityModule.getBackgroundTransparency(p1, UseContextResult)
		})
	end, { p1, UseContextResult })
	
	return UseStateResult
end
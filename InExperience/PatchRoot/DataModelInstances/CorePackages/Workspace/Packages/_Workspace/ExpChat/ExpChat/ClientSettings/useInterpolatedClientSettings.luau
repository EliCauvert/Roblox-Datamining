local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local parentModule = require(script.Parent)
local clientSettingsUtilityModule = require(script.Parent.ClientSettingsUtility)
local fFlagExpChatAddressFrame0Flash = require(parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(p0) --[[ line: 11 ]]
	-- upvalues: reactModule (ref), parentModule (ref), fFlagExpChatAddressFrame0Flash (ref), clientSettingsUtilityModule (ref)
	local var3 = reactModule.useContext(parentModule)
	local var4, var5 = reactModule.useState({
		BackgroundColor3 = if fFlagExpChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p0, var3) else nil,
		BackgroundColor = if not fFlagExpChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p0, var3) else nil,
		BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p0, var3)
	})
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var5 (ref), clientSettingsUtilityModule (copy), p0 (ref), var3 (ref)
		var5({
			BackgroundColor3 = clientSettingsUtilityModule.getBackgroundColor(p0, var3),
			BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p0, var3)
		})
	end, { p0, var3 })
	
	return var4
end
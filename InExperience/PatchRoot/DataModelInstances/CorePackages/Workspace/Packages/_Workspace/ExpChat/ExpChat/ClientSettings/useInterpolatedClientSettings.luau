local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local parentModule = require(script.Parent)
local clientSettingsUtilityModule = require(script.Parent.ClientSettingsUtility)
local expChatAddressFrame0Flash = game:DefineFastFlag("ExpChatAddressFrame0Flash", false)

return function(p0) --[[ line: 11 ]]
	-- upvalues: reactModule (ref), parentModule (ref), expChatAddressFrame0Flash (ref), clientSettingsUtilityModule (ref)
	local var4 = reactModule.useContext(parentModule)
	local var5, var6 = reactModule.useState({
		BackgroundColor3 = if expChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p0, var4) else nil,
		BackgroundColor = if not expChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p0, var4) else nil,
		BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p0, var4)
	})
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var6 (ref), clientSettingsUtilityModule (copy), p0 (ref), var4 (ref)
		var6({
			BackgroundColor3 = clientSettingsUtilityModule.getBackgroundColor(p0, var4),
			BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p0, var4)
		})
	end, { p0, var4 })
	
	return var5
end
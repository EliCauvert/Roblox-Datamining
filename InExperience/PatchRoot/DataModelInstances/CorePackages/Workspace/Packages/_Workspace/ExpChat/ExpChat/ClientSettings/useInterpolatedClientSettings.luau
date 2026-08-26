local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local parentModule = require(script.Parent)
local clientSettingsUtilityModule = require(script.Parent.ClientSettingsUtility)
local fFlagExpChatAddressFrame0Flash = require(parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(p1)
	-- upvalues: reactModule (ref), parentModule (ref), fFlagExpChatAddressFrame0Flash (ref), clientSettingsUtilityModule (ref)
	local var1 = reactModule.useContext(parentModule)
	local var2, var3 = reactModule.useState({
		BackgroundColor3 = if fFlagExpChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p1, var1) else nil,
		BackgroundColor = if not fFlagExpChatAddressFrame0Flash then clientSettingsUtilityModule.getBackgroundColor(p1, var1) else nil,
		BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p1, var1)
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), clientSettingsUtilityModule (copy), p1 (ref), var1 (ref)
		var3({
			BackgroundColor3 = clientSettingsUtilityModule.getBackgroundColor(p1, var1),
			BackgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(p1, var1)
		})
	end, { p1, var1 })
	
	return var2
end
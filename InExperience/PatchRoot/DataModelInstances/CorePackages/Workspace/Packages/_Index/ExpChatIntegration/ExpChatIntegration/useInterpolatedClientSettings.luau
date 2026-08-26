local parent = script:FindFirstAncestor("ExpChatIntegration").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.ChatPlatformContext)
local useChatPlatformModule = require(script.Parent.useChatPlatform)
local fFlagExpChatAddressFrame0Flash = require(parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(value)
	-- upvalues: useChatPlatformModule (ref), signalsReactModule (ref), reactModule (ref), fFlagExpChatAddressFrame0Flash (ref)
	local var1 = signalsReactModule.useSignalState(useChatPlatformModule().getInterpolators)
	local getBackgroundColor = var1.getBackgroundColor
	local getBackgroundTransparency = var1.getBackgroundTransparency
	local var2, var3 = reactModule.useState({
		BackgroundColor3 = if fFlagExpChatAddressFrame0Flash then getBackgroundColor(value) else nil,
		BackgroundColor = if not fFlagExpChatAddressFrame0Flash then getBackgroundColor(value) else nil,
		BackgroundTransparency = getBackgroundTransparency(value)
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), getBackgroundColor (ref), value (ref), getBackgroundTransparency (ref)
		var3({
			BackgroundColor3 = getBackgroundColor(value),
			BackgroundTransparency = getBackgroundTransparency(value)
		})
	end, { value, getBackgroundColor, getBackgroundTransparency })
	
	return var2
end
local parent = script:FindFirstAncestor("ExpChatIntegration").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.ChatPlatformContext)
local useChatPlatformModule = require(script.Parent.useChatPlatform)
local fFlagExpChatAddressFrame0Flash = require(parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(value) --[[ line: 14 | named "useInterpolatedClientSettings" ]]
	-- upvalues: useChatPlatformModule (ref), signalsReactModule (ref), reactModule (ref), fFlagExpChatAddressFrame0Flash (ref)
	local var3 = signalsReactModule.useSignalState(useChatPlatformModule().getInterpolators)
	local getBackgroundColor = var3.getBackgroundColor
	local getBackgroundTransparency = var3.getBackgroundTransparency
	local var4, var5 = reactModule.useState({
		BackgroundColor3 = if fFlagExpChatAddressFrame0Flash then getBackgroundColor(value) else nil,
		BackgroundColor = if not fFlagExpChatAddressFrame0Flash then getBackgroundColor(value) else nil,
		BackgroundTransparency = getBackgroundTransparency(value)
	})
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: var5 (ref), getBackgroundColor (ref), value (ref), getBackgroundTransparency (ref)
		var5({
			BackgroundColor3 = getBackgroundColor(value),
			BackgroundTransparency = getBackgroundTransparency(value)
		})
	end, { value, getBackgroundColor, getBackgroundTransparency })
	
	return var4
end
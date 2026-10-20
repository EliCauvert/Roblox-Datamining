local Parent = script:FindFirstAncestor("ExpChatIntegration").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.ChatPlatformContext)
local UseChatPlatformModule = require(script.Parent.useChatPlatform)
local FFlagExpChatAddressFrame0Flash = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatAddressFrame0Flash

return function(p1)
	-- upvalues: UseChatPlatformModule (copy), SignalsReactModule (copy), ReactModule (copy), FFlagExpChatAddressFrame0Flash (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseChatPlatformModule().getInterpolators)
	local GetBackgroundColorFunction = UseSignalStateResult.getBackgroundColor
	local GetBackgroundTransparencyFunction = UseSignalStateResult.getBackgroundTransparency
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		BackgroundColor3 = if FFlagExpChatAddressFrame0Flash then GetBackgroundColorFunction(p1) else nil,
		BackgroundColor = if FFlagExpChatAddressFrame0Flash then nil else GetBackgroundColorFunction(p1),
		BackgroundTransparency = GetBackgroundTransparencyFunction(p1)
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), GetBackgroundColorFunction (copy), p1 (copy), GetBackgroundTransparencyFunction (copy)
		UseStateResult2({
			BackgroundColor3 = GetBackgroundColorFunction(p1),
			BackgroundTransparency = GetBackgroundTransparencyFunction(p1)
		})
	end, {
		p1,
		GetBackgroundColorFunction,
		GetBackgroundTransparencyFunction
	})
	
	return UseStateResult
end
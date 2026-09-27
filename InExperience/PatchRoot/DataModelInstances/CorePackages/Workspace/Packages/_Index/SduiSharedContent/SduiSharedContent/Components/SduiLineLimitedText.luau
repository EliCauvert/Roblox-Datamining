local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local textSizeModule = require(parent.TextSize)
local getPreferredTextSizeLineBudget = require(parent.SduiSharedUtilities).getPreferredTextSizeLineBudget
local sduiTextModule = require(script.Parent.SduiText)
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), signalsReactModule (ref), textSizeModule (ref), getPreferredTextSizeLineBudget (ref), reactModule (ref), sduiTextModule (ref), cryoModule (ref)
	local var1 = useTokens()
	local var2 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2)
	end)
	local maxValue = math.max(p1.maxLines or 1, 1)
	local fontStyle = p1.fontStyle or var1.Typography.BodyMedium
	
	return reactModule.createElement(sduiTextModule, cryoModule.Dictionary.join(p1, {
		automaticSize = cryoModule.None,
		maxLines = cryoModule.None,
		size = UDim2.new(if p1.size then p1.size.X else UDim.new(1, 0), UDim.new(0, math.ceil(maxValue * fontStyle.FontSize * fontStyle.LineHeight + getPreferredTextSizeLineBudget(var2, maxValue)))),
		textWrapped = if p1.textWrapped ~= nil then maxValue > 1 else p1.textWrapped,
		textTruncate = if p1.textTruncate ~= nil then Enum.TextTruncate.SplitWord else p1.textTruncate
	}))
end
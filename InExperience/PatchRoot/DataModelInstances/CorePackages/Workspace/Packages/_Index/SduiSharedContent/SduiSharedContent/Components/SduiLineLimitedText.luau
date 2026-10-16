local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local TextSizeModule = require(Parent.TextSize)
local GetPreferredTextSizeLineBudgetFunction = require(Parent.SduiSharedUtilities).getPreferredTextSizeLineBudget
local SduiTextModule = require(script.Parent.SduiText)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1) --[[ Line: 21 | Named "SduiLineLimitedText" ]]
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), TextSizeModule (copy), GetPreferredTextSizeLineBudgetFunction (copy), ReactModule (copy), SduiTextModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Largest = math.max(p1.maxLines or 1, 1)
	local FontStyle = p1.fontStyle or UseTokensResult.Typography.BodyMedium
	
	return ReactModule.createElement(SduiTextModule, CryoModule.Dictionary.join(p1, {
		automaticSize = CryoModule.None,
		maxLines = CryoModule.None,
		size = UDim2.new(if p1.size then p1.size.X else UDim.new(1, 0), UDim.new(0, (math.ceil(Largest * FontStyle.FontSize * FontStyle.LineHeight + GetPreferredTextSizeLineBudgetFunction(SignalsReactModule.useSignalState(function(p2) --[[ Line: 23 ]]
			-- upvalues: TextSizeModule (upval)
			return TextSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2)
		end), Largest))))),
		textWrapped = if p1.textWrapped == nil then Largest > 1 else p1.textWrapped,
		textTruncate = if p1.textTruncate == nil then Enum.TextTruncate.SplitWord else p1.textTruncate
	}))
end
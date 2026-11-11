local Parent = script:FindFirstAncestor("AppDebug").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function _(Text: string): number
	local ByteValueRemainder = 0
	
	for i = 1, #Text do
		ByteValueRemainder = (ByteValueRemainder * 31 + string.byte(Text, i)) % 10000
	end
	return ByteValueRemainder
end

return function(Text)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), Text (copy)
		local Extended = UseTokensResult.Color.Extended
		local list = {
			Extended.Red.Red_600, Extended.Orange.Orange_600, Extended.Yellow.Yellow_400,
			Extended.Green.Green_500, Extended.Turquoise.Turquoise_500,
			Extended.Blue.Blue_600, Extended.Purple.Purple_600, Extended.Pink.Pink_600,
			Extended.Magenta.Magenta_600
		}
		local ByteValueRemainder = 0
		
		for i = 1, #Text do
			ByteValueRemainder = (ByteValueRemainder * 31 + string.byte(Text, i)) % 10000
		end
		return list[ByteValueRemainder % #list + 1]
	end, { UseTokensResult, Text }))
end
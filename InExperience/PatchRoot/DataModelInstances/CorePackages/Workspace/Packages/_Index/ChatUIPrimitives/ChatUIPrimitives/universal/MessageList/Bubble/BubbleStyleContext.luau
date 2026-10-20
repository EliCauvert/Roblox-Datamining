local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetBubbleToneModule = require(script.Parent.getBubbleTone)
local Context = ReactModule.createContext(nil)

local function useBubbleStyle() --[[ Line: 27 ]]
	-- upvalues: ReactModule (copy), Context (copy), FoundationModule (copy), GetBubbleToneModule (copy)
	local UseContextResult = ReactModule.useContext(Context)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 30 ]]
		-- upvalues: UseTokensResult (copy), GetBubbleToneModule (upval)
		return {
			textStyle = GetBubbleToneModule(false, UseTokensResult).textStyle,
			fontSize = UseTokensResult.Typography.BodyLarge.FontSize
		}
	end, { UseTokensResult })
	
	return if UseContextResult == nil then UseMemoResult else UseContextResult
end

return {
	Context = Context,
	createBubbleStyle = function(p1, p2) --[[ Line: 20 ]]
		-- upvalues: GetBubbleToneModule (copy)
		return {
			textStyle = GetBubbleToneModule(p1, p2).textStyle,
			fontSize = p2.Typography.BodyLarge.FontSize
		}
	end,
	useBubbleStyle = useBubbleStyle,
	useBubbleFontStyle = function() --[[ Line: 39 ]]
		-- upvalues: FoundationModule (copy), useBubbleStyle (copy), ReactModule (copy)
		local UseTokensResult = FoundationModule.Hooks.useTokens()
		local UseBubbleStyleResult = useBubbleStyle()
		
		return UseBubbleStyleResult, (ReactModule.useMemo(function() --[[ Line: 42 ]]
			-- upvalues: UseTokensResult (copy), UseBubbleStyleResult (copy)
			local BodyLarge = UseTokensResult.Typography.BodyLarge
			
			return {
				Font = BodyLarge.Font,
				FontSize = UseBubbleStyleResult.fontSize,
				LineHeight = BodyLarge.LineHeight
			}
		end, { UseTokensResult, UseBubbleStyleResult.fontSize }))
	end
}
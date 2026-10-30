local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SizingModule = require(script.Parent.Parent.Sizing)
local GetBubbleToneModule = require(script.Parent.getBubbleTone)
local Context = ReactModule.createContext(nil)

local function useBubbleStyle()
	-- upvalues: ReactModule (copy), Context (copy), FoundationModule (copy), GetBubbleToneModule (copy)
	local UseContextResult = ReactModule.useContext(Context)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), GetBubbleToneModule (upval)
		return {
			textStyle = GetBubbleToneModule(false, UseTokensResult).textStyle
		}
	end, { UseTokensResult })
	
	return if UseContextResult == nil then UseMemoResult else UseContextResult
end

return {
	Context = Context,
	createBubbleStyle = function(p1, p2)
		-- upvalues: GetBubbleToneModule (copy)
		return { textStyle = GetBubbleToneModule(p1, p2).textStyle }
	end,
	useBubbleStyle = useBubbleStyle,
	useBubbleFontStyle = function()
		-- upvalues: useBubbleStyle (copy), SizingModule (copy)
		return useBubbleStyle(), SizingModule.useSizing().bubble.fontStyle
	end
}
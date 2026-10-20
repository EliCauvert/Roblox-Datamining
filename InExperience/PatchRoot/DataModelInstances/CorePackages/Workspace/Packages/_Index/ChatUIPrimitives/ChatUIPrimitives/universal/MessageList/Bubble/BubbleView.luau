local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Types)
local GetBubblePaddingXFunction = require(script.Parent.useBubbleMaxWidth).getBubblePaddingX
local UseBubbleContentMaxWidthFunction = require(script.Parent.useBubbleMaxWidth).useBubbleContentMaxWidth
local IndexBindableFunction = FoundationModule.Utility.indexBindable

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: FoundationModule (copy), GetBubblePaddingXFunction (copy), UseBubbleContentMaxWidthFunction (copy), ReactModule (copy), IndexBindableFunction (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local BubblePaddingX = GetBubblePaddingXFunction(UseTokensResult)
	local Small = UseTokensResult.Padding.Small
	local Size1000 = UseTokensResult.Size.Size_1000
	local UseBubbleContentMaxWidthResult = UseBubbleContentMaxWidthFunction()
	local CornerRadii = Frame.cornerRadii
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col align-y-center auto-xy",
		backgroundStyle = Frame.backgroundStyle,
		cornerRadius = ReactModule.useMemo(function()
			-- upvalues: IndexBindableFunction (upval), CornerRadii (copy)
			return {
				topLeft = IndexBindableFunction(CornerRadii, "topLeft"),
				topRight = IndexBindableFunction(CornerRadii, "topRight"),
				bottomLeft = IndexBindableFunction(CornerRadii, "bottomLeft"),
				bottomRight = IndexBindableFunction(CornerRadii, "bottomRight")
			}
		end, { CornerRadii }),
		padding = ReactModule.useMemo(function()
			-- upvalues: Small (copy), BubblePaddingX (copy)
			return {
				top = UDim.new(0, Small),
				bottom = UDim.new(0, Small),
				left = UDim.new(0, BubblePaddingX),
				right = UDim.new(0, BubblePaddingX)
			}
		end, { BubblePaddingX, Small }),
		sizeConstraint = ReactModule.useMemo(function()
			-- upvalues: Size1000 (copy), Small (copy), UseBubbleContentMaxWidthResult (copy)
			return {
				MinSize = Vector2.new(0, Size1000 - Small * 2),
				MaxSize = Vector2.new(UseBubbleContentMaxWidthResult, 1e999)
			}
		end, { Size1000, Small, UseBubbleContentMaxWidthResult }),
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible,
		testId = Frame.testId,
		ref = Ref
	}, Frame.children)
end)
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Types)
local SizingModule = require(script.Parent.Parent.Sizing)
local IndexBindableFunction = FoundationModule.Utility.indexBindable

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: SizingModule (copy), ReactModule (copy), IndexBindableFunction (copy), FoundationModule (copy)
	local Bubble = SizingModule.useSizing().bubble
	local PaddingX = Bubble.paddingX
	local PaddingY = Bubble.paddingY
	local MinHeight = Bubble.minHeight
	local ContentMaxWidth = Bubble.contentMaxWidth
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
			-- upvalues: PaddingY (copy), PaddingX (copy)
			return {
				top = UDim.new(0, PaddingY),
				bottom = UDim.new(0, PaddingY),
				left = UDim.new(0, PaddingX),
				right = UDim.new(0, PaddingX)
			}
		end, { PaddingX, PaddingY }),
		sizeConstraint = ReactModule.useMemo(function()
			-- upvalues: MinHeight (copy), PaddingY (copy), ContentMaxWidth (copy)
			return {
				MinSize = Vector2.new(0, (math.max(0, MinHeight - PaddingY * 2))),
				MaxSize = Vector2.new(ContentMaxWidth, 1e999)
			}
		end, { MinHeight, PaddingY, ContentMaxWidth }),
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible,
		testId = Frame.testId,
		ref = Ref
	}, Frame.children)
end)
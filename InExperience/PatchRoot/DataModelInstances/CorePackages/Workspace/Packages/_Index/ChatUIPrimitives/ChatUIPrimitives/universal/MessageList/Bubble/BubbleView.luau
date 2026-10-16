local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Types)
local IndexBindableFunction = FoundationModule.Utility.indexBindable

return ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 24 | Named "BubbleView" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), IndexBindableFunction (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Medium = UseTokensResult.Padding.Medium
	local Small = UseTokensResult.Padding.Small
	local Size1000 = UseTokensResult.Size.Size_1000
	local CornerRadii = Frame.cornerRadii
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col align-y-center auto-xy",
		backgroundStyle = Frame.accentColor,
		cornerRadius = ReactModule.useMemo(function() --[[ Line: 31 ]]
			-- upvalues: IndexBindableFunction (upval), CornerRadii (copy)
			return {
				topLeft = IndexBindableFunction(CornerRadii, "topLeft"),
				topRight = IndexBindableFunction(CornerRadii, "topRight"),
				bottomLeft = IndexBindableFunction(CornerRadii, "bottomLeft"),
				bottomRight = IndexBindableFunction(CornerRadii, "bottomRight")
			}
		end, { CornerRadii }),
		padding = ReactModule.useMemo(function() --[[ Line: 40 ]]
			-- upvalues: Small (copy), Medium (copy)
			return {
				top = UDim.new(0, Small),
				bottom = UDim.new(0, Small),
				left = UDim.new(0, Medium),
				right = UDim.new(0, Medium)
			}
		end, { Medium, Small }),
		sizeConstraint = ReactModule.useMemo(function() --[[ Line: 50 ]]
			-- upvalues: Size1000 (copy), Small (copy)
			return {
				MaxSize = nil,
				MinSize = Vector2.new(0, Size1000 - Small * 2)
			}
		end, { Size1000, Small }),
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible,
		testId = Frame.testId,
		ref = Ref
	}, Frame.children)
end)
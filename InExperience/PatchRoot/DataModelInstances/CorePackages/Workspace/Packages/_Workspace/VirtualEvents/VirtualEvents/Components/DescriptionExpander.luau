local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local text = require(virtualEvents.Parent.AppCommonLib).Text
local useAnimationModule = require(virtualEvents.Hooks.useAnimation)
local text_1 = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 22 | named "DescriptionExpander" ]]
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), useAnimationModule (ref), text_1 (ref)
	local var4 = useTokens()
	local bodyLarge = var4.Typography.BodyLarge
	local var5, var6 = reactModule.useState(0)
	
	local function _(p1, p2) --[[ line: 27 | named "updateDescriptionHeight" ]]
		-- upvalues: text (copy), bodyLarge (ref), var6 (ref)
		var6(text.GetTextHeight(p2, bodyLarge.Font, bodyLarge.FontSize, p1))
	end
	
	local var7 = reactModule.useCallback(function(p3) --[[ line: 32 ]]
		-- upvalues: p0 (ref), text (copy), bodyLarge (ref), var6 (ref)
		var6(text.GetTextHeight(p0.description, bodyLarge.Font, bodyLarge.FontSize, p3.AbsoluteSize.X))
	end, { p0.description })
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref), text (copy), bodyLarge (ref), var6 (ref)
		var6(text.GetTextHeight(p0.description, bodyLarge.Font, bodyLarge.FontSize, p0.width))
	end, { p0.description, p0.width })
	local var8 = p0.isExpanded and math.min(var5, p0.maxHeight) or math.min(var5, 40)
	local var9, var10 = reactModule.useState(var8)
	useAnimationModule({
		duration = 0.1,
		easingStyle = "quadratic",
		startOffset = var9,
		endOffset = var8,
		setAnimationOffset = var10
	})
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var9),
		[reactModule.Change.AbsoluteSize] = function(p4) --[[ line: 115 ]]
			-- upvalues: var7 (ref)
			var7(p4)
		end
	}, {
		Description = if p0.isExpanded then reactModule.createElement("ScrollingFrame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Size = UDim2.new(1, 0, 0, var8),
			CanvasSize = UDim2.new(0, 0, 0, var5 + 2),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = p0.maxHeight + 10 < var5
		}, {
			Text = reactModule.createElement(text_1, {
				RichText = true,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p0.description,
				TextTruncate = Enum.TextTruncate.None,
				textStyle = var4.Color.Content.Emphasis,
				fontStyle = {
					LineHeight = 1,
					Font = bodyLarge.Font,
					FontSize = bodyLarge.FontSize
				},
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}) else reactModule.createElement("TextButton", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var8),
			Position = UDim2.fromScale(0, 0),
			Text = "",
			Active = var5 > 50,
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.None,
			[reactModule.Event.Activated] = function() --[[ line: 89 ]]
				-- upvalues: p0 (ref)
				p0.setIsExpanded(true)
			end
		}, {
			Text = reactModule.createElement(text_1, {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p0.description,
				TextTruncate = Enum.TextTruncate.AtEnd,
				textStyle = var4.Color.Content.Emphasis,
				fontStyle = {
					LineHeight = 1,
					Font = bodyLarge.Font,
					FontSize = bodyLarge.FontSize
				},
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end
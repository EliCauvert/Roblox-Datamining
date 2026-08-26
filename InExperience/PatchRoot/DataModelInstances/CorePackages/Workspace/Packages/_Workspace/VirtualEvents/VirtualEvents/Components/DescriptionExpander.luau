local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local text = require(virtualEvents.Parent.AppCommonLib).Text
local useAnimationModule = require(virtualEvents.Hooks.useAnimation)
local text_1 = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), useAnimationModule (ref), text_1 (ref)
	local var1 = useTokens()
	local bodyLarge = var1.Typography.BodyLarge
	local var2, var3 = reactModule.useState(0)
	
	local function _(p2, p3)
		-- upvalues: text (copy), bodyLarge (ref), var3 (ref)
		var3(text.GetTextHeight(p3, bodyLarge.Font, bodyLarge.FontSize, p2))
	end
	
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), text (copy), bodyLarge (ref), var3 (ref)
		var3(text.GetTextHeight(p1.description, bodyLarge.Font, bodyLarge.FontSize, p2.AbsoluteSize.X))
	end, { p1.description })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), text (copy), bodyLarge (ref), var3 (ref)
		var3(text.GetTextHeight(p1.description, bodyLarge.Font, bodyLarge.FontSize, p1.width))
	end, { p1.description, p1.width })
	local var5 = p1.isExpanded and math.min(var2, p1.maxHeight) or math.min(var2, 40)
	local var6, var7 = reactModule.useState(var5)
	useAnimationModule({
		duration = 0.1,
		easingStyle = "quadratic",
		startOffset = var6,
		endOffset = var5,
		setAnimationOffset = var7
	})
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var6),
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var4 (ref)
			var4(p2)
		end
	}, {
		Description = if p1.isExpanded then reactModule.createElement("ScrollingFrame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Size = UDim2.new(1, 0, 0, var5),
			CanvasSize = UDim2.new(0, 0, 0, var2 + 2),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = p1.maxHeight + 10 < var2
		}, {
			Text = reactModule.createElement(text_1, {
				RichText = true,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.description,
				TextTruncate = Enum.TextTruncate.None,
				textStyle = var1.Color.Content.Emphasis,
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
			Size = UDim2.new(1, 0, 0, var5),
			Position = UDim2.fromScale(0, 0),
			Text = "",
			Active = var2 > 50,
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.None,
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				p1.setIsExpanded(true)
			end
		}, {
			Text = reactModule.createElement(text_1, {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.description,
				TextTruncate = Enum.TextTruncate.AtEnd,
				textStyle = var1.Color.Content.Emphasis,
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
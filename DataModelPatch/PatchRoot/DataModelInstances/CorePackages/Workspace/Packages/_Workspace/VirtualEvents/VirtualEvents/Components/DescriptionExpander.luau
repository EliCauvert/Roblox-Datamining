local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local Text = require(VirtualEvents.Parent.AppCommonLib).Text
local UseAnimationModule = require(VirtualEvents.Hooks.useAnimation)
local Text1 = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy), UseAnimationModule (copy), Text1 (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyLarge = UseTokensResult.Typography.BodyLarge
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	local function _(p2, p3)
		-- upvalues: Text (upval), BodyLarge (copy), UseStateResult2 (copy)
		UseStateResult2((Text.GetTextHeight(p3, BodyLarge.Font, BodyLarge.FontSize, p2)))
	end
	
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: p1 (copy), Text (upval), BodyLarge (copy), UseStateResult2 (copy)
		UseStateResult2((Text.GetTextHeight(p1.description, BodyLarge.Font, BodyLarge.FontSize, Frame.AbsoluteSize.X)))
	end, { p1.description })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Text (upval), BodyLarge (copy), UseStateResult2 (copy)
		UseStateResult2((Text.GetTextHeight(p1.description, BodyLarge.Font, BodyLarge.FontSize, p1.width)))
	end, { p1.description, p1.width })
	local Smallest: number = p1.isExpanded and math.min(UseStateResult, p1.maxHeight) or math.min(UseStateResult, 40)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Smallest)
	UseAnimationModule({
		duration = 0.1,
		easingStyle = "quadratic",
		startOffset = UseStateResult1,
		endOffset = Smallest,
		setAnimationOffset = UseStateResult2_1
	})
	local ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
		ZIndex = 2,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		Size = UDim2.new(1, 0, 0, Smallest),
		CanvasSize = UDim2.new(0, 0, 0, UseStateResult + 2),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollingEnabled = p1.maxHeight + 10 < UseStateResult
	}, {
		Text = ReactModule.createElement(Text1, {
			RichText = true,
			TextWrapped = true,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.description,
			TextTruncate = Enum.TextTruncate.None,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			fontStyle = {
				LineHeight = 1,
				Font = BodyLarge.Font,
				FontSize = BodyLarge.FontSize
			},
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	local TextButton = ReactModule.createElement("TextButton", {
		ZIndex = 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Smallest),
		Position = UDim2.fromScale(0, 0),
		Text = "",
		Active = UseStateResult > 50,
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.None,
		[ReactModule.Event.Activated] = function()
			-- upvalues: p1 (copy)
			p1.setIsExpanded(true)
		end
	}, {
		Text = ReactModule.createElement(Text1, {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.description,
			TextTruncate = Enum.TextTruncate.AtEnd,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			fontStyle = {
				LineHeight = 1,
				Font = BodyLarge.Font,
				FontSize = BodyLarge.FontSize
			},
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, UseStateResult1),
		[ReactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: UseResult (copy)
			UseResult(p2)
		end
	}, {
		Description = if p1.isExpanded then ScrollingFrame else TextButton
	})
end
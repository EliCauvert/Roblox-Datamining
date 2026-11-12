local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.ChatBubbleContainerAutomaticSize)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local NormalizeFontFaceFunction = DependenciesModule.Foundation.Utility.normalizeFontFace
local UseTextBoundsModule = require(SocialLibraries.Utils.useTextBounds)
game:DefineFastFlag("FixPlainTextAutomaticSizeClippingText", false)
local FixPlainTextAutomaticSizeClippingTextFastFlag = game:GetFastFlag("FixPlainTextAutomaticSizeClippingText")
local Frame = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	[Roact.Change.AbsoluteSize] = function() end
}

local function TextContent(p1)
	-- upvalues: UseTextBoundsModule (copy), Roact (copy), NormalizeFontFaceFunction (copy), FixPlainTextAutomaticSizeClippingTextFastFlag (copy)
	local UseTextBoundsModuleResult = UseTextBoundsModule(p1.text, p1.font, p1.textSize, p1.contentMaxWidth) or Vector2.new(0, p1.textSize)
	
	return Roact.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = p1.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = p1.textColor3,
		AutomaticSize = Enum.AutomaticSize.XY,
		FontFace = NormalizeFontFaceFunction(p1.font),
		TextSize = p1.textSize,
		Size = FixPlainTextAutomaticSizeClippingTextFastFlag and UDim2.fromOffset(math.ceil(UseTextBoundsModuleResult.X), (math.ceil(UseTextBoundsModuleResult.Y))) or UDim2.new(0, UseTextBoundsModuleResult.X, 0, UseTextBoundsModuleResult.Y),
		TextTransparency = p1.textTransparency,
		TextYAlignment = Enum.TextYAlignment.Top
	}, {
		SizeConstraint = Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.contentMaxWidth, 1e999) })
	})
end

return function(Frame1: Frame)
	-- upvalues: WithStyleFunction (copy), Frame (copy), Roact (copy), ChatBubbleContainerAutomaticSizeModule (copy), TextContent (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: Frame1 (copy), Frame (upval), Roact (upval), ChatBubbleContainerAutomaticSizeModule (upval), TextContent (upval)
		local InnerPadding = Frame1.innerPadding or Frame.innerPadding
		local Body = p1.Font.Body
		
		return Roact.createElement(ChatBubbleContainerAutomaticSizeModule, {
			isIncoming = Frame1.isIncoming or Frame.isIncoming,
			hasTail = Frame1.hasTail or Frame.hasTail,
			isPending = Frame1.isPending or Frame.isPending,
			padding = InnerPadding,
			LayoutOrder = Frame1.LayoutOrder or Frame.LayoutOrder,
			[Roact.Change.AbsoluteSize] = Frame1[Roact.Change.AbsoluteSize] or Frame[Roact.Change.AbsoluteSize]
		}, {
			textContent = Roact.createElement(TextContent, {
				text = Frame1.text or Frame.text,
				font = Frame1.font or Body.Font,
				textSize = Frame1.textSize or p1.Font.BaseSize * Body.RelativeSize,
				contentMaxWidth = math.max(0, (Frame1.maxWidth or Frame.maxWidth) - InnerPadding),
				textColor3 = p1.Theme.TextEmphasis.Color,
				textTransparency = Frame1.isPending and p1.Theme.TextMuted.Transparency or 0
			})
		})
	end)
end
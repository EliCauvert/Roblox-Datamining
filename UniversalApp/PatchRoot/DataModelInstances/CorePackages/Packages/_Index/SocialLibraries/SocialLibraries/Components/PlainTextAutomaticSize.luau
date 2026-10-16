local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.ChatBubbleContainerAutomaticSize)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local TextService = game:GetService("TextService")
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
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
	[Roact.Change.AbsoluteSize] = function() --[[ Line: 23 ]] end
}

local function TextContent(p1) --[[ Line: 35 ]]
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

return function(Frame1: Frame) --[[ Line: 60 | Named "PlainText" ]]
	-- upvalues: WithStyleFunction (copy), Frame (copy), FoundationFontFaceMigration (copy), TextService (copy), Roact (copy), ChatBubbleContainerAutomaticSizeModule (copy), TextContent (copy), FixPlainTextAutomaticSizeClippingTextFastFlag (copy)
	return WithStyleFunction(function(p1) --[[ Line: 61 ]]
		-- upvalues: Frame1 (copy), Frame (upval), FoundationFontFaceMigration (upval), TextService (upval), Roact (upval), ChatBubbleContainerAutomaticSizeModule (upval), TextContent (upval), FixPlainTextAutomaticSizeClippingTextFastFlag (upval)
		local MaxWidth = Frame1.maxWidth or Frame.maxWidth
		local InnerPadding = Frame1.innerPadding or Frame.innerPadding
		local Largest = math.max(0, MaxWidth - InnerPadding)
		local Body = p1.Font.Body
		local TextSize = Frame1.textSize or p1.Font.BaseSize * Body.RelativeSize
		local Text = Frame1.text or Frame.text
		local _Font = Frame1.font or Body.Font
		local _Vector2 = Vector2.new(Largest, 1e999)
		local TextSize1 = if FoundationFontFaceMigration then nil else TextService:GetTextSize(Text, TextSize, _Font, _Vector2)
		
		return Roact.createElement(ChatBubbleContainerAutomaticSizeModule, {
			isIncoming = Frame1.isIncoming or Frame.isIncoming,
			hasTail = Frame1.hasTail or Frame.hasTail,
			isPending = Frame1.isPending or Frame.isPending,
			padding = InnerPadding,
			LayoutOrder = Frame1.LayoutOrder or Frame.LayoutOrder,
			[Roact.Change.AbsoluteSize] = Frame1[Roact.Change.AbsoluteSize] or Frame[Roact.Change.AbsoluteSize]
		}, {
			textContent = if FoundationFontFaceMigration then Roact.createElement(TextContent, {
				text = Text,
				font = _Font,
				textSize = TextSize,
				contentMaxWidth = Largest,
				textColor3 = p1.Theme.TextEmphasis.Color,
				textTransparency = Frame1.isPending and p1.Theme.TextMuted.Transparency or 0
			}) else Roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = _Font,
				TextSize = TextSize,
				Size = FixPlainTextAutomaticSizeClippingTextFastFlag and UDim2.fromOffset(math.ceil(TextSize1.X), (math.ceil(TextSize1.Y))) or UDim2.new(0, TextSize1.X, 0, TextSize1.Y),
				TextTransparency = Frame1.isPending and p1.Theme.TextMuted.Transparency or 0,
				TextYAlignment = Enum.TextYAlignment.Top
			}, {
				SizeConstraint = Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(Largest or MaxWidth, 1e999) })
			})
		})
	end)
end
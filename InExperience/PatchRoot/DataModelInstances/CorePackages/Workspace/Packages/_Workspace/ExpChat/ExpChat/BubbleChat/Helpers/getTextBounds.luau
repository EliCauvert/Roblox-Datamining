local coreGuiService = game:GetService("CoreGui")
local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local textService = game:GetService("TextService")
local getAbsolutePaddingbyDimensionModule = require(expChat.BubbleChat.Helpers.getAbsolutePaddingbyDimension)
local getFFlagExpChatAlwaysRunTCS = require(expChat.Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS

local var1 = function(p1, p2)
	-- upvalues: coreGuiService (ref), getAbsolutePaddingbyDimensionModule (ref)
	local richTextSizingLabel = Instance.new("ScreenGui")
	richTextSizingLabel.Enabled = false
	richTextSizingLabel.Name = "RichTextSizingLabel"
	richTextSizingLabel.Parent = coreGuiService
	local textLabel = Instance.new("TextLabel")
	textLabel.TextWrapped = true
	textLabel.RichText = true
	textLabel.Parent = richTextSizingLabel
	textLabel.Text = p1
	textLabel.TextSize = p2.TextSize
	
	if p2.FontFace then
		textLabel.FontFace = p2.FontFace
	else
		textLabel.Font = p2.Font
	end
	local vector2
	textLabel.Size = UDim2.fromOffset(p2.MaxWidth, 10000)
	local textBounds = textLabel.TextBounds
	richTextSizingLabel:Destroy()
	local _ = nil
	
	if p2.UIPadding then
		vector2 = Vector2.new((getAbsolutePaddingbyDimensionModule(p2.UIPadding.PaddingLeft, textBounds.X) + getAbsolutePaddingbyDimensionModule(p2.UIPadding.PaddingRight, textBounds.X)) * 2, getAbsolutePaddingbyDimensionModule(p2.UIPadding.PaddingTop, textBounds.Y) + getAbsolutePaddingbyDimensionModule(p2.UIPadding.PaddingBottom, textBounds.Y))
	else
		local padding = p2.Padding
		vector2 = Vector2.new(padding * 4, padding * 2)
	end
	return vector2 + textBounds
end

return function(p1, p2, p3)
	-- upvalues: textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), var1 (ref), textService (ref)
	if p3 == nil then
		p3 = textChatService
	end
	return if getFFlagExpChatAlwaysRunTCS() or p3.ChatVersion == Enum.ChatVersion.TextChatService then var1(p1, p2) else textService:GetTextSize(p1, p2.TextSize, p2.Font, Vector2.new(p2.MaxWidth, 10000)) + Vector2.new(p2.Padding * 4, p2.Padding * 2)
end
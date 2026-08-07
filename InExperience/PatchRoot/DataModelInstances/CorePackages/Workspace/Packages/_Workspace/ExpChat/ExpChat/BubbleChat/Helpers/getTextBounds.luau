local coreGuiService = game:GetService("CoreGui")
local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local textService = game:GetService("TextService")
local getAbsolutePaddingbyDimensionModule = require(expChat.BubbleChat.Helpers.getAbsolutePaddingbyDimension)
local getFFlagExpChatAlwaysRunTCS = require(expChat.Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS

local var5 = function(p0, p1) --[[ line: 9 ]]
	-- upvalues: coreGuiService (ref), getAbsolutePaddingbyDimensionModule (ref)
	local richTextSizingLabel = Instance.new("ScreenGui")
	richTextSizingLabel.Enabled = false
	richTextSizingLabel.Name = "RichTextSizingLabel"
	richTextSizingLabel.Parent = coreGuiService
	local textLabel = Instance.new("TextLabel")
	textLabel.TextWrapped = true
	textLabel.RichText = true
	textLabel.Parent = richTextSizingLabel
	textLabel.Text = p0
	textLabel.TextSize = p1.TextSize
	
	if p1.FontFace then
		textLabel.FontFace = p1.FontFace
	else
		textLabel.Font = p1.Font
	end
	local vector2
	textLabel.Size = UDim2.fromOffset(p1.MaxWidth, 10000)
	local textBounds = textLabel.TextBounds
	richTextSizingLabel:Destroy()
	local _ = nil
	
	if p1.UIPadding then
		vector2 = Vector2.new((getAbsolutePaddingbyDimensionModule(p1.UIPadding.PaddingLeft, textBounds.X) + getAbsolutePaddingbyDimensionModule(p1.UIPadding.PaddingRight, textBounds.X)) * 2, getAbsolutePaddingbyDimensionModule(p1.UIPadding.PaddingTop, textBounds.Y) + getAbsolutePaddingbyDimensionModule(p1.UIPadding.PaddingBottom, textBounds.Y))
	else
		local padding = p1.Padding
		vector2 = Vector2.new(padding * 4, padding * 2)
	end
	return vector2 + textBounds
end

return function(p2, p3, p4) --[[ line: 51 ]]
	-- upvalues: textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), var5 (ref), textService (ref)
	if p4 == nil then
		p4 = textChatService
	end
	return if getFFlagExpChatAlwaysRunTCS() or p4.ChatVersion == Enum.ChatVersion.TextChatService then var5(p2, p3) else textService:GetTextSize(p2, p3.TextSize, p3.Font, Vector2.new(p3.MaxWidth, 10000)) + Vector2.new(p3.Padding * 4, p3.Padding * 2)
end
local CoreGui = game:GetService("CoreGui")
local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local TextService = game:GetService("TextService")
local GetAbsolutePaddingbyDimensionModule = require(ExpChat.BubbleChat.Helpers.getAbsolutePaddingbyDimension)
local GetFFlagExpChatAlwaysRunTCSFunction = require(ExpChat.Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS

local function v5(Text, Label): Vector2 --[[ Line: 9 ]]
	-- upvalues: CoreGui (copy), GetAbsolutePaddingbyDimensionModule (copy)
	local RichTextSizingLabel = Instance.new("ScreenGui")
	RichTextSizingLabel.Enabled = false
	RichTextSizingLabel.Name = "RichTextSizingLabel"
	RichTextSizingLabel.Parent = CoreGui
	local Label1 = Instance.new("TextLabel")
	Label1.TextWrapped = true
	Label1.RichText = true
	Label1.Parent = RichTextSizingLabel
	Label1.Text = Text
	Label1.TextSize = Label.TextSize
	
	if Label.FontFace then
		Label1.FontFace = Label.FontFace
	else
		Label1.Font = Label.Font
	end
	Label1.Size = UDim2.fromOffset(Label.MaxWidth, 10000)
	local TextBounds = Label1.TextBounds
	RichTextSizingLabel:Destroy()
	local _Vector2 = nil
	
	if Label.UIPadding then
		_Vector2 = Vector2.new((GetAbsolutePaddingbyDimensionModule(Label.UIPadding.PaddingLeft, TextBounds.X) + GetAbsolutePaddingbyDimensionModule(Label.UIPadding.PaddingRight, TextBounds.X)) * 2, GetAbsolutePaddingbyDimensionModule(Label.UIPadding.PaddingTop, TextBounds.Y) + GetAbsolutePaddingbyDimensionModule(Label.UIPadding.PaddingBottom, TextBounds.Y))
	else
		local Padding: number = Label.Padding
		_Vector2 = Vector2.new(Padding * 4, Padding * 2)
	end
	return _Vector2 + TextBounds
end

return function(String, Label, TextChatService1) --[[ Line: 51 ]]
	-- upvalues: TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy), v5 (copy), TextService (copy)
	if TextChatService1 == nil then
		TextChatService1 = TextChatService
	end
	return if GetFFlagExpChatAlwaysRunTCSFunction() or TextChatService1.ChatVersion == Enum.ChatVersion.TextChatService then v5(String, Label) else TextService:GetTextSize(String, Label.TextSize, Label.Font, Vector2.new(Label.MaxWidth, 10000)) + Vector2.new(Label.Padding * 4, Label.Padding * 2)
end
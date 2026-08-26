local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local text = require(parent.AppCommonLib).Text
local memo = reactModule.memo
local useMemo = reactModule.useMemo
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local linkButton = UIBloxModule.App.Button.LinkButton
local useTokens = require(parent.Foundation).Hooks.useTokens
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local t = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	height = 40,
	onActivated = function() end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useChatPagePaddingModule (ref), useMemo (ref), text (ref), reactModule (ref), linkButton (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local style = var1.style or useStyle()
	local var2 = useTokens()
	local var3 = useIsInExperienceModule()
	local size400 = style.Tokens.Size.Size_400
	local font = style.Font.CaptionBody.Font
	local var4 = style.Font.CaptionBody.RelativeSize * style.Font.BaseSize
	local var5 = useChatPagePaddingModule()
	local var6 = useMemo(function()
		-- upvalues: text (copy), var1 (ref), font (ref), var4 (ref)
		return text.GetTextBounds(var1.actionText, font, var4 + 2, Vector2.new(250, var1.height)).X
	end, { var1.actionText, font, var4, var1.height })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = if var3 then var2.Color.OverMedia.OverMedia_100.Color3 else style.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if var3 then var2.Color.OverMedia.OverMedia_100.Transparency else style.Theme.BackgroundUIDefault.Transparency,
		Size = UDim2.new(1, 0, 0, var1.height)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, size400),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var5.left),
			PaddingRight = UDim.new(0, var5.right)
		}),
		BodyText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Font = font,
			Size = UDim2.new(1, (-var6) - size400, 1, 0),
			Text = var1.bodyText,
			TextColor3 = style.Theme.TextEmphasis.Color,
			TextSize = var4,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ActionText = reactModule.createElement(linkButton, {
			fontStyle = "CaptionBody",
			layoutOrder = 2,
			size = UDim2.new(0, var6, 1, 0),
			text = `<b>{var1.actionText}</b>`,
			onActivated = var1.onActivated
		})
	})
end)
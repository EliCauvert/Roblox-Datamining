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
	onActivated = function() --[[ line: 36 ]] end
}

return memo(function(p0) --[[ line: 39 | named "ConversationBanner" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useChatPagePaddingModule (ref), useMemo (ref), text (ref), reactModule (ref), linkButton (ref)
	local var7 = cryoModule.Dictionary.union(t, p0)
	local style = var7.style or useStyle()
	local var9 = useTokens()
	local var10 = useIsInExperienceModule()
	local size400 = style.Tokens.Size.Size_400
	local font = style.Font.CaptionBody.Font
	local var11 = style.Font.CaptionBody.RelativeSize * style.Font.BaseSize
	local var12 = useChatPagePaddingModule()
	local var13 = useMemo(function() --[[ line: 51 ]]
		-- upvalues: text (copy), var7 (ref), font (ref), var11 (ref)
		return text.GetTextBounds(var7.actionText, font, var11 + 2, Vector2.new(250, var7.height)).X
	end, { var7.actionText, font, var11, var7.height })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = if var10 then var9.Color.OverMedia.OverMedia_100.Color3 else style.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if var10 then var9.Color.OverMedia.OverMedia_100.Transparency else style.Theme.BackgroundUIDefault.Transparency,
		Size = UDim2.new(1, 0, 0, var7.height)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, size400),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var12.left),
			PaddingRight = UDim.new(0, var12.right)
		}),
		BodyText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Font = font,
			Size = UDim2.new(1, (-var13) - size400, 1, 0),
			Text = var7.bodyText,
			TextColor3 = style.Theme.TextEmphasis.Color,
			TextSize = var11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ActionText = reactModule.createElement(linkButton, {
			fontStyle = "CaptionBody",
			layoutOrder = 2,
			size = UDim2.new(0, var13, 1, 0),
			text = `<b>{var7.actionText}</b>`,
			onActivated = var7.onActivated
		})
	})
end)
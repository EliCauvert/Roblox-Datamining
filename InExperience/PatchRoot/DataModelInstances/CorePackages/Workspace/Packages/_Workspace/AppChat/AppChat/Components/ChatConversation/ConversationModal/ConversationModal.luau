local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local enum = UIBloxModule.App.Button.Enum
local useTokens = require(parent.Foundation).Hooks.useTokens
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local t = {
	bodyText = "Placeholder body",
	onAccepted = nil,
	onDenied = nil,
	onHeightChanged = function(_) end
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useChatPagePaddingModule (ref), useEffect (ref), useMemo (ref), enum (ref), reactModule (ref), buttonStack (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local var2 = useTokens()
	local var3 = useIsInExperienceModule()
	local size1000 = style.Tokens.Size.Size_1000
	local size500 = style.Tokens.Size.Size_500
	local var4 = useChatPagePaddingModule()
	useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.onHeightChanged(0)
		end
	end, {})
	local var5 = useMemo(function()
		-- upvalues: var1 (ref), enum (copy)
		local t = {}
		
		if var1.denyText then
			table.insert(t, {
				buttonType = enum.ButtonType.Secondary,
				props = {
					onActivated = var1.onDenied,
					text = var1.denyText,
					isDisabled = var1.loading
				}
			})
		end
		if var1.acceptText then
			table.insert(t, {
				buttonType = enum.ButtonType.PrimarySystem,
				props = {
					onActivated = var1.onAccepted,
					text = var1.acceptText,
					isDisabled = var1.loading
				}
			})
		end
		return t
	end, {
		var1.acceptText,
		var1.denyText,
		var1.loading,
		var1.onDenied,
		var1.onAccepted
	})
	
	return reactModule.createElement("Frame", {
		Name = "ConversationModal",
		BackgroundTransparency = if var3 then var2.Color.OverMedia.OverMedia_100.Transparency else style.Theme.SystemPrimaryContent.Transparency,
		BackgroundColor3 = if var3 then var2.Color.OverMedia.OverMedia_100.Color3 else style.Theme.SystemPrimaryContent.Color,
		BorderSizePixel = 0,
		LayoutOrder = var1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var1 (ref)
			var1.onHeightChanged(p2.AbsoluteSize.Y)
		end
	}, {
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if var1.paddingTop ~= nil then size500 else var1.paddingTop),
			PaddingBottom = UDim.new(0, if var1.paddingBottom ~= nil then size500 else var1.paddingBottom),
			PaddingLeft = UDim.new(0, var4.left),
			PaddingRight = UDim.new(0, var4.right)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, if var1.verticalSpacing ~= nil then size500 else var1.verticalSpacing),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		Body = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextWrapped = true,
			TextSize = style.Tokens.FontSize.FontSize_300,
			Font = style.Font.Body.Font,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var1.bodyText,
			TextColor3 = style.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Buttons = if #var5 > 0 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, size1000)
		}, {
			ButtonStack = reactModule.createElement(buttonStack, {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = var5
			})
		}) else nil
	})
end
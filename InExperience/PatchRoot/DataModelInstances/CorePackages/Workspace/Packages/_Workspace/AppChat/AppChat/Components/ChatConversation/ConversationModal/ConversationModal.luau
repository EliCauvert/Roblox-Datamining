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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useChatPagePaddingModule (ref), useEffect (ref), useMemo (ref), enum (ref), reactModule (ref), buttonStack (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local style = var7.style or useStyle()
	local var9 = useTokens()
	local var10 = useIsInExperienceModule()
	local size1000 = style.Tokens.Size.Size_1000
	local size500 = style.Tokens.Size.Size_500
	local var11 = useChatPagePaddingModule()
	useEffect(function()
		-- upvalues: var7 (ref)
		return function()
			-- upvalues: var7 (copy)
			var7.onHeightChanged(0)
		end
	end, {})
	local var12 = useMemo(function()
		-- upvalues: var7 (ref), enum (copy)
		local t = {}
		
		if var7.denyText then
			table.insert(t, {
				buttonType = enum.ButtonType.Secondary,
				props = {
					onActivated = var7.onDenied,
					text = var7.denyText,
					isDisabled = var7.loading
				}
			})
		end
		if var7.acceptText then
			table.insert(t, {
				buttonType = enum.ButtonType.PrimarySystem,
				props = {
					onActivated = var7.onAccepted,
					text = var7.acceptText,
					isDisabled = var7.loading
				}
			})
		end
		return t
	end, {
		var7.acceptText,
		var7.denyText,
		var7.loading,
		var7.onDenied,
		var7.onAccepted
	})
	
	return reactModule.createElement("Frame", {
		Name = "ConversationModal",
		BackgroundTransparency = if var10 then var9.Color.OverMedia.OverMedia_100.Transparency else style.Theme.SystemPrimaryContent.Transparency,
		BackgroundColor3 = if var10 then var9.Color.OverMedia.OverMedia_100.Color3 else style.Theme.SystemPrimaryContent.Color,
		BorderSizePixel = 0,
		LayoutOrder = var7.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var7 (ref)
			var7.onHeightChanged(p1.AbsoluteSize.Y)
		end
	}, {
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if var7.paddingTop ~= nil then size500 else var7.paddingTop),
			PaddingBottom = UDim.new(0, if var7.paddingBottom ~= nil then size500 else var7.paddingBottom),
			PaddingLeft = UDim.new(0, var11.left),
			PaddingRight = UDim.new(0, var11.right)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, if var7.verticalSpacing ~= nil then size500 else var7.verticalSpacing),
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
			Text = var7.bodyText,
			TextColor3 = style.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Buttons = if #var12 > 0 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, size1000)
		}, {
			ButtonStack = reactModule.createElement(buttonStack, {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = var12
			})
		}) else nil
	})
end
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonEnum = UIBloxModule.App.Button.Enum
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local config = {
	bodyText = "Placeholder body",
	onAccepted = nil,
	onDenied = nil,
	onHeightChanged = function(_) end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseIsInExperienceModule (copy), UseChatPagePaddingModule (copy), UseEffectFunction (copy), UseMemoFunction (copy), ButtonEnum (copy), ReactModule (copy), ButtonStack (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local UseTokensResult = UseTokensFunction()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local Size1000 = Style.Tokens.Size.Size_1000
	local Size500 = Style.Tokens.Size.Size_500
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy)
		return function()
			-- upvalues: JoinResult (upval)
			JoinResult.onHeightChanged(0)
		end
	end, {})
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: JoinResult (copy), ButtonEnum (upval)
		local List = {}
		
		if JoinResult.denyText then
			table.insert(List, {
				buttonType = ButtonEnum.ButtonType.Secondary,
				props = {
					onActivated = JoinResult.onDenied,
					text = JoinResult.denyText,
					isDisabled = JoinResult.loading
				}
			})
		end
		if JoinResult.acceptText then
			table.insert(List, {
				buttonType = ButtonEnum.ButtonType.PrimarySystem,
				props = {
					onActivated = JoinResult.onAccepted,
					text = JoinResult.acceptText,
					isDisabled = JoinResult.loading
				}
			})
		end
		return List
	end, {
		JoinResult.acceptText,
		JoinResult.denyText,
		JoinResult.loading,
		JoinResult.onDenied,
		JoinResult.onAccepted
	})
	
	return ReactModule.createElement("Frame", {
		Name = "ConversationModal",
		BackgroundTransparency = if UseIsInExperienceModuleResult then UseTokensResult.Color.OverMedia.OverMedia_100.Transparency else Style.Theme.SystemPrimaryContent.Transparency,
		BackgroundColor3 = if UseIsInExperienceModuleResult then UseTokensResult.Color.OverMedia.OverMedia_100.Color3 else Style.Theme.SystemPrimaryContent.Color,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: JoinResult (copy)
			JoinResult.onHeightChanged(Frame.AbsoluteSize.Y)
		end
	}, {
		ContentPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if JoinResult.paddingTop == nil then Size500 else JoinResult.paddingTop),
			PaddingBottom = UDim.new(0, if JoinResult.paddingBottom == nil then Size500 else JoinResult.paddingBottom),
			PaddingLeft = UDim.new(0, UseChatPagePaddingModuleResult.left),
			PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, if JoinResult.verticalSpacing == nil then Size500 else JoinResult.verticalSpacing),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		Body = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextWrapped = true,
			TextSize = Style.Tokens.FontSize.FontSize_300,
			Font = Style.Font.Body.Font,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = JoinResult.bodyText,
			TextColor3 = Style.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Buttons = if #UseMemoResult > 0 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, Size1000)
		}, {
			ButtonStack = ReactModule.createElement(ButtonStack, {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = UseMemoResult
			})
		}) else nil
	})
end
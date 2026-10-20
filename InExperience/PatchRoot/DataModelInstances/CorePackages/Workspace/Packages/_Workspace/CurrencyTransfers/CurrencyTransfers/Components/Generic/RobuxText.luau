local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetFFlagCurrencyTransferCenterRobuxIconModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferCenterRobuxIcon)

return function(p1)
	-- upvalues: ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), GetFFlagCurrencyTransferCenterRobuxIconModule (copy), UseTokensFunction (copy), Icon (copy), Text (copy), View (copy), GetIconRichTextFunction (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FormatNumberModule (upval), LocalizationService (upval), p1 (copy)
		return FormatNumberModule(LocalizationService.RobloxLocaleId, p1.amount or 0)
	end, { p1.amount, LocalizationService.RobloxLocaleId })
	
	if GetFFlagCurrencyTransferCenterRobuxIconModule() then
		local UseTokensResult = UseTokensFunction()
		local FontSize: number = UseTokensResult.Typography.HeadingLarge.FontSize
		local Rounded = math.round(UseTokensResult.Typography.DisplaySmall.FontSize)
		
		return (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, Rounded),
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			IconWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(math.round(FontSize), Rounded)
			}, {
				RobuxIcon = ReactModule.createElement(Icon, {
					name = "robux",
					size = FontSize,
					style = UseTokensResult.Color.Content.Emphasis,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 4)
				})
			}),
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = UseMemoResult,
				fontStyle = UseTokensResult.Typography.DisplaySmall,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				Size = UDim2.fromOffset(0, Rounded),
				AutomaticSize = Enum.AutomaticSize.X,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		}))
	else
		return ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center auto-xy",
			LayoutOrder = p1.layoutOrder
		}, {
			RobuxIcon = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-large content-emphasis text-align-x-center",
				RichText = true,
				LayoutOrder = 1,
				Text = GetIconRichTextFunction("robux")
			}),
			Spacer = ReactModule.createElement(View, {
				tag = "auto-xy",
				LayoutOrder = 2,
				Size = UDim2.new(0, 4, 0, 0)
			}),
			RobuxAmount = ReactModule.createElement(Text, {
				tag = "auto-xy text-display-small content-emphasis text-align-x-center",
				LayoutOrder = 3,
				Text = UseMemoResult
			})
		})
	end
end
local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local getIconRichText = foundationModule.Utility.getIconRichText
local useTokens = foundationModule.Hooks.useTokens
local getFFlagCurrencyTransferCenterRobuxIconModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferCenterRobuxIcon)

return function(p1)
	-- upvalues: reactModule (ref), formatNumberModule (ref), localizationService (ref), getFFlagCurrencyTransferCenterRobuxIconModule (ref), useTokens (ref), icon (ref), text (ref), view (ref), getIconRichText (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: formatNumberModule (copy), localizationService (copy), p1 (ref)
		return formatNumberModule(localizationService.RobloxLocaleId, p1.amount or 0)
	end, { p1.amount, localizationService.RobloxLocaleId })
	
	if getFFlagCurrencyTransferCenterRobuxIconModule() then
		local var2 = useTokens()
		local fontSize = var2.Typography.HeadingLarge.FontSize
		local rounded = math.round(var2.Typography.DisplaySmall.FontSize)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, rounded),
			LayoutOrder = p1.layoutOrder
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			IconWrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(math.round(fontSize), rounded)
			}, {
				RobuxIcon = reactModule.createElement(icon, {
					name = "robux",
					size = fontSize,
					style = var2.Color.Content.Emphasis,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 4)
				})
			}),
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = var1,
				fontStyle = var2.Typography.DisplaySmall,
				textStyle = var2.Color.Content.Emphasis,
				Size = UDim2.fromOffset(0, rounded),
				AutomaticSize = Enum.AutomaticSize.X,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		RobuxIcon = reactModule.createElement(text, {
			tag = "auto-xy text-heading-large content-emphasis text-align-x-center",
			RichText = true,
			LayoutOrder = 1,
			Text = getIconRichText("robux")
		}),
		Spacer = reactModule.createElement(view, {
			tag = "auto-xy",
			LayoutOrder = 2,
			Size = UDim2.new(0, 4, 0, 0)
		}),
		RobuxAmount = reactModule.createElement(text, {
			tag = "auto-xy text-display-small content-emphasis text-align-x-center",
			LayoutOrder = 3,
			Text = var1
		})
	})
end
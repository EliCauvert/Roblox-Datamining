local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Enums = FoundationModule.Enums
local GetFFlagCurrencyTransferFlowUIImprovementFixModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)

return function(p1)
	-- upvalues: ReactModule (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (copy), Button (copy), Enums (copy), ButtonVariant (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-small auto-xy padding-y-medium",
		LayoutOrder = p1.layoutOrder or 1
	}, {
		ChipsContainer = ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center gap-small auto-xy"
		}, table.unpack((ReactModule.useMemo(function()
			-- upvalues: GetFFlagCurrencyTransferFlowUIImprovementFixModule (upval), p1 (copy), ReactModule (upval), Button (upval), Enums (upval), ButtonVariant (upval)
			local Elements = {}
			local FFlagCurrencyTransferFlowUIImprovementFixModule = GetFFlagCurrencyTransferFlowUIImprovementFixModule()
			
			for LayoutOrder, chip in ipairs(p1.chips) do
				local IsSelectedAmountMatch = p1.selectedAmount == chip.amount
				
				if FFlagCurrencyTransferFlowUIImprovementFixModule then
					Elements[LayoutOrder] = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.new(0, 0, 0, 52),
						LayoutOrder = LayoutOrder
					}, {
						ChipFrame = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							AutomaticSize = Enum.AutomaticSize.X,
							Size = UDim2.new(0, 0, 0, 52)
						}, {
							Layout = ReactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center
							}),
							ChipButton = ReactModule.createElement(Button, {
								text = chip.text,
								icon = Enums.IconName.Robux,
								variant = if IsSelectedAmountMatch then ButtonVariant.Subtle else ButtonVariant.Standard,
								size = Enums.ChipSize.Medium,
								onActivated = function() end
							})
						}),
						TouchTarget = ReactModule.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, 52),
							BackgroundTransparency = 1,
							Text = "",
							ZIndex = 5,
							[ReactModule.Event.Activated] = function()
								-- upvalues: p1 (upval), chip (copy)
								p1.onChipSelected(chip.amount)
							end,
							[ReactModule.Event.InputBegan] = function(_, Input)
								-- upvalues: p1 (upval), chip (copy)
								if Input.UserInputType == Enum.UserInputType.Touch then
									p1.onChipSelected(chip.amount)
								end
							end
						})
					})
				else
					Elements[LayoutOrder] = ReactModule.createElement(Button, {
						text = chip.text,
						icon = Enums.IconName.Robux,
						onActivated = function()
							-- upvalues: p1 (upval), chip (copy)
							p1.onChipSelected(chip.amount)
						end,
						LayoutOrder = LayoutOrder,
						variant = if IsSelectedAmountMatch then ButtonVariant.Subtle else ButtonVariant.Standard,
						size = Enums.ChipSize.Medium
					})
				end
			end
			return Elements
		end, { p1.chips, p1.selectedAmount, p1.onChipSelected }))))
	})
end
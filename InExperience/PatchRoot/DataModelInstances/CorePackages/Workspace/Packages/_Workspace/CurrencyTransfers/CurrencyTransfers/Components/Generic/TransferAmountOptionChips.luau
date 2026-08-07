local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local enums = foundationModule.Enums
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)

return function(p0) --[[ line: 33 | named "TransferAmountOptionChips" ]]
	-- upvalues: reactModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), button (ref), enums (ref), buttonVariant (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-small auto-xy padding-y-medium",
		LayoutOrder = p0.layoutOrder or 1
	}, {
		ChipsContainer = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center gap-small auto-xy"
		}, table.unpack(reactModule.useMemo(function() --[[ line: 34 ]]
			-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), p0 (ref), reactModule (copy), button (copy), enums (copy), buttonVariant (copy)
			local t = {}
			local var5 = getFFlagCurrencyTransferFlowUIImprovementFixModule()
			
			for i, v in ipairs(p0.chips) do
				local var6 = p0.selectedAmount == v.amount
				
				if var5 then
					t[i] = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.new(0, 0, 0, 52),
						LayoutOrder = i
					}, {
						ChipFrame = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							AutomaticSize = Enum.AutomaticSize.X,
							Size = UDim2.new(0, 0, 0, 52)
						}, {
							Layout = reactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center
							}),
							ChipButton = reactModule.createElement(button, {
								text = v.text,
								icon = enums.IconName.Robux,
								variant = if var6 then buttonVariant.Subtle else buttonVariant.Standard,
								size = enums.ChipSize.Medium,
								onActivated = function() --[[ line: 77 ]] end
							})
						}),
						TouchTarget = reactModule.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, 52),
							BackgroundTransparency = 1,
							Text = "",
							ZIndex = 5,
							[reactModule.Event.Activated] = function() --[[ line: 88 ]]
								-- upvalues: p0 (copy), v (ref)
								p0.onChipSelected(v.amount)
							end,
							[reactModule.Event.InputBegan] = function(_, p1) --[[ line: 98 ]]
								-- upvalues: p0 (copy), v (ref)
								if p1.UserInputType == Enum.UserInputType.Touch then
									p0.onChipSelected(v.amount)
								end
							end
						})
					})
				else
					t[i] = reactModule.createElement(button, {
						text = v.text,
						icon = enums.IconName.Robux,
						onActivated = function() --[[ line: 111 ]]
							-- upvalues: p0 (copy), v (ref)
							p0.onChipSelected(v.amount)
						end,
						LayoutOrder = i,
						variant = if var6 then buttonVariant.Subtle else buttonVariant.Standard,
						size = enums.ChipSize.Medium
					})
				end
			end
			return t
		end, { p0.chips, p0.selectedAmount, p0.onChipSelected })))
	})
end
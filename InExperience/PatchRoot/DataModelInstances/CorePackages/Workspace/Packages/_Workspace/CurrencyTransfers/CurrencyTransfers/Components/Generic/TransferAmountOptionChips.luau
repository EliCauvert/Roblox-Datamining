local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local enums = foundationModule.Enums
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)

return function(p1)
	-- upvalues: reactModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), button (ref), enums (ref), buttonVariant (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-small auto-xy padding-y-medium",
		LayoutOrder = p1.layoutOrder or 1
	}, {
		ChipsContainer = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center gap-small auto-xy"
		}, table.unpack(reactModule.useMemo(function()
			-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), p1 (ref), reactModule (copy), button (copy), enums (copy), buttonVariant (copy)
			local t = {}
			local var1 = getFFlagCurrencyTransferFlowUIImprovementFixModule()
			
			for i, v in ipairs(p1.chips) do
				local var2 = p1.selectedAmount == v.amount
				
				if var1 then
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
								variant = if var2 then buttonVariant.Subtle else buttonVariant.Standard,
								size = enums.ChipSize.Medium,
								onActivated = function() end
							})
						}),
						TouchTarget = reactModule.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, 52),
							BackgroundTransparency = 1,
							Text = "",
							ZIndex = 5,
							[reactModule.Event.Activated] = function()
								-- upvalues: p1 (copy), v (ref)
								p1.onChipSelected(v.amount)
							end,
							[reactModule.Event.InputBegan] = function(_, p2)
								-- upvalues: p1 (copy), v (ref)
								if p2.UserInputType == Enum.UserInputType.Touch then
									p1.onChipSelected(v.amount)
								end
							end
						})
					})
				else
					t[i] = reactModule.createElement(button, {
						text = v.text,
						icon = enums.IconName.Robux,
						onActivated = function()
							-- upvalues: p1 (copy), v (ref)
							p1.onChipSelected(v.amount)
						end,
						LayoutOrder = i,
						variant = if var2 then buttonVariant.Subtle else buttonVariant.Standard,
						size = enums.ChipSize.Medium
					})
				end
			end
			return t
		end, { p1.chips, p1.selectedAmount, p1.onChipSelected })))
	})
end
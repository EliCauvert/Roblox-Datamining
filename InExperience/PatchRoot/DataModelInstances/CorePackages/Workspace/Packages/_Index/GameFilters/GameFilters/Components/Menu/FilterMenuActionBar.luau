local parent = script:FindFirstAncestor("GameFilters").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), button (ref), buttonType (ref)
	local var1 = useTokens()
	local surface100 = var1.Color.Surface.Surface_100
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p1.LayoutOrder,
		BackgroundTransparency = surface100.Transparency,
		BackgroundColor3 = surface100.Color3,
		Size = p1.Size
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.XXLarge),
			PaddingBottom = UDim.new(0, var1.Padding.XXLarge),
			PaddingLeft = UDim.new(0, var1.Padding.XXLarge),
			PaddingRight = UDim.new(0, var1.Padding.XXLarge)
		}),
		ApplyButton = reactModule.createElement(button, {
			buttonType = buttonType.PrimaryContextual,
			size = UDim2.fromScale(1, 1),
			text = useLocalization({ apply = "CommonUI.Messages.Action.Apply" }).apply,
			isDisabled = not p1.applyEnabled,
			onActivated = p1.onApply
		})
	})
end
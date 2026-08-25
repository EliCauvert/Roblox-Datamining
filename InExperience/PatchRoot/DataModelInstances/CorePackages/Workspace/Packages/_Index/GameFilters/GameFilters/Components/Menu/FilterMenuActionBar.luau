local parent = script:FindFirstAncestor("GameFilters").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), button (ref), buttonType (ref)
	local var3 = useTokens()
	local surface100 = var3.Color.Surface.Surface_100
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p0.LayoutOrder,
		BackgroundTransparency = surface100.Transparency,
		BackgroundColor3 = surface100.Color3,
		Size = p0.Size
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) }),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var3.Padding.XXLarge),
			PaddingBottom = UDim.new(0, var3.Padding.XXLarge),
			PaddingLeft = UDim.new(0, var3.Padding.XXLarge),
			PaddingRight = UDim.new(0, var3.Padding.XXLarge)
		}),
		ApplyButton = reactModule.createElement(button, {
			buttonType = buttonType.PrimaryContextual,
			size = UDim2.fromScale(1, 1),
			text = useLocalization({ apply = "CommonUI.Messages.Action.Apply" }).apply,
			isDisabled = not p0.applyEnabled,
			onActivated = p0.onApply
		})
	})
end
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local SelectionRowModule = require(script.Parent.SelectionRow)
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local UseStyleFunction = UIBlox.Core.Style.useStyle
local Images = UIBlox.App.ImageSet.Images
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), React (copy), ImageSetLabel (copy), Images (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), SelectionRowModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		addAccountText = "Authentication.AccountSwitch.Action.AddAccount"
	})
	local UseStyleResult = UseStyleFunction()
	
	return React.createElement(SelectionRowModule, {
		subtitleContent = "",
		userInteractionEnabled = true,
		titleContent = UseLocalizationResult.addAccountText,
		renderImage = function()
			-- upvalues: React (upval), UseStyleResult (copy), ImageSetLabel (upval), Images (upval)
			return React.createElement("Frame", {
				BackgroundTransparency = 0.6,
				Size = UDim2.new(0, 48, 0, 48),
				BackgroundColor3 = UseStyleResult.Theme.IconDefault.Color
			}, {
				UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 24) }),
				Icon = React.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Image = Images["icons/common/plus_small"],
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = UseStyleResult.Theme.BackgroundContrast.Color
				})
			})
		end,
		onAccountSelection = function()
			-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval)
			p1.onRowClicked()
			AnalyticsEventsModule.sendButtonClickEvent(p1.context, p1.origin, EventConstantsModule.btn.addAccount)
		end
	})
end
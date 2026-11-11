local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local TooltipCallout = UIBlox.App.Dialog.TooltipCallout
local TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local TextKeysModule = require(Parent.Common.TextKeys)

return function(Frame)
	-- upvalues: React (copy), UIBlox (copy), UseLocalizationFunction (copy), TextKeysModule (copy), TooltipOrientation (copy), TooltipCallout (copy)
	local UseStateResult, UseStateResult2 = React.useState(0)
	local UseStyleResult = UIBlox.Core.Style.useStyle()
	local UseLocalizationResult = UseLocalizationFunction({
		findFriendsTitle = TextKeysModule.FindFriendsTooltipTitle,
		findFriendsBody = TextKeysModule.FindFriendsTooltipBody
	})
	
	return React.createElement("Frame", {
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[React.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2((math.max(0, Frame.AbsoluteSize.Y - 100)))
		end,
		Position = UDim2.new(0, 0, 0, UseStateResult)
	}, {
		Tooltip = React.createElement(TooltipCallout, {
			distanceOffset = -12,
			headerText = UseLocalizationResult.findFriendsTitle,
			bodyText = UseLocalizationResult.findFriendsBody,
			orientation = TooltipOrientation.Right,
			triggerPointCenter = Vector2.new(0, 50),
			canvasBackground = UseStyleResult.Theme.BackgroundDefault,
			contentOffsetVector = Vector2.zero,
			triggerPointRadius = Vector2.zero
		})
	})
end
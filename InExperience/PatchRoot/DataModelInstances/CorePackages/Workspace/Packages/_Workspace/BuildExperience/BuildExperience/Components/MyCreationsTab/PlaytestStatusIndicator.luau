local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local Icon = FoundationModule.Icon
local Progress = FoundationModule.Progress
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Icon (copy), IconName (copy), IconVariant (copy)
	local Size400 = UseTokensFunction().Size.Size_400
	
	return if Frame.status == "Loading" then ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center",
		testId = "MyCreationsTab.StatusIndicator.Loading",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(Size400, Size400)
	}, {
		Progress = ReactModule.createElement(Progress, { shape = ProgressShape.Circle, size = ProgressSize.Small })
	}) elseif Frame.status == "Completed" then ReactModule.createElement(Icon, {
		tag = "auto-xy content-system-success",
		testId = "MyCreationsTab.StatusIndicator.Completed",
		LayoutOrder = Frame.LayoutOrder,
		name = IconName.CircleCheck,
		size = Size400,
		variant = IconVariant.Filled
	}) else nil
end
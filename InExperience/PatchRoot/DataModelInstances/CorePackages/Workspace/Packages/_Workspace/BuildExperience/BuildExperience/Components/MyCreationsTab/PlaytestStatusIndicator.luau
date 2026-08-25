local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local icon = foundationModule.Icon
local progress = foundationModule.Progress
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize
local useTokens = foundationModule.Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), progress (ref), progressShape (ref), progressSize (ref), icon (ref), iconName (ref), iconVariant (ref)
	local size400 = useTokens().Size.Size_400
	
	return if p0.status == "Loading" then reactModule.createElement(view, {
		tag = "row align-x-center align-y-center",
		testId = "MyCreationsTab.StatusIndicator.Loading",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromOffset(size400, size400)
	}, {
		Progress = reactModule.createElement(progress, { shape = progressShape.Circle, size = progressSize.Small })
	}) elseif p0.status == "Completed" then reactModule.createElement(icon, {
		tag = "auto-xy content-system-success",
		testId = "MyCreationsTab.StatusIndicator.Completed",
		LayoutOrder = p0.LayoutOrder,
		name = iconName.CircleCheck,
		size = size400,
		variant = iconVariant.Filled
	}) else nil
end
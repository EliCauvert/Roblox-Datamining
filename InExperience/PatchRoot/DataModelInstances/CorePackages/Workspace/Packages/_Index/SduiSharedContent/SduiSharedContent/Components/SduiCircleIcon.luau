local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)
local sduiViewModule = require(script.Parent.SduiView)
local sduiIconModule = require(script.Parent.SduiIcon)

return reactModule.memo(function(p0) --[[ line: 33 | named "SduiCircleIcon" ]]
	-- upvalues: useTokens (ref), reactModule (ref), sduiViewModule (ref), sduiIconModule (ref)
	return reactModule.createElement(sduiViewModule, {
		tag = "radius-circle align-x-center align-y-center aspect-1-1",
		size = p0.size or UDim2.fromScale(1, 1),
		backgroundStyle = p0.backgroundStyle or useTokens().Color.Surface.Surface_100,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}, {
		Icon = if p0.iconName then reactModule.createElement(sduiIconModule, {
			name = p0.iconName,
			size = p0.iconSize,
			testId = if p0.testId then p0.testId .. "-icon" else nil
		}) else nil
	})
end)
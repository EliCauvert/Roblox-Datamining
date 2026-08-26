local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)
local sduiViewModule = require(script.Parent.SduiView)
local sduiIconModule = require(script.Parent.SduiIcon)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), sduiViewModule (ref), sduiIconModule (ref)
	return reactModule.createElement(sduiViewModule, {
		tag = "radius-circle align-x-center align-y-center aspect-1-1",
		size = p1.size or UDim2.fromScale(1, 1),
		backgroundStyle = p1.backgroundStyle or useTokens().Color.Surface.Surface_100,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		Icon = if p1.iconName then reactModule.createElement(sduiIconModule, {
			name = p1.iconName,
			size = p1.iconSize,
			testId = if p1.testId then p1.testId .. "-icon" else nil
		}) else nil
	})
end)
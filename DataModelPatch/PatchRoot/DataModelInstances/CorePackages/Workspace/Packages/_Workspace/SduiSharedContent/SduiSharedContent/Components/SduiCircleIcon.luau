local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(Parent.SduiCompat)
local SduiViewModule = require(script.Parent.SduiView)
local SduiIconModule = require(script.Parent.SduiIcon)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SduiViewModule (copy), SduiIconModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(SduiViewModule, {
		tag = "radius-circle align-x-center align-y-center aspect-1-1",
		size = p1.size or UDim2.fromScale(1, 1),
		backgroundStyle = p1.backgroundStyle or UseTokensResult.Color.Surface.Surface_100,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		Icon = if p1.iconName then ReactModule.createElement(SduiIconModule, {
			name = p1.iconName,
			size = p1.iconSize,
			testId = if p1.testId then p1.testId .. "-icon" else nil
		}) else nil
	})
end)
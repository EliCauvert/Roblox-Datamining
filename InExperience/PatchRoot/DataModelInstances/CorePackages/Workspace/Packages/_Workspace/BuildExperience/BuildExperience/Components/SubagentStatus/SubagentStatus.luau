local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	if p1 == nil then
		return false
	elseif typeof(p1) ~= "table" then
		return true
	end
	for i, v in p1 do
		if v ~= nil then
			return true
		end
	end
	return false
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var1
	local var2 = useTokens()
	local testId = p2.testId or "subagent-status"
	local var3 = p2.isDisabled == true
	local children = p2.children
	
	if children == nil then
		var1 = false
	elseif typeof(children) == "table" then
		for i, v in children do
			if v ~= nil then
				var1 = true
			end
		end
		var1 = false
	else
		var1 = true
	end
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
		LayoutOrder = p2.layoutOrder,
		backgroundStyle = var2.Color.ActionStandard.Background,
		cursor = {
			radius = UDim.new(0, var2.Radius.Circle),
			offset = var2.Size.Size_200,
			borderWidth = math.floor(var2.Stroke.Thicker)
		},
		GroupTransparency = if var3 then 0.5 else 0,
		isDisabled = var3,
		onActivated = p2.onActivated,
		selection = { Selectable = not var3 },
		testId = testId
	}, {
		Text = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "shrink size-0-full auto-x text-label-medium text-truncate-end",
			Text = p2.text,
			padding = {
				left = UDim.new(0, var2.Padding.Medium),
				right = if var1 then nil else UDim.new(0, var2.Padding.Medium)
			},
			textStyle = var2.Color.ActionStandard.Foreground,
			testId = `{testId}-text`
		}),
		Trailing = if var1 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center auto-xy padding-left-small padding-right-medium",
			testId = `{testId}-trailing`
		}, p2.children) else nil
	})
end)
local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _(p0) --[[ line: 24 | named "hasChildren" ]]
	if p0 == nil then
		return false
	elseif typeof(p0) ~= "table" then
		return true
	end
	for i, v in p0 do
		if v ~= nil then
			return true
		end
	end
	return false
end

return reactModule.memo(function(p1) --[[ line: 39 | named "SubagentStatus" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var5
	local var2 = useTokens()
	local testId = p1.testId or "subagent-status"
	local var4 = p1.isDisabled == true
	local children = p1.children
	
	if children == nil then
		var5 = false
	elseif typeof(children) == "table" then
		for i, v in children do
			if v ~= nil then
				var5 = true
			end
		end
		var5 = false
	else
		var5 = true
	end
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = var2.Color.ActionStandard.Background,
		cursor = {
			radius = UDim.new(0, var2.Radius.Circle),
			offset = var2.Size.Size_200,
			borderWidth = math.floor(var2.Stroke.Thicker)
		},
		GroupTransparency = if var4 then 0.5 else 0,
		isDisabled = var4,
		onActivated = p1.onActivated,
		selection = { Selectable = not var4 },
		testId = testId
	}, {
		Text = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "shrink size-0-full auto-x text-label-medium text-truncate-end",
			Text = p1.text,
			padding = {
				left = UDim.new(0, var2.Padding.Medium),
				right = if var5 then nil else UDim.new(0, var2.Padding.Medium)
			},
			textStyle = var2.Color.ActionStandard.Foreground,
			testId = `{testId}-text`
		}),
		Trailing = if var5 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center auto-xy padding-left-small padding-right-medium",
			testId = `{testId}-trailing`
		}, p1.children) else nil
	})
end)
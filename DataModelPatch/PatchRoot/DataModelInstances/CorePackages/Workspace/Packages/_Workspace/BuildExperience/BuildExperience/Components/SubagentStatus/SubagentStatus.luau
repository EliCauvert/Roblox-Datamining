local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(List): boolean
	if List == nil then
		return false
	end
	if typeof(List) ~= "table" then
		return true
	end
	for _, value in List do
		if value ~= nil then
			return true
		end
	end
	return false
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "subagent-status"
	local IsIsDisabled = p1.isDisabled == true
	local Children = p1.children
	local Flag = nil
	
	if Children == nil then
		Flag = false
	elseif typeof(Children) == "table" then
		Flag = false
		
		for _, child in Children do
			if child ~= nil then
				Flag = true
				break
			end
		end
	else
		Flag = true
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = UseTokensResult.Color.ActionStandard.Background,
		cursor = {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = UseTokensResult.Size.Size_200,
			borderWidth = math.floor(UseTokensResult.Stroke.Thicker)
		},
		GroupTransparency = if IsIsDisabled then 0.5 else 0,
		isDisabled = IsIsDisabled,
		onActivated = p1.onActivated,
		selection = { Selectable = not IsIsDisabled },
		testId = TestId
	}, {
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "shrink size-0-full auto-x text-label-medium text-truncate-end",
			Text = p1.text,
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Medium),
				right = if Flag then nil else UDim.new(0, UseTokensResult.Padding.Medium)
			},
			textStyle = UseTokensResult.Color.ActionStandard.Foreground,
			testId = `{TestId}-text`
		}),
		Trailing = if Flag then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center auto-xy padding-left-small padding-right-medium",
			testId = `{TestId}-trailing`
		}, p1.children) else nil
	})
end)
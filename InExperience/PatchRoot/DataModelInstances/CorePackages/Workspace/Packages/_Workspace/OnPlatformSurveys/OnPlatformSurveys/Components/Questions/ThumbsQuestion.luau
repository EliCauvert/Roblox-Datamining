local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local iconVariant = foundationModule.Enums.IconVariant
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local list = {
	{ id = "1", icon = "thumb-down" },
	{ id = "2", icon = "thumb-up" }
}

local function _(p0, p1) --[[ line: 44 | named "findChoice" ]]
	-- upvalues: t (ref)
	for i, v in p0.choices or t do
		if v.id == p1 then
			return v
		end
	end
	return nil
end

return reactModule.memo(function(p2) --[[ line: 53 | named "ThumbsQuestion" ]]
	-- upvalues: useTokens (ref), reactModule (ref), list (ref), t (ref), view (ref), icon (ref), iconVariant (ref), text (ref)
	local var5 = useTokens()
	local question = p2.question
	local answer = p2.answer
	local var6 = p2.isDisabled == true
	local var7 = if answer.choiceIds ~= nil then nil else answer.choiceIds[1]
	local var8, var9 = reactModule.useState(nil)
	local color3 = var5.Color.Content.Default.Color3
	local t_1 = {}
	
	for i, v in list do
		local var11
		local id = v.id
		
		for i_1, v_1 in question.choices or t do
			if v_1.id == id then
				var11 = v_1
				if var11 ~= nil then
					id = var7 == v.id
					t_1["Cell_" .. v.id] = reactModule.createElement(view, {
						tag = "col align-x-center gap-small auto-xy",
						LayoutOrder = i
					}, {
						Button = reactModule.createElement("TextButton", {
							Size = UDim2.fromOffset(76, 76),
							BackgroundTransparency = 1,
							Text = "",
							AutoButtonColor = false,
							Active = not var6,
							Selectable = not var6,
							LayoutOrder = 1,
							[reactModule.Tag] = "data-testid=thumb-" .. v.id,
							[reactModule.Event.Activated] = function() --[[ line: 91 ]]
								-- upvalues: var6 (ref), p2 (ref), id (ref), v (ref)
								if var6 then
									return
								end
								p2.onAnswerChanged({ choiceIds = if id then {} else { v.id } })
							end,
							[reactModule.Event.MouseEnter] = function() --[[ line: 100 ]]
								-- upvalues: var9 (ref), v (ref)
								var9(v.id)
							end,
							[reactModule.Event.MouseLeave] = function() --[[ line: 103 ]]
								-- upvalues: var9 (ref), v (ref)
								var9(function(p3) --[[ line: 104 ]]
									-- upvalues: v (copy)
									return if p3 == v.id then nil else p3
								end)
							end
						}, {
							Backplate = reactModule.createElement(view, {
								tag = "size-full radius-circle",
								ZIndex = 1,
								backgroundStyle = {
									Color3 = color3,
									Transparency = if id then 0.75 elseif var8 == v.id then 0.85 else 0.92
								}
							}),
							Icon = reactModule.createElement(icon, {
								size = 40,
								ZIndex = 2,
								name = v.icon,
								variant = if id then iconVariant.Filled else iconVariant.Regular,
								AnchorPoint = Vector2.new(0.5, 0.5),
								Position = UDim2.fromScale(0.5, 0.5)
							})
						}),
						Label = reactModule.createElement(text, {
							tag = "auto-xy text-body-medium text-align-x-center content-default",
							LayoutOrder = 2,
							Text = var11.label
						})
					})
				end
			end
		end
		var11 = nil
	end
	return reactModule.createElement(view, {
		tag = "row flex-around align-y-top size-full-0 auto-y",
		LayoutOrder = p2.layoutOrder
	}, t_1)
end)
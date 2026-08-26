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

local function _(p1, p2)
	-- upvalues: t (ref)
	for i, v in p1.choices or t do
		if v.id == p2 then
			return v
		end
	end
	return nil
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), reactModule (ref), list (ref), t (ref), view (ref), icon (ref), iconVariant (ref), text (ref)
	local var1 = useTokens()
	local question = p3.question
	local answer = p3.answer
	local var2 = p3.isDisabled == true
	local var3 = if answer.choiceIds ~= nil then nil else answer.choiceIds[1]
	local var4, var5 = reactModule.useState(nil)
	local color3 = var1.Color.Content.Default.Color3
	local t_1 = {}
	
	for i, v in list do
		local var6
		local id = v.id
		
		for i_1, v_1 in question.choices or t do
			if v_1.id == id then
				var6 = v_1
				if var6 ~= nil then
					id = var3 == v.id
					t_1["Cell_" .. v.id] = reactModule.createElement(view, {
						tag = "col align-x-center gap-small auto-xy",
						LayoutOrder = i
					}, {
						Button = reactModule.createElement("TextButton", {
							Size = UDim2.fromOffset(76, 76),
							BackgroundTransparency = 1,
							Text = "",
							AutoButtonColor = false,
							Active = not var2,
							Selectable = not var2,
							LayoutOrder = 1,
							[reactModule.Tag] = "data-testid=thumb-" .. v.id,
							[reactModule.Event.Activated] = function()
								-- upvalues: var2 (ref), p3 (ref), id (ref), v (ref)
								if var2 then
									return
								end
								p3.onAnswerChanged({ choiceIds = if id then {} else { v.id } })
							end,
							[reactModule.Event.MouseEnter] = function()
								-- upvalues: var5 (ref), v (ref)
								var5(v.id)
							end,
							[reactModule.Event.MouseLeave] = function()
								-- upvalues: var5 (ref), v (ref)
								var5(function(p4)
									-- upvalues: v (copy)
									return if p4 == v.id then nil else p4
								end)
							end
						}, {
							Backplate = reactModule.createElement(view, {
								tag = "size-full radius-circle",
								ZIndex = 1,
								backgroundStyle = {
									Color3 = color3,
									Transparency = if id then 0.75 elseif var4 == v.id then 0.85 else 0.92
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
							Text = var6.label
						})
					})
				end
			end
		end
		var6 = nil
	end
	return reactModule.createElement(view, {
		tag = "row flex-around align-y-top size-full-0 auto-y",
		LayoutOrder = p3.layoutOrder
	}, t_1)
end)
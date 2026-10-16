local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local IconVariant = FoundationModule.Enums.IconVariant
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local list = {
	{ id = "1", icon = "thumb-down" },
	{ id = "2", icon = "thumb-up" }
}

local function _(p1, Id) --[[ Line: 44 | Named "findChoice" ]]
	-- upvalues: t (copy)
	local Choices = p1.choices or t
	for _, choice in Choices do
		if choice.id == Id then
			return choice
		end
	end
	return nil
end

return ReactModule.memo(function(p2) --[[ Line: 53 | Named "ThumbsQuestion" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), list (copy), t (copy), View (copy), Icon (copy), IconVariant (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local Question = p2.question
	local Answer = p2.answer
	local IsIsDisabled = p2.isDisabled == true
	local ChoiceId = if Answer.choiceIds == nil then nil else Answer.choiceIds[1]
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local DefaultColor3 = UseTokensResult.Color.Content.Default.Color3
	local Elements = {}
	local v1 = nil
	
	for LayoutOrder, value in list do
		local Id = value.id
		local Choices = Question.choices or t
		v1 = nil
		
		for _, choice in Choices do
			if choice.id == Id then
				v1 = choice
				break
			end
		end
		if v1 ~= nil then
			local IsChoiceIdMatch = ChoiceId == value.id
			local IsUseStateResultMatch = UseStateResult == value.id
			Elements["Cell_" .. value.id] = ReactModule.createElement(View, {
				tag = "col align-x-center gap-small auto-xy",
				LayoutOrder = LayoutOrder
			}, {
				Button = ReactModule.createElement("TextButton", {
					Size = UDim2.fromOffset(76, 76),
					BackgroundTransparency = 1,
					Text = "",
					AutoButtonColor = false,
					Active = not IsIsDisabled,
					Selectable = not IsIsDisabled,
					LayoutOrder = 1,
					[ReactModule.Tag] = "data-testid=thumb-" .. value.id,
					[ReactModule.Event.Activated] = function() --[[ Line: 91 ]]
						-- upvalues: IsIsDisabled (copy), p2 (copy), IsChoiceIdMatch (copy), value (copy)
						if not IsIsDisabled then
							p2.onAnswerChanged({ choiceIds = if IsChoiceIdMatch then {} else { value.id } })
							
							return
						end
					end,
					[ReactModule.Event.MouseEnter] = function() --[[ Line: 100 ]]
						-- upvalues: UseStateResult2 (copy), value (copy)
						UseStateResult2(value.id)
					end,
					[ReactModule.Event.MouseLeave] = function() --[[ Line: 103 ]]
						-- upvalues: UseStateResult2 (copy), value (copy)
						UseStateResult2(function(Id) --[[ Line: 104 ]]
							-- upvalues: value (upval)
							return if Id == value.id then nil else Id
						end)
					end
				}, {
					Backplate = ReactModule.createElement(View, {
						tag = "size-full radius-circle",
						ZIndex = 1,
						backgroundStyle = {
							Color3 = DefaultColor3,
							Transparency = if IsChoiceIdMatch then 0.75 elseif IsUseStateResultMatch then 0.85 else 0.92
						}
					}),
					Icon = ReactModule.createElement(Icon, {
						size = 40,
						ZIndex = 2,
						name = value.icon,
						variant = if IsChoiceIdMatch then IconVariant.Filled else IconVariant.Regular,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					})
				}),
				Label = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-center content-default",
					LayoutOrder = 2,
					Text = v1.label
				})
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "row flex-around align-y-top size-full-0 auto-y",
		LayoutOrder = p2.layoutOrder
	}, Elements)
end)
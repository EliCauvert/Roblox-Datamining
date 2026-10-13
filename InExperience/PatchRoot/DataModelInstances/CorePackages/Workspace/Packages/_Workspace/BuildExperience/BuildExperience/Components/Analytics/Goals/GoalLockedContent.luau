local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local _ = require(buildExperience.Analytics.Goals.GoalLockedActionId)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), view (ref), text (ref)
	local testId = p1.testId or "GoalLockedContent"
	local locked = p1.locked
	local actions = locked.actions
	local t = { message = locked.messageKey }
	
	if actions ~= nil then
		t.primary = actions.primary.textKey
		
		if actions.secondary ~= nil then
			t.secondary = actions.secondary.textKey
		end
	end
	local var1 = useLocalization(t)
	local t_1 = {}
	
	if actions ~= nil then
		local primary = actions.primary
		t_1.Primary = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = var1.primary,
			size = inputSize.Small,
			variant = buttonVariant.SoftEmphasis,
			fillBehavior = fillBehavior.Fill,
			width = UDim.new(1, 0),
			onActivated = function()
				-- upvalues: p1 (ref), primary (ref)
				if p1.onAction then
					p1.onAction(primary.id)
				end
			end,
			testId = `{testId}.Primary`
		})
		local secondary = actions.secondary
		
		if secondary ~= nil then
			t_1.Secondary = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = var1.secondary,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = function()
					-- upvalues: p1 (ref), secondary (ref)
					if p1.onAction then
						p1.onAction(secondary.id)
					end
				end,
				testId = `{testId}.Secondary`
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-center content-default",
			Text = var1.message,
			testId = `{testId}.Message`
		}),
		Actions = if actions ~= nil then nil else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{testId}.Actions`
		}, t_1)
	})
end
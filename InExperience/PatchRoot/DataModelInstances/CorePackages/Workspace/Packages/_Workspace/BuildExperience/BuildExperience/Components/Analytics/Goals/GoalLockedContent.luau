local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local _ = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)

return function(p1) --[[ Line: 29 | Named "GoalLockedContent" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), View (copy), Text (copy)
	local TestId = p1.testId or "GoalLockedContent"
	local Locked = p1.locked
	local Actions = Locked.actions
	local config = { message = Locked.messageKey }
	
	if Actions ~= nil then
		config.primary = Actions.primary.textKey
		
		if Actions.secondary ~= nil then
			config.secondary = Actions.secondary.textKey
		end
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local t = {}
	
	if Actions ~= nil then
		local Primary = Actions.primary
		t.Primary = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.primary,
			size = InputSize.Small,
			variant = ButtonVariant.SoftEmphasis,
			fillBehavior = FillBehavior.Fill,
			width = UDim.new(1, 0),
			onActivated = function() --[[ Line: 53 ]]
				-- upvalues: p1 (copy), Primary (copy)
				if p1.onAction then
					p1.onAction(Primary.id)
				end
			end,
			testId = `{TestId}.Primary`
		})
		local Secondary = Actions.secondary
		
		if Secondary ~= nil then
			t.Secondary = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.secondary,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = function() --[[ Line: 70 ]]
					-- upvalues: p1 (copy), Secondary (copy)
					if p1.onAction then
						p1.onAction(Secondary.id)
					end
				end,
				testId = `{TestId}.Secondary`
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Message = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-center content-default",
			Text = UseLocalizationResult.message,
			testId = `{TestId}.Message`
		}),
		Actions = if Actions == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{TestId}.Actions`
		}, t)
	})
end
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
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), View (copy), Text (copy)
	local TestId = p1.testId or "GoalLockedContent"
	local Locked = p1.locked
	local Actions = Locked.actions
	
	local function _(p2)
		-- upvalues: p1 (copy)
		if p2 == nil or p1.actionHandlers == nil then
			return nil
		else
			local ActionHandler = p1.actionHandlers[p2.id]
			
			return if ActionHandler == nil or not ActionHandler.isEligible then nil else ActionHandler
		end
	end
	
	local Primary = nil
	local v1 = nil
	local Secondary = nil
	local v2 = nil
	
	if Actions ~= nil then
		Primary = Actions.primary
		local Primary1 = Actions.primary
		
		if Primary1 == nil or p1.actionHandlers == nil then
			v1 = nil
		else
			local ActionHandler = p1.actionHandlers[Primary1.id]
			v1 = if ActionHandler == nil or not ActionHandler.isEligible then nil else ActionHandler
		end
		Secondary = Actions.secondary
		local Secondary1 = Actions.secondary
		
		if Secondary1 == nil or p1.actionHandlers == nil then
			v2 = nil
		else
			local ActionHandler = p1.actionHandlers[Secondary1.id]
			v2 = if ActionHandler == nil or not ActionHandler.isEligible then nil else ActionHandler
		end
		if v1 == nil then
			Primary = Secondary
			v1 = v2
			Secondary = nil
			v2 = nil
		end
	end
	local config = { message = Locked.messageKey }
	
	if Primary ~= nil and v1 ~= nil then
		config.primary = Primary.textKey
	end
	if Secondary ~= nil and v2 ~= nil then
		config.secondary = Secondary.textKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local t = {}
	
	if v1 ~= nil then
		t.Primary = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.primary,
			size = InputSize.Small,
			variant = ButtonVariant.SoftEmphasis,
			fillBehavior = FillBehavior.Fill,
			width = UDim.new(1, 0),
			onActivated = v1.onActivate,
			testId = `{TestId}.Primary`
		})
		
		if v2 ~= nil then
			t.Secondary = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.secondary,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = v2.onActivate,
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
		Actions = if v1 == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{TestId}.Actions`
		}, t)
	})
end
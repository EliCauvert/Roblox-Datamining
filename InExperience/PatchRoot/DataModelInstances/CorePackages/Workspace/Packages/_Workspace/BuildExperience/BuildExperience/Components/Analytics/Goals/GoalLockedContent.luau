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
local UseGoalLockedTelemetryModule = require(script.Parent.useGoalLockedTelemetry)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseGoalLockedTelemetryModule (copy), ReactModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), View (copy), Text (copy)
	local TestId = p1.testId or "GoalLockedContent"
	local Locked = p1.locked
	local Actions = Locked.actions
	local GoalId = p1.goalId
	local UniverseId = p1.universeId
	
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
	local Id = nil
	local Id1 = nil
	
	if Primary ~= nil and v1 ~= nil then
		config.primary = Primary.textKey
		Id = Primary.id
	end
	if Secondary ~= nil and v2 ~= nil then
		config.secondary = Secondary.textKey
		Id1 = Secondary.id
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseGoalLockedTelemetryModuleResult = UseGoalLockedTelemetryModule(UniverseId, GoalId, Id, Id1)
	local t = {}
	
	if Primary ~= nil and v1 ~= nil then
		t.Primary = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.primary,
			size = InputSize.Small,
			variant = ButtonVariant.SoftEmphasis,
			fillBehavior = FillBehavior.Fill,
			width = UDim.new(1, 0),
			onActivated = function()
				-- upvalues: UseGoalLockedTelemetryModuleResult (copy), Primary (ref), v1 (ref)
				UseGoalLockedTelemetryModuleResult("primary", Primary.id)
				v1.onActivate()
			end,
			testId = `{TestId}.Primary`
		})
		
		if Secondary ~= nil and v2 ~= nil then
			t.Secondary = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.secondary,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = function()
					-- upvalues: UseGoalLockedTelemetryModuleResult (copy), Secondary (ref), v2 (ref)
					UseGoalLockedTelemetryModuleResult("secondary", Secondary.id)
					v2.onActivate()
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
		Actions = if v1 == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{TestId}.Actions`
		}, t)
	})
end
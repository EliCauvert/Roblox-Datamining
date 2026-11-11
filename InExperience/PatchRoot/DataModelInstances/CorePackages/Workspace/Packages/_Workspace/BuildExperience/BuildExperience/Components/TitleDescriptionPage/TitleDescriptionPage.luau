local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local ConfigurationActionTelemetryModule = require(BuildExperience.Telemetry.ConfigurationActionTelemetry)
local FFlagBuildExperienceActionOutcomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceActionOutcomeTelemetry)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Action = ConfigurationActionTelemetryModule.Action
local FailureReason = ConfigurationActionTelemetryModule.FailureReason

local function _(Logged, Title, Description): boolean
	return Logged ~= nil and (Logged.title == Title and Logged.description == Description)
end

local _ = function(Logged, Title, Description)
	-- upvalues: ConfigurationActionTelemetryModule (copy)
	return {
		changedFields = ConfigurationActionTelemetryModule.getChangedFields(Title ~= Logged.title, Description ~= Logged.description)
	}
end

local function logSaveSuccess(UseRefResult, UniverseId, Title, Description)
	-- upvalues: ConfigurationActionTelemetryModule (copy), Action (copy)
	local Current = UseRefResult.current
	
	if Current.loggedSuccess then
		local Logged = Current.logged
		
		if Logged ~= nil and (Logged.title == Title and Logged.description == Description) then return end
	end
	local Saved = Current.saved
	ConfigurationActionTelemetryModule.sendSuccess(Action.ExperienceDetailsSave, { universeId = UniverseId }, nil, {
		changedFields = ConfigurationActionTelemetryModule.getChangedFields(Title ~= Saved.title, Description ~= Saved.description)
	})
	local Logged = { title = Title, description = Description }
	UseRefResult.current = { loggedSuccess = true, saved = Logged, logged = Logged }
end

local function logSaveFailure(UseRefResult, UniverseId, Title, Description, p1)
	-- upvalues: ConfigurationActionTelemetryModule (copy), Action (copy), FailureReason (copy)
	local Current = UseRefResult.current
	local Logged = Current.logged
	
	if Logged == nil or (Logged.title ~= Title or Logged.description ~= Description) then
		local Saved = Current.saved
		ConfigurationActionTelemetryModule.sendFailure(Action.ExperienceDetailsSave, { universeId = UniverseId }, { reason = FailureReason.RequestFailed, error = p1 }, nil, {
			changedFields = ConfigurationActionTelemetryModule.getChangedFields(Title ~= Saved.title, Description ~= Saved.description)
		})
		UseRefResult.current = {
			loggedSuccess = false,
			saved = Current.saved,
			logged = { title = Title, description = Description }
		}
		
		return
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceActionOutcomeTelemetryModule (copy), GameConfigurationActionsModule (copy), logSaveSuccess (copy), logSaveFailure (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), TextInput (copy), TextArea (copy)
	local TestId = p1.testId or "title-description-page"
	local TitleText = p1.titleText or ""
	local DescriptionText = p1.descriptionText or ""
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(TitleText)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(DescriptionText)
	local UseLocalizationResult = UseLocalizationFunction({
		descriptionLabel = LocalizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
		title = LocalizationStringsModule.TITLE_DESCRIPTION_TITLE,
		titleLabel = LocalizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
	})
	local DescriptionLabel = UseLocalizationResult.descriptionLabel
	local Title = UseLocalizationResult.title
	local TitleLabel = UseLocalizationResult.titleLabel
	local UseRefResult = if FFlagBuildExperienceActionOutcomeTelemetryModule then ReactModule.useRef({
		logged = nil,
		loggedSuccess = false,
		saved = { title = TitleText, description = DescriptionText }
	}) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseBindingResult (copy), UseBindingResult1 (copy), TitleText (copy), DescriptionText (copy), GameConfigurationActionsModule (upval), FFlagBuildExperienceActionOutcomeTelemetryModule (upval), logSaveSuccess (upval), UseRefResult (copy), logSaveFailure (upval)
		local UniverseId = p1.universeId
		
		if UniverseId == nil then return end
		local Value = UseBindingResult:getValue()
		local Value1 = UseBindingResult1:getValue()
		
		if Value == TitleText and Value1 == DescriptionText then return end
		local UpdateTitleDescriptionResult = GameConfigurationActionsModule.updateTitleDescription(UniverseId, Value, Value1)
		
		if FFlagBuildExperienceActionOutcomeTelemetryModule then
			UpdateTitleDescriptionResult = UpdateTitleDescriptionResult:andThen(function()
				-- upvalues: logSaveSuccess (upval), UseRefResult (upval), UniverseId (copy), Value (copy), Value1 (copy)
				logSaveSuccess(UseRefResult, UniverseId, Value, Value1)
			end)
		end
		UpdateTitleDescriptionResult:catch(function(Err)
			-- upvalues: FFlagBuildExperienceActionOutcomeTelemetryModule (upval), logSaveFailure (upval), UseRefResult (upval), UniverseId (copy), Value (copy), Value1 (copy)
			warn(`[BuildExperience] Failed to save title and description: {tostring(Err)}`)
			
			if FFlagBuildExperienceActionOutcomeTelemetryModule then
				logSaveFailure(UseRefResult, UniverseId, Value, Value1, Err)
			end
		end)
	end, {
		UseBindingResult1,
		DescriptionText,
		TitleText,
		p1.universeId,
		UseBindingResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["composition-layout-detail"] = true,
			["col align-x-center size-full bg-surface-0"] = true
		},
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium",
			testId = `{TestId}-header`
		}, {
			Back = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = IconName.ArrowLargeLeft,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseResult (copy), p1 (copy)
					UseResult()
					p1.onBack()
				end, { p1.onBack, UseResult }),
				size = InputSize.Medium,
				variant = ButtonVariant.Utility,
				testId = `{TestId}-back`
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = Title
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "composition-content-body col gap-xlarge size-full-0 auto-y padding-y-large",
			testId = `{TestId}-content-body`
		}, {
			TitleInput = ReactModule.createElement(TextInput, {
				LayoutOrder = 1,
				label = TitleLabel,
				placeholder = p1.titlePlaceholder,
				text = UseBindingResult,
				width = UDim.new(1, 0),
				onChanged = UseBindingResult2,
				onFocusLost = UseResult,
				testId = `{TestId}-title-input`
			}),
			DescriptionInput = ReactModule.createElement(TextArea, {
				LayoutOrder = 2,
				numLines = 4,
				label = DescriptionLabel,
				placeholder = p1.descriptionPlaceholder,
				text = UseBindingResult1,
				width = UDim.new(1, 0),
				onChanged = UseBindingResult2_1,
				onFocusLost = UseResult,
				testId = `{TestId}-description-input`
			})
		})
	})
end
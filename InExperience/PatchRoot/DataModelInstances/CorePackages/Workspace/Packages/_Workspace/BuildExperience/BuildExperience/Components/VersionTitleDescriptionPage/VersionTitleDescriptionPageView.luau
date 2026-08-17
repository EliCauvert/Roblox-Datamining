local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 33 | named "VersionTitleDescriptionPageView" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), textInput (ref), textArea (ref)
	local TITLE_DESCRIPTION_DESCRIPTION_LABEL, TITLE_DESCRIPTION_TITLE_LABEL, PUBLISH_VERSION_TITLE_DESCRIPTION
	local var5 = if fFlagBuildLocalization then useLocalization({
		descriptionLabel = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
		titleLabel = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL,
		versionTitleDescription = localizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = var5.descriptionLabel
		TITLE_DESCRIPTION_TITLE_LABEL = var5.titleLabel
		PUBLISH_VERSION_TITLE_DESCRIPTION = var5.versionTitleDescription
	else
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL
		TITLE_DESCRIPTION_TITLE_LABEL = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
		PUBLISH_VERSION_TITLE_DESCRIPTION = localizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	end
	if p0.isReady then
		local testId = p0.testId or "version-title-description-page"
		
		return reactModule.createElement(view, {
			tag = "col align-x-center size-full bg-surface-0",
			LayoutOrder = p0.layoutOrder,
			testId = testId
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium",
				testId = `{testId}-header`
			}, {
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					icon = iconName.ArrowLargeLeft,
					onActivated = p0.onBack,
					size = inputSize.Medium,
					variant = buttonVariant.Utility,
					testId = `{testId}-back`
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
					Text = PUBLISH_VERSION_TITLE_DESCRIPTION,
					testId = `{testId}-title`
				})
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "composition-content-body col gap-xlarge size-full-0 auto-y padding-y-large",
				testId = `{testId}-content-body`
			}, {
				TitleInput = reactModule.createElement(textInput, {
					LayoutOrder = 1,
					label = TITLE_DESCRIPTION_TITLE_LABEL,
					text = p0.titleText,
					width = UDim.new(1, 0),
					onChanged = p0.onTitleChanged,
					onFocusLost = p0.onFocusLost,
					testId = `{testId}-title-input`
				}),
				DescriptionInput = reactModule.createElement(textArea, {
					LayoutOrder = 2,
					numLines = 4,
					label = TITLE_DESCRIPTION_DESCRIPTION_LABEL,
					text = p0.descriptionText,
					width = UDim.new(1, 0),
					onChanged = p0.onDescriptionChanged,
					onFocusLost = p0.onFocusLost,
					testId = `{testId}-description-input`
				})
			})
		})
	end
	return nil
end
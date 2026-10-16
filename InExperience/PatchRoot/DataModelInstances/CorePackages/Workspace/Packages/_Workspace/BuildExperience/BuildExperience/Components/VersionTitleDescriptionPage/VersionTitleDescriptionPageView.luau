local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1) --[[ Line: 30 | Named "VersionTitleDescriptionPageView" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), TextInput (copy), TextArea (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		descriptionLabel = LocalizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
		titleLabel = LocalizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL,
		versionTitleDescription = LocalizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	})
	local DescriptionLabel = UseLocalizationResult.descriptionLabel
	local TitleLabel = UseLocalizationResult.titleLabel
	local VersionTitleDescription = UseLocalizationResult.versionTitleDescription
	
	if p1.isReady then
		local TestId = p1.testId or "version-title-description-page"
		
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
					onActivated = p1.onBack,
					size = InputSize.Medium,
					variant = ButtonVariant.Utility,
					testId = `{TestId}-back`
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
					Text = VersionTitleDescription,
					testId = `{TestId}-title`
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
					text = p1.titleText,
					width = UDim.new(1, 0),
					onChanged = p1.onTitleChanged,
					onFocusLost = p1.onFocusLost,
					testId = `{TestId}-title-input`
				}),
				DescriptionInput = ReactModule.createElement(TextArea, {
					LayoutOrder = 2,
					numLines = 4,
					label = DescriptionLabel,
					text = p1.descriptionText,
					width = UDim.new(1, 0),
					onChanged = p1.onDescriptionChanged,
					onFocusLost = p1.onFocusLost,
					testId = `{TestId}-description-input`
				})
			})
		})
	else
		return nil
	end
end
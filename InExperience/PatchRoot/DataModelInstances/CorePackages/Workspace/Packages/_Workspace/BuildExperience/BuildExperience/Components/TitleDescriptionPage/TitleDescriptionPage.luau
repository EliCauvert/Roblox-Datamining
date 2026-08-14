local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 34 | named "TitleDescriptionPage" ]]
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), gameConfigurationActionsModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), textInput (ref), textArea (ref)
	local TITLE_DESCRIPTION_DESCRIPTION_LABEL, TITLE_DESCRIPTION_TITLE, TITLE_DESCRIPTION_TITLE_LABEL
	local testId = p0.testId or "title-description-page"
	local titleText = p0.titleText or ""
	local descriptionText = p0.descriptionText or ""
	local var9, var10 = reactModule.useBinding(titleText)
	local var11, var12 = reactModule.useBinding(descriptionText)
	local var13 = if fFlagBuildLocalization then useLocalization({
		descriptionLabel = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
		title = localizationStringsModule.TITLE_DESCRIPTION_TITLE,
		titleLabel = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = var13.descriptionLabel
		TITLE_DESCRIPTION_TITLE = var13.title
		TITLE_DESCRIPTION_TITLE_LABEL = var13.titleLabel
	else
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL
		TITLE_DESCRIPTION_TITLE = localizationStringsModule.TITLE_DESCRIPTION_TITLE
		TITLE_DESCRIPTION_TITLE_LABEL = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
	end
	local var14 = reactModule.useCallback(function() --[[ line: 61 ]]
		-- upvalues: p0 (ref), var9 (ref), var11 (ref), titleText (ref), descriptionText (ref), gameConfigurationActionsModule (copy)
		local universeId = p0.universeId
		
		if universeId == nil then return end
		local value = var9:getValue()
		local value_1 = var11:getValue()
		
		if value == titleText and value_1 == descriptionText then
			return
		end
		gameConfigurationActionsModule.updateTitleDescription(universeId, value, value_1):catch(function(p1) --[[ line: 74 ]]
			warn(`[BuildExperience] Failed to save title and description: {tostring(p1)}`)
		end)
	end, {
		var11,
		descriptionText,
		titleText,
		p0.universeId,
		var9
	})
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var14 (ref)
		return var14
	end, { var14 })
	
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
				onActivated = reactModule.useCallback(function() --[[ line: 91 ]]
					-- upvalues: var14 (ref), p0 (ref)
					var14()
					p0.onBack()
				end, { p0.onBack, var14 }),
				size = inputSize.Medium,
				variant = buttonVariant.Utility,
				testId = `{testId}-back`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = TITLE_DESCRIPTION_TITLE
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
				placeholder = p0.titlePlaceholder,
				text = var9,
				width = UDim.new(1, 0),
				onChanged = var10,
				onFocusLost = var14,
				testId = `{testId}-title-input`
			}),
			DescriptionInput = reactModule.createElement(textArea, {
				LayoutOrder = 2,
				numLines = 4,
				label = TITLE_DESCRIPTION_DESCRIPTION_LABEL,
				placeholder = p0.descriptionPlaceholder,
				text = var11,
				width = UDim.new(1, 0),
				onChanged = var12,
				onFocusLost = var14,
				testId = `{testId}-description-input`
			})
		})
	})
end
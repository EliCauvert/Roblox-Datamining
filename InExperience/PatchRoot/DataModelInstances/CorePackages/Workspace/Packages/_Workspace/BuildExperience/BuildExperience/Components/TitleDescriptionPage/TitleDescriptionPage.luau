local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), gameConfigurationActionsModule (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), textInput (ref), textArea (ref)
	local TITLE_DESCRIPTION_DESCRIPTION_LABEL, TITLE_DESCRIPTION_TITLE, TITLE_DESCRIPTION_TITLE_LABEL
	local testId = p1.testId or "title-description-page"
	local titleText = p1.titleText or ""
	local descriptionText = p1.descriptionText or ""
	local var1, var2 = reactModule.useBinding(titleText)
	local var3, var4 = reactModule.useBinding(descriptionText)
	local var5 = if fFlagBuildLocalization then useLocalization({
		descriptionLabel = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
		title = localizationStringsModule.TITLE_DESCRIPTION_TITLE,
		titleLabel = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = var5.descriptionLabel
		TITLE_DESCRIPTION_TITLE = var5.title
		TITLE_DESCRIPTION_TITLE_LABEL = var5.titleLabel
	else
		TITLE_DESCRIPTION_DESCRIPTION_LABEL = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL
		TITLE_DESCRIPTION_TITLE = localizationStringsModule.TITLE_DESCRIPTION_TITLE
		TITLE_DESCRIPTION_TITLE_LABEL = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL
	end
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref), titleText (ref), descriptionText (ref), gameConfigurationActionsModule (copy)
		local universeId = p1.universeId
		
		if universeId == nil then return end
		local value = var1:getValue()
		local value_1 = var3:getValue()
		
		if value == titleText and value_1 == descriptionText then
			return
		end
		gameConfigurationActionsModule.updateTitleDescription(universeId, value, value_1):catch(function(p2)
			warn(`[BuildExperience] Failed to save title and description: {tostring(p2)}`)
		end)
	end, {
		var3,
		descriptionText,
		titleText,
		p1.universeId,
		var1
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return var6
	end, { var6 })
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["composition-layout-detail"] = fFlagBuildDesktopReadinessModule,
			["col align-x-center size-full bg-surface-0"] = true
		},
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
				onActivated = reactModule.useCallback(function()
					-- upvalues: var6 (ref), p1 (ref)
					var6()
					p1.onBack()
				end, { p1.onBack, var6 }),
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
				placeholder = p1.titlePlaceholder,
				text = var1,
				width = UDim.new(1, 0),
				onChanged = var2,
				onFocusLost = var6,
				testId = `{testId}-title-input`
			}),
			DescriptionInput = reactModule.createElement(textArea, {
				LayoutOrder = 2,
				numLines = 4,
				label = TITLE_DESCRIPTION_DESCRIPTION_LABEL,
				placeholder = p1.descriptionPlaceholder,
				text = var3,
				width = UDim.new(1, 0),
				onChanged = var4,
				onFocusLost = var6,
				testId = `{testId}-description-input`
			})
		})
	})
end
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 31 | named "TitleDescriptionPage" ]]
	-- upvalues: reactModule (ref), gameConfigurationActionsModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), localizationStringsModule (ref), textInput (ref), textArea (ref)
	local testId = p0.testId or "title-description-page"
	local titleText = p0.titleText or ""
	local descriptionText = p0.descriptionText or ""
	local var8, var9 = reactModule.useBinding(titleText)
	local var10, var11 = reactModule.useBinding(descriptionText)
	local var12 = reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), var8 (ref), var10 (ref), titleText (ref), descriptionText (ref), gameConfigurationActionsModule (copy)
		local universeId = p0.universeId
		
		if universeId == nil then return end
		local value = var8:getValue()
		local value_1 = var10:getValue()
		
		if value == titleText and value_1 == descriptionText then
			return
		end
		gameConfigurationActionsModule.updateTitleDescription(universeId, value, value_1):catch(function(p1) --[[ line: 52 ]]
			warn(`[BuildExperience] Failed to save title and description: {tostring(p1)}`)
		end)
	end, {
		var10,
		descriptionText,
		titleText,
		p0.universeId,
		var8
	})
	reactModule.useEffect(function() --[[ line: 65 ]]
		-- upvalues: var12 (ref)
		return var12
	end, { var12 })
	
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
				onActivated = reactModule.useCallback(function() --[[ line: 69 ]]
					-- upvalues: var12 (ref), p0 (ref)
					var12()
					p0.onBack()
				end, { p0.onBack, var12 }),
				size = inputSize.Medium,
				variant = buttonVariant.Utility,
				testId = `{testId}-back`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = localizationStringsModule.TITLE_DESCRIPTION_TITLE
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "composition-content-body col gap-xlarge size-full-0 auto-y padding-y-large",
			testId = `{testId}-content-body`
		}, {
			TitleInput = reactModule.createElement(textInput, {
				LayoutOrder = 1,
				label = localizationStringsModule.TITLE_DESCRIPTION_TITLE_LABEL,
				placeholder = p0.titlePlaceholder,
				text = var8,
				width = UDim.new(1, 0),
				onChanged = var9,
				onFocusLost = var12,
				testId = `{testId}-title-input`
			}),
			DescriptionInput = reactModule.createElement(textArea, {
				LayoutOrder = 2,
				numLines = 4,
				label = localizationStringsModule.TITLE_DESCRIPTION_DESCRIPTION_LABEL,
				placeholder = p0.descriptionPlaceholder,
				text = var10,
				width = UDim.new(1, 0),
				onChanged = var11,
				onFocusLost = var12,
				testId = `{testId}-description-input`
			})
		})
	})
end
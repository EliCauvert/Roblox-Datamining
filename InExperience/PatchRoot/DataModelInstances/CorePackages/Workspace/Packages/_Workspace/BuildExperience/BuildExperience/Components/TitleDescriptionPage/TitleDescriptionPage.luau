local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 30 | named "TitleDescriptionPage" ]]
	-- upvalues: reactModule (ref), gameConfigurationActionsModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), textInput (ref), textArea (ref)
	local testId = p0.testId or "title-description-page"
	local titleText = p0.titleText or ""
	local descriptionText = p0.descriptionText or ""
	local var7, var8 = reactModule.useBinding(titleText)
	local var9, var10 = reactModule.useBinding(descriptionText)
	local var11 = reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: p0 (ref), var7 (ref), var9 (ref), titleText (ref), descriptionText (ref), gameConfigurationActionsModule (copy)
		local universeId = p0.universeId
		
		if universeId == nil then return end
		local value = var7:getValue()
		local value_1 = var9:getValue()
		
		if value == titleText and value_1 == descriptionText then
			return
		end
		gameConfigurationActionsModule.updateTitleDescription(universeId, value, value_1):catch(function(p1) --[[ line: 51 ]]
			warn(`[BuildExperience] Failed to save title and description: {tostring(p1)}`)
		end)
	end, {
		var9,
		descriptionText,
		titleText,
		p0.universeId,
		var7
	})
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var11 (ref)
		return var11
	end, { var11 })
	
	return reactModule.createElement(view, {
		tag = "col size-full bg-surface-0",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ArrowLargeLeft,
				onActivated = reactModule.useCallback(function() --[[ line: 68 ]]
					-- upvalues: var11 (ref), p0 (ref)
					var11()
					p0.onBack()
				end, { p0.onBack, var11 }),
				size = inputSize.Medium,
				variant = buttonVariant.Utility,
				testId = `{testId}-back`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = "Title & Description",
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis"
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-xlarge size-full-0 auto-y padding-large"
		}, {
			TitleInput = reactModule.createElement(textInput, {
				LayoutOrder = 1,
				label = "Title",
				placeholder = p0.titlePlaceholder,
				text = var7,
				width = UDim.new(1, 0),
				onChanged = var8,
				onFocusLost = var11,
				testId = `{testId}-title-input`
			}),
			DescriptionInput = reactModule.createElement(textArea, {
				LayoutOrder = 2,
				label = "Description",
				numLines = 4,
				placeholder = p0.descriptionPlaceholder,
				text = var9,
				width = UDim.new(1, 0),
				onChanged = var10,
				onFocusLost = var11,
				testId = `{testId}-description-input`
			})
		})
	})
end
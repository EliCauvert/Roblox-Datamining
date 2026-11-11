local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), GameConfigurationActionsModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), TextInput (copy), TextArea (copy)
	local TestId = p1.testId or "title-description-page"
	local TitleText = p1.titleText or ""
	local DescriptionText = p1.descriptionText or ""
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(TitleText)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(DescriptionText)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseBindingResult (copy), UseBindingResult1 (copy), TitleText (copy), DescriptionText (copy), GameConfigurationActionsModule (upval)
		local UniverseId = p1.universeId
		
		if UniverseId == nil then return end
		local Value = UseBindingResult:getValue()
		local Value1 = UseBindingResult1:getValue()
		
		if Value ~= TitleText or Value1 ~= DescriptionText then
			GameConfigurationActionsModule.updateTitleDescription(UniverseId, Value, Value1):catch(function(Err)
				warn(`[BuildExperience] Failed to save title and description: {tostring(Err)}`)
			end)
			
			return
		end
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
		tag = "col align-x-center size-full bg-surface-0",
		LayoutOrder = p1.layoutOrder,
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
				Text = "Title & Description",
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis"
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "composition-content-body col gap-xlarge size-full-0 auto-y padding-y-large",
			testId = `{TestId}-content-body`
		}, {
			TitleInput = ReactModule.createElement(TextInput, {
				LayoutOrder = 1,
				label = "Title",
				placeholder = p1.titlePlaceholder,
				text = UseBindingResult,
				width = UDim.new(1, 0),
				onChanged = UseBindingResult2,
				onFocusLost = UseResult,
				testId = `{TestId}-title-input`
			}),
			DescriptionInput = ReactModule.createElement(TextArea, {
				LayoutOrder = 2,
				label = "Description",
				numLines = 4,
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
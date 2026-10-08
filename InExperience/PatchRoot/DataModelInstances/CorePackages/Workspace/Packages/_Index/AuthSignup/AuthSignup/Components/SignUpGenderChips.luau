local parent = script:FindFirstAncestor("AuthSignup").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userGender = require(parent.AuthCommon).Enums.UserGender
local view = foundationModule.View
local chip = foundationModule.Chip
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local chipSize = foundationModule.Enums.ChipSize
local iconName = foundationModule.Enums.IconName

return function(value)
	-- upvalues: reactModule (ref), view (ref), inputLabel (ref), inputLabelSize (ref), chip (ref), iconName (ref), chipSize (ref), userGender (ref)
	local onGenderSelected = value.onGenderSelected
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = value.LayoutOrder
	}, {
		Label = reactModule.createElement(inputLabel, {
			LayoutOrder = 1,
			Text = value.label,
			size = inputLabelSize.Medium
		}),
		Options = reactModule.createElement(view, { tag = "row gap-small auto-xy", LayoutOrder = 2 }, {
			Female = reactModule.createElement(chip, {
				LayoutOrder = 1,
				testId = "--auth-signup-gender-female",
				text = value.femaleText,
				leading = iconName.HeadFemale,
				size = chipSize.Large,
				isChecked = value.gender == userGender.Female,
				onActivated = function()
					-- upvalues: onGenderSelected (ref), userGender (copy)
					onGenderSelected(userGender.Female)
				end
			}),
			Male = reactModule.createElement(chip, {
				LayoutOrder = 2,
				testId = "--auth-signup-gender-male",
				text = value.maleText,
				leading = iconName.HeadMale,
				size = chipSize.Large,
				isChecked = value.gender == userGender.Male,
				onActivated = function()
					-- upvalues: onGenderSelected (ref), userGender (copy)
					onGenderSelected(userGender.Male)
				end
			})
		})
	})
end
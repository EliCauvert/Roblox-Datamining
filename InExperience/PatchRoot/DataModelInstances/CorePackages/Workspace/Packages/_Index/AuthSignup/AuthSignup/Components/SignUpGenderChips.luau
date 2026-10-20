local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AuthCommonModule = require(Parent.AuthCommon)
local UserGender = AuthCommonModule.Enums.UserGender
local FormatBoldRichTextFunction = AuthCommonModule.Utils.formatBoldRichText
local View = FoundationModule.View
local Chip = FoundationModule.Chip
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local ChipSize = FoundationModule.Enums.ChipSize
local IconName = FoundationModule.Enums.IconName

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), InputLabel (copy), FormatBoldRichTextFunction (copy), InputLabelSize (copy), Chip (copy), IconName (copy), ChipSize (copy), UserGender (copy)
	local OnGenderSelectedFunction = Frame.onGenderSelected
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(InputLabel, {
			LayoutOrder = 1,
			Text = if Frame.isLabelBold then FormatBoldRichTextFunction(Frame.label) else Frame.label,
			RichText = Frame.isLabelBold,
			size = InputLabelSize.Medium
		}),
		Options = ReactModule.createElement(View, { tag = "row gap-small auto-xy", LayoutOrder = 2 }, {
			Female = ReactModule.createElement(Chip, {
				LayoutOrder = 1,
				testId = "--auth-signup-gender-female",
				text = Frame.femaleText,
				leading = IconName.HeadFemale,
				size = ChipSize.Large,
				isChecked = Frame.gender == UserGender.Female,
				onActivated = function()
					-- upvalues: OnGenderSelectedFunction (copy), UserGender (upval)
					OnGenderSelectedFunction(UserGender.Female)
				end
			}),
			Male = ReactModule.createElement(Chip, {
				LayoutOrder = 2,
				testId = "--auth-signup-gender-male",
				text = Frame.maleText,
				leading = IconName.HeadMale,
				size = ChipSize.Large,
				isChecked = Frame.gender == UserGender.Male,
				onActivated = function()
					-- upvalues: OnGenderSelectedFunction (copy), UserGender (upval)
					OnGenderSelectedFunction(UserGender.Male)
				end
			})
		})
	})
end
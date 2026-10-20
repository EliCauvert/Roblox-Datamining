local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Text = FoundationModule.Text
local View = FoundationModule.View
local LayoutToggleButtonModule = require(PeopleReactView.Components.Buttons.LayoutToggleButton)
local ConstantsModule = require(PeopleReactView.Constants)

return ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), View (copy), Text (copy), LayoutToggleButtonModule (copy)
	return ReactModule.createElement(View, {
		tag = "row size-full-0 auto-y align-y-center flex-x-between",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			tag = "auto-xy content-default text-heading-small text-align-x-left",
			LayoutOrder = 1,
			Text = UseLocalizationFunction({ header = ConstantsModule.PEOPLEPAGE.PEOPLE_LIST.HEADER }).header
		}),
		LayoutToggleButton = ReactModule.createElement(LayoutToggleButtonModule, {
			LayoutOrder = 2,
			layout = Frame.layout,
			setLayout = Frame.setLayout
		})
	})
end)
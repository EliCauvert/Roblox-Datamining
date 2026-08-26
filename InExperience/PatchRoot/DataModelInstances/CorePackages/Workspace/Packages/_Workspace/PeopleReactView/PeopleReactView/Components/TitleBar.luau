local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local text = foundationModule.Text
local view = foundationModule.View
local layoutToggleButtonModule = require(peopleReactView.Components.Buttons.LayoutToggleButton)
local constantsModule = require(peopleReactView.Constants)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), constantsModule (ref), reactModule (ref), view (ref), text (ref), layoutToggleButtonModule (ref)
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y align-y-center flex-x-between",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = reactModule.createElement(text, {
			tag = "auto-xy content-default text-heading-small text-align-x-left",
			LayoutOrder = 1,
			Text = useLocalization({ header = constantsModule.PEOPLEPAGE.PEOPLE_LIST.HEADER }).header
		}),
		LayoutToggleButton = reactModule.createElement(layoutToggleButtonModule, {
			LayoutOrder = 2,
			layout = p1.layout,
			setLayout = p1.setLayout
		})
	})
end)
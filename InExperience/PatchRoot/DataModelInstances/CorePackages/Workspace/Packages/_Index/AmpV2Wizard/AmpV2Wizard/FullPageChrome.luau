local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Divider = FoundationModule.Divider
local HeaderBar = FoundationModule.HeaderBar
local IconName = FoundationModule.Enums.IconName
local FFlagAmpV2WizardFullPageHeaderAlignModule = require(AmpV2Wizard.FFlagAmpV2WizardFullPageHeaderAlign)

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconName (copy), Text (copy), FFlagAmpV2WizardFullPageHeaderAlignModule (copy), View (copy), Divider (copy)
	local OnBack = p1.onBack
	local OnClose = p1.onClose
	local Title = p1.title
	local Element = ReactModule.createElement(HeaderBar.Root, { LayoutOrder = 1 }, {
		Leading = if OnBack == nil and (Title == nil or Title == "") then nil else ReactModule.createElement(HeaderBar.Leading, nil, {
			Actions = if OnBack == nil then nil else ReactModule.createElement(HeaderBar.Actions, {
				actions = {
					{
						id = "back",
						icon = IconName.ChevronLargeLeft,
						onActivated = OnBack
					}
				}
			}),
			Title = if Title == nil or Title == "" then nil else ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-medium content-emphasis",
				LayoutOrder = 2,
				Text = Title
			})
		}),
		Trailing = if OnClose == nil then nil else ReactModule.createElement(HeaderBar.Trailing, nil, {
			Actions = ReactModule.createElement(HeaderBar.Actions, {
				actions = {
					{ id = "close", icon = IconName.X, onActivated = OnClose }
				}
			})
		})
	})
	
	return if FFlagAmpV2WizardFullPageHeaderAlignModule then ReactModule.createElement(View, {
		tag = "col align-x-center size-full bg-surface-0",
		testId = "amp-v2-wizard-full-page"
	}, {
		Column = ReactModule.createElement(View, {
			tag = "col fill size-full-0",
			testId = "amp-v2-wizard-full-page-column",
			sizeConstraint = { MaxSize = Vector2.new(480, 1e999) }
		}, {
			Header = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-small",
				LayoutOrder = 1,
				testId = "amp-v2-wizard-full-page-header"
			}, { Bar = Element }),
			Content = ReactModule.createElement(View, {
				tag = "col fill size-full-0",
				LayoutOrder = 2,
				testId = "amp-v2-wizard-full-page-content"
			}, p1.children)
		})
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center size-full bg-surface-0",
		testId = "amp-v2-wizard-full-page"
	}, {
		Header = Element,
		HeaderDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 }),
		Content = ReactModule.createElement(View, {
			tag = "col fill size-full-0",
			LayoutOrder = 3,
			sizeConstraint = { MaxSize = Vector2.new(480, 1e999) }
		}, p1.children)
	})
end
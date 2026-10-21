local HelpPage = script:FindFirstAncestor("HelpPage")
local ReactModule = require(HelpPage.Parent.React)
local _ = require(HelpPage.Components.Common.ActionText)
local DiagramLayoutViewModule = require(HelpPage.Components.Common.DiagramLayoutView)
local TouchControlListModule = require(HelpPage.Components.Touch.TouchControlList)
local TouchDeviceMockModule = require(HelpPage.Components.Touch.TouchDeviceMock)
local TouchHelpPageModule = require(HelpPage.Components.Touch.TouchHelpPage)

return function(p1)
	-- upvalues: ReactModule (copy), TouchHelpPageModule (copy), DiagramLayoutViewModule (copy), TouchControlListModule (copy), TouchDeviceMockModule (copy)
	if p1.abilitiesAvailable then
		local TitleLarge: string = if p1.layout.columnWidth == 0.5 then "title-large" else "label-small"
		
		return ReactModule.createElement(DiagramLayoutViewModule, {
			testId = "Touch",
			diagramTestId = "TouchDiagram",
			layout = p1.layout,
			onSizeChanged = p1.onSizeChanged,
			onLeftSizeChanged = p1.onLeftSizeChanged,
			onRightSizeChanged = p1.onRightSizeChanged,
			left = ReactModule.createElement(TouchControlListModule, {
				layoutOrderReversed = false,
				showIconBackground = false,
				controls = p1.leftControls,
				textVariant = TitleLarge
			}),
			right = ReactModule.createElement(TouchControlListModule, {
				layoutOrderReversed = true,
				controls = p1.rightControls,
				textVariant = TitleLarge
			}),
			renderDiagram = function(p2)
				-- upvalues: ReactModule (upval), TouchDeviceMockModule (upval), p1 (copy)
				return ReactModule.createElement(TouchDeviceMockModule, {
					centerControl = p1.centerControl,
					slots = p1.slots,
					layout = p1.mockLayout,
					scale = p2.X / p1.mockLayout.size.X
				})
			end
		})
	else
		return ReactModule.createElement(TouchHelpPageModule)
	end
end
local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue

local function noop() end

return function(p1)
	-- upvalues: noop (copy), UseScaledValueFunction (copy), ReactModule (copy), Skeleton (copy), Radius (copy), Sheet (copy), Text (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local OnClose = p1.onClose or noop
	local UseScaledValueResult = UseScaledValueFunction(330)
	local Elements = {}
	
	for i = 1, 3 do
		Elements[`Placeholder{i}`] = ReactModule.createElement(Skeleton, {
			LayoutOrder = i,
			radius = Radius.Medium,
			Size = UDim2.new(1, 0, 0, 48)
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		testId = "publish-game-sheet",
		isOpen = p1.isOpen == nil or p1.isOpen,
		snapPoints = { UseScaledValueResult },
		onClose = OnClose
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				Text = "Configure game",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, Elements),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			ActionsColumn = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
				PublishButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = "Publish",
					testId = "publish-game-sheet-publish-button",
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					width = UDim.new(1, 0),
					onActivated = noop
				}),
				Caption = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = "Your experience reach depends on verification criteria.",
					tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-center content-default"
				})
			})
		})
	})
end
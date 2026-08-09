local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useScaledValue = foundationModule.Hooks.useScaledValue

local function noop() --[[ line: 31 ]] end

return function(p0) --[[ line: 33 | named "PublishGameSheet" ]]
	-- upvalues: noop (ref), useScaledValue (ref), reactModule (ref), skeleton (ref), radius (ref), sheet (ref), text (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local onClose = p0.onClose or noop
	local var4 = useScaledValue(330)
	local t = {}
	
	for i = 1, 3 do
		t[`Placeholder{i}`] = reactModule.createElement(skeleton, {
			LayoutOrder = i,
			radius = radius.Medium,
			Size = UDim2.new(1, 0, 0, 48)
		})
	end
	return reactModule.createElement(sheet.Root, {
		testId = "publish-game-sheet",
		isOpen = p0.isOpen == nil or p0.isOpen,
		snapPoints = { var4 },
		onClose = onClose
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				Text = "Configure game",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, t),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			ActionsColumn = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
				PublishButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = "Publish",
					testId = "publish-game-sheet-publish-button",
					variant = buttonVariant.Emphasis,
					size = inputSize.Medium,
					width = UDim.new(1, 0),
					onActivated = noop
				}),
				Caption = reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = "Your experience reach depends on verification criteria.",
					tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-center content-default"
				})
			})
		})
	})
end
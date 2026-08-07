local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useScaledValue = foundationModule.Hooks.useScaledValue

local function noop() --[[ line: 29 ]] end

return function(p0) --[[ line: 31 | named "PublishGameSheet" ]]
	-- upvalues: noop (ref), useScaledValue (ref), reactModule (ref), skeleton (ref), radius (ref), sheet (ref), text (ref), localizationStringsModule (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local onClose = p0.onClose or noop
	local var6 = useScaledValue(330)
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
		snapPoints = { var6 },
		onClose = onClose
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = localizationStringsModule.PUBLISH_GAME_SHEET_TITLE
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, t),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			ActionsColumn = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
				PublishButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					testId = "publish-game-sheet-publish-button",
					text = localizationStringsModule.PUBLISH_GAME_SHEET_PUBLISH,
					variant = buttonVariant.Emphasis,
					size = inputSize.Medium,
					width = UDim.new(1, 0),
					onActivated = noop
				}),
				Caption = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-center content-default",
					Text = localizationStringsModule.PUBLISH_GAME_SHEET_CAPTION
				})
			})
		})
	})
end
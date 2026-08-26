local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useSelector = require(virtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local emptyState = UIBloxModule.App.Indicator.EmptyState

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useSelector (ref), selectScreenSize (ref), useLocalization (ref), reactModule (ref), partialPageModal (ref), emptyState (ref)
	return reactModule.createElement(partialPageModal, {
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		screenSize = useSelector(selectScreenSize) - Vector2.new(40, 0),
		contentPadding = UDim.new(0, 24),
		onCloseClicked = p1.onClose
	}, {
		Wrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 80),
				PaddingBottom = UDim.new(0, 20)
			}),
			EventNotFound = reactModule.createElement(emptyState, {
				text = useLocalization({ notFound = "Feature.VirtualEvents.EventNotFound" }).notFound
			})
		})
	})
end
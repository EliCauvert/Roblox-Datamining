local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseSelectorFunction = require(VirtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local EmptyState = UIBloxModule.App.Indicator.EmptyState

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), ReactModule (copy), PartialPageModal (copy), EmptyState (copy)
	return ReactModule.createElement(PartialPageModal, {
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		screenSize = UseSelectorFunction(selectScreenSize) - Vector2.new(40, 0),
		contentPadding = UDim.new(0, 24),
		onCloseClicked = p1.onClose
	}, {
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 80),
				PaddingBottom = UDim.new(0, 20)
			}),
			EventNotFound = ReactModule.createElement(EmptyState, {
				text = UseLocalizationFunction({ notFound = "Feature.VirtualEvents.EventNotFound" }).notFound
			})
		})
	})
end
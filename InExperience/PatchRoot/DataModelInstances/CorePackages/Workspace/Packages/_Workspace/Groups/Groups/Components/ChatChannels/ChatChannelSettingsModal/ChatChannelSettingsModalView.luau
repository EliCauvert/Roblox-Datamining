local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.Parent.ChatChannelSettingsFlow.ChatChannelSettingsFlowLayout)
local SnapPoints = { 1 }

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), SnapPoints (copy)
	return ReactModule.createElement(FoundationModule.Sheet.Root, {
		preferCenterSheet = true,
		ref = p1.containerRef,
		centerSheetHeight = if p1.sizeToContent then nil else 1,
		size = FoundationModule.Enums.DialogSize.Medium,
		snapPoints = SnapPoints,
		onClose = p1.onClose,
		testId = p1.testId
	}, {
		Header = ReactModule.createElement(FoundationModule.Sheet.Header, { hasCloseAffordance = not p1.hideCloseButton }, p1.header),
		[p1.contentKey] = ReactModule.createElement(FoundationModule.Sheet.Content, { isContentFullBleed = true }, p1.body),
		Actions = if p1.actions then ReactModule.createElement(FoundationModule.Sheet.Actions, nil, p1.actions) else nil
	})
end
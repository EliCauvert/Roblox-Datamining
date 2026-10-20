local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local IconWithTextCellModule = require(AppChat.Components.Cells.IconWithTextCell)
local RoactFitComponents = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local config = {
	leaveGroupText = "leaveGroupText",
	onActivated = nil,
	iconImage = nil,
	cellHeight = 64,
	iconCellWidth = 60,
	marginTop = 12,
	LayoutOrder = 0,
	style = nil
}

function LeaveGroupCell(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), RoactFitComponents (copy), IconWithTextCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(RoactFitComponents.FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.LayoutOrder,
		width = UDim.new(1, 0),
		margin = {
			left = 0,
			right = 0,
			bottom = 0,
			top = JoinResult.marginTop
		}
	}, {
		LeaveGroupRow = ReactModule.createElement(IconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = JoinResult.LayoutOrder,
			onActivated = JoinResult.onActivated,
			primaryIcon = JoinResult.iconImage,
			Size = UDim2.new(1, 0, 0, JoinResult.cellHeight),
			style = JoinResult.style,
			Text = JoinResult.leaveGroupText,
			iconCellWidth = JoinResult.iconCellWidth,
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsListActionButton(JoinResult.leaveGroupText) else nil
		})
	})
end

return MemoFunction(LeaveGroupCell)
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local iconWithTextCellModule = require(appChat.Components.Cells.IconWithTextCell)
local roactFitComponents = require(parent.LuaSocialLibrariesDeps).RoactFitComponents
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local t = {
	leaveGroupText = "leaveGroupText",
	onActivated = nil,
	iconImage = nil,
	cellHeight = 64,
	iconCellWidth = 60,
	marginTop = 12,
	LayoutOrder = 0,
	style = nil
}

function LeaveGroupCell(p0) --[[ line: 37 ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), roactFitComponents (ref), iconWithTextCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	
	return reactModule.createElement(roactFitComponents.FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = var7.LayoutOrder,
		width = UDim.new(1, 0),
		margin = { left = 0, right = 0, bottom = 0, top = var7.marginTop }
	}, {
		LeaveGroupRow = reactModule.createElement(iconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = var7.LayoutOrder,
			onActivated = var7.onActivated,
			primaryIcon = var7.iconImage,
			Size = UDim2.new(1, 0, 0, var7.cellHeight),
			style = var7.style,
			Text = var7.leaveGroupText,
			iconCellWidth = var7.iconCellWidth,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton(var7.leaveGroupText) else nil
		})
	})
end

return memo(LeaveGroupCell)
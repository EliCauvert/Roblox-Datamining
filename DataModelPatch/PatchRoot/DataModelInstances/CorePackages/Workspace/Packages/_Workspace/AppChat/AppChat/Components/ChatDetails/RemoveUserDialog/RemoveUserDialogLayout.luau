local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local RemoveUserDialogModule = require(script.Parent.RemoveUserDialog)
local t = {}

function RemoveUserDialogLayout(p1)
	-- upvalues: CryoModule (copy), t (copy), UseStyleFunction (copy), ReactModule (copy), RemoveUserDialogModule (copy), ResponseIndicator (copy)
	local JoinResult = CryoModule.Dictionary.join(t, p1)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		RemoveUserDialog = JoinResult.isModalVisible and ReactModule.createElement(RemoveUserDialogModule, JoinResult),
		ResponseIndicator = JoinResult.isLoading and ReactModule.createElement(ResponseIndicator, {
			soakAreaColor3 = UseStyleResult.Theme.Overlay.Color,
			soakAreaTransparency = UseStyleResult.Theme.Overlay.Transparency
		})
	})
end

return MemoFunction(RemoveUserDialogLayout)
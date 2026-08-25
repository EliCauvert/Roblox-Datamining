local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local socialLibrariesModule = require(appChat.SocialLibraries)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local responseIndicator = socialLibrariesModule.Components.ResponseIndicator
local removeUserDialogModule = require(script.Parent.RemoveUserDialog)
local t = {}

function RemoveUserDialogLayout(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), removeUserDialogModule (ref), responseIndicator (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyle()
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		RemoveUserDialog = var6.isModalVisible and reactModule.createElement(removeUserDialogModule, var6),
		ResponseIndicator = var6.isLoading and reactModule.createElement(responseIndicator, {
			soakAreaColor3 = var7.Theme.Overlay.Color,
			soakAreaTransparency = var7.Theme.Overlay.Transparency
		})
	})
end

return memo(RemoveUserDialogLayout)
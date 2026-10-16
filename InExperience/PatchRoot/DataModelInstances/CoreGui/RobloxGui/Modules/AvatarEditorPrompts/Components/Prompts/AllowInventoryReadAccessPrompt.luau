local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local SetAllowInventoryReadAccessModule = require(script.Parent.Parent.Parent.Thunks.SetAllowInventoryReadAccess)
local AllowInventoryReadAccessPrompt = RoactModule.PureComponent:extend("AllowInventoryReadAccessPrompt")
AllowInventoryReadAccessPrompt.validateProps = TModule.strictInterface({
	gameName = TModule.string,
	screenSize = TModule.Vector2,
	setAvatarReadAccessAllowed = TModule.callback,
	setAvatarReadAccessDenied = TModule.callback
})

function AllowInventoryReadAccessPrompt.render(p1) --[[ Line: 31 ]]
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptText", { RBX_NAME = p1.props.gameName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.setAvatarReadAccessDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.setAvatarReadAccessAllowed,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 65 | Named "mapStateToProps" ]]
	return { gameName = p1.gameName, screenSize = p1.screenSize }
end, function(Callback) --[[ Line: 72 | Named "mapDispatchToProps" ]]
	-- upvalues: SetAllowInventoryReadAccessModule (copy)
	return {
		setAvatarReadAccessDenied = function() --[[ Line: 74 ]]
			-- upvalues: Callback (copy), SetAllowInventoryReadAccessModule (upval)
			return Callback(SetAllowInventoryReadAccessModule(false))
		end,
		setAvatarReadAccessAllowed = function() --[[ Line: 78 ]]
			-- upvalues: Callback (copy), SetAllowInventoryReadAccessModule (upval)
			return Callback(SetAllowInventoryReadAccessModule(true))
		end
	}
end)(AllowInventoryReadAccessPrompt)
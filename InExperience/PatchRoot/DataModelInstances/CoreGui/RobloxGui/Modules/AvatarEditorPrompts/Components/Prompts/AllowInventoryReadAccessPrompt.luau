local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local setAllowInventoryReadAccessModule = require(script.Parent.Parent.Parent.Thunks.SetAllowInventoryReadAccess)
local allowInventoryReadAccessPrompt = roactModule.PureComponent:extend("AllowInventoryReadAccessPrompt")
allowInventoryReadAccessPrompt.validateProps = tModule.strictInterface({
	gameName = tModule.string,
	screenSize = tModule.Vector2,
	setAvatarReadAccessAllowed = tModule.callback,
	setAvatarReadAccessDenied = tModule.callback
})

function allowInventoryReadAccessPrompt.render(p0)
	-- upvalues: roactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptText", { RBX_NAME = p0.props.gameName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p0.props.setAvatarReadAccessDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p0.props.setAvatarReadAccessAllowed,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p0.props.screenSize
	})
end

return roactRoduxModule.connect(function(p1)
	return { gameName = p1.gameName, screenSize = p1.screenSize }
end, function(p2)
	-- upvalues: setAllowInventoryReadAccessModule (ref)
	return {
		setAvatarReadAccessDenied = function()
			-- upvalues: p2 (ref), setAllowInventoryReadAccessModule (copy)
			return p2(setAllowInventoryReadAccessModule(false))
		end,
		setAvatarReadAccessAllowed = function()
			-- upvalues: p2 (ref), setAllowInventoryReadAccessModule (copy)
			return p2(setAllowInventoryReadAccessModule(true))
		end
	}
end)(allowInventoryReadAccessPrompt)
local Settings = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings
local UtilityModule = require(Settings.Utility)
local ThemeModule = require(Settings.Theme)
local OnAccountManagementButtonActivatedModule = require(Settings.onAccountManagementButtonActivated)
local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local _UDim2 = UDim2.new(0.6, -10, 0, 35)
local _UDim2_1 = UDim2.new(0.4, 10, 0.5, 0)

return function(p1, p2, p3, p4)
	-- upvalues: UtilityModule (copy), RobloxTranslatorModule (copy), _UDim2 (copy), OnAccountManagementButtonActivatedModule (copy), ThemeModule (copy), _UDim2_1 (copy)
	local AccountManagementButton, AccountManagementButton2, AccountManagementButton3 = UtilityModule:MakeStyledButton("AccountManagementButton", RobloxTranslatorModule:FormatByKey("CommonUI.Messages.Action.View"), _UDim2, function()
		-- upvalues: OnAccountManagementButtonActivatedModule (upval), p3 (copy), p4 (copy)
		OnAccountManagementButtonActivatedModule(p3, p4)
	end, p1)
	AccountManagementButton2.Font = ThemeModule.font(Enum.Font.SourceSans)
	AccountManagementButton.Size = _UDim2
	AccountManagementButton.AnchorPoint = Vector2.new(0, 0.5)
	AccountManagementButton.Position = _UDim2_1
	p1.AccountManagementFrame = UtilityModule:AddNewRowObject(p1, RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AccountManagement"), AccountManagementButton, nil, nil, RobloxTranslatorModule:FormatByKey("CoreScripts.InGameMenu.GameSettings.AccountManagementDescription"))
	p1.AccountManagementFrame.LayoutOrder = p2.AccountManagementFrame
	AccountManagementButton3(p1.AccountManagementFrame)
	
	return p1.AccountManagementFrame, AccountManagementButton
end
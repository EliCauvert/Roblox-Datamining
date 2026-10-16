local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithLocalizationFunction = DependenciesModule.withLocalization
local RoactRodux = DependenciesModule.RoactRodux
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local WithStyleFunction = UIBlox.Style.withStyle
local TextKeysModule = require(Parent.Common.TextKeys)
local ConstantsModule = require(Parent.Common.Constants)
local GetFFlagPassNavigationToContactsRevokedModule = require(Parent.Flags.getFFlagPassNavigationToContactsRevoked)
local ContactsRevokedAccessDialog = Roact.PureComponent:extend("ContactsRevokedAccessDialog")
ContactsRevokedAccessDialog.validateProps = T.strictInterface({ navigation = T.table, screenSize = T.Vector2 })

function ContactsRevokedAccessDialog.render(p1) --[[ Line: 31 ]]
	-- upvalues: WithLocalizationFunction (copy), TextKeysModule (copy), WithStyleFunction (copy), ConstantsModule (copy), GetFFlagPassNavigationToContactsRevokedModule (copy), Roact (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationFunction({
		titleText = TextKeysModule.CONTACTS_LIST_TITLE,
		revokedFlow = TextKeysModule.CONTACTS_REVOKED_FLOW,
		closeModalOk = TextKeysModule.CLOSE_MODAL_OK
	})(function(p2) --[[ Line: 36 ]]
		-- upvalues: WithStyleFunction (upval), p1 (copy), ConstantsModule (upval), GetFFlagPassNavigationToContactsRevokedModule (upval), Roact (upval), InteractiveAlert (upval), ButtonType (upval)
		return WithStyleFunction(function(_) --[[ Line: 37 ]]
			-- upvalues: p1 (upval), ConstantsModule (upval), GetFFlagPassNavigationToContactsRevokedModule (upval), Roact (upval), InteractiveAlert (upval), p2 (copy), ButtonType (upval)
			local Props = p1.props
			local Navigation = Props.navigation
			local Param = Navigation.getParam(ConstantsModule.CLOSE_MODAL) or GetFFlagPassNavigationToContactsRevokedModule() and Navigation.pop
			
			return Roact.createElement(InteractiveAlert, {
				title = p2.titleText,
				screenSize = Props.screenSize,
				buttonStackInfo = {
					buttonHeight = 48,
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = {
								onActivated = function() --[[ Line: 51 ]]
									-- upvalues: Param (copy)
									Param()
								end,
								text = p2.closeModalOk
							}
						}
					},
					forcedFillDirection = Enum.FillDirection.Vertical
				},
				bodyText = p2.revokedFlow
			})
		end)
	end)
end

return RoactRodux.connect(function(p1) --[[ Line: 67 ]]
	return { screenSize = p1.ScreenSize }
end, nil)(ContactsRevokedAccessDialog)
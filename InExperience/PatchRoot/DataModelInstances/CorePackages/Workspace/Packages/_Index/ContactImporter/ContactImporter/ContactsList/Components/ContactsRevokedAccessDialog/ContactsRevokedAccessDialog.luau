local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local t = dependenciesModule.t
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local withLocalization = dependenciesModule.withLocalization
local roactRodux = dependenciesModule.RoactRodux
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Style.withStyle
local textKeysModule = require(parent.Common.TextKeys)
local constantsModule = require(parent.Common.Constants)
local getFFlagPassNavigationToContactsRevokedModule = require(parent.Flags.getFFlagPassNavigationToContactsRevoked)
local contactsRevokedAccessDialog = roact.PureComponent:extend("ContactsRevokedAccessDialog")
contactsRevokedAccessDialog.validateProps = t.strictInterface({ navigation = t.table, screenSize = t.Vector2 })

function contactsRevokedAccessDialog.render(p0) --[[ line: 31 ]]
	-- upvalues: withLocalization (ref), textKeysModule (ref), withStyle (ref), constantsModule (ref), getFFlagPassNavigationToContactsRevokedModule (ref), roact (ref), interactiveAlert (ref), buttonType (ref)
	return withLocalization({
		titleText = textKeysModule.CONTACTS_LIST_TITLE,
		revokedFlow = textKeysModule.CONTACTS_REVOKED_FLOW,
		closeModalOk = textKeysModule.CLOSE_MODAL_OK
	})(function(p1) --[[ line: 36 ]]
		-- upvalues: withStyle (copy), p0 (ref), constantsModule (copy), getFFlagPassNavigationToContactsRevokedModule (copy), roact (copy), interactiveAlert (copy), buttonType (copy)
		return withStyle(function(_) --[[ line: 37 ]]
			-- upvalues: p0 (copy), constantsModule (copy), getFFlagPassNavigationToContactsRevokedModule (copy), roact (copy), interactiveAlert (copy), p1 (ref), buttonType (copy)
			local props = p0.props
			local navigation = props.navigation
			local CLOSE_MODAL = navigation.getParam(constantsModule.CLOSE_MODAL) or getFFlagPassNavigationToContactsRevokedModule() and navigation.pop
			
			return roact.createElement(interactiveAlert, {
				title = p1.titleText,
				screenSize = props.screenSize,
				buttonStackInfo = {
					buttonHeight = 48,
					buttons = {
						{
							buttonType = buttonType.Secondary,
							props = {
								onActivated = function() --[[ line: 51 ]]
									-- upvalues: CLOSE_MODAL (ref)
									CLOSE_MODAL()
								end,
								text = p1.closeModalOk
							}
						}
					},
					forcedFillDirection = Enum.FillDirection.Vertical
				},
				bodyText = p1.revokedFlow
			})
		end)
	end)
end

return roactRodux.connect(function(p2) --[[ line: 67 ]]
	return { screenSize = p2.ScreenSize }
end, nil)(contactsRevokedAccessDialog)
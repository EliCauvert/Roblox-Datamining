local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local react = dependenciesModule.React
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local textKeysModule = require(contactImporter.Common.TextKeys)
local standardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local SMSProtocol = dependenciesModule.SMSProtocol
local dash = dependenciesModule.Dash
local useStyle = dependenciesModule.useStyle
local useLocalization = dependenciesModule.useLocalization
local getFFlagContactsListEntryUpdatedTruncationFixModule = require(contactImporter.Flags.getFFlagContactsListEntryUpdatedTruncationFix)
local sendInviteLinkModule = require(script.Parent.sendInviteLink)
local t = { smsProtocol = SMSProtocol.default }

function ContactsListInviteEntry(p1)
	-- upvalues: dash (ref), t (ref), useLocalization (ref), textKeysModule (ref), useStyle (ref), sendInviteLinkModule (ref), SMSProtocol (ref), react (ref), roact (ref), getFFlagContactsListEntryUpdatedTruncationFixModule (ref), styledTextLabel (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var1 = dash.join(t, p1)
	local var2 = useLocalization({ invite = textKeysModule.INVITE_BUTTON_TEXT })
	local var3 = useStyle()
	local var4 = sendInviteLinkModule({
		address = var1.phoneNumber,
		deviceContactId = var1.deviceContactId,
		smsProtocol = SMSProtocol.default
	})
	local var5, var6 = react.useState(0)
	
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Name = var1.deviceContactId,
		Size = UDim2.new(1, 0, 0, 72)
	}, {
		entryContent = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			padding = roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 26),
				PaddingBottom = UDim.new(0, 26)
			}),
			contactNameLabel = if getFFlagContactsListEntryUpdatedTruncationFixModule() then roact.createElement(styledTextLabel, {
				lineHeight = 1,
				fluidSizing = false,
				richText = false,
				textWrapped = false,
				size = UDim2.new(1, var5, 0, 20),
				colorStyle = var3.Theme.TextEmphasis,
				fontStyle = var3.Font.Header2,
				text = var1.contactName,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Bottom,
				textTruncate = Enum.TextTruncate.AtEnd
			}) else roact.createElement(styledTextLabel, {
				lineHeight = 1,
				automaticSize = Enum.AutomaticSize.Y,
				colorStyle = var3.Theme.TextEmphasis,
				fontStyle = var3.Font.Header2,
				text = var1.contactName,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Bottom
			}),
			sendInviteButton = if not var1.hasSentRequest then roact.createElement(button, {
				buttonType = buttonType.PrimarySystem,
				position = UDim2.new(1, -1, 0.5, 0),
				anchorPoint = Vector2.new(1, 0.5),
				standardSize = standardButtonSize.XSmall,
				fitContent = true,
				text = var2.invite,
				isDisabled = var4.isLoading,
				onActivated = var4.sendInvite,
				[react.Change.AbsoluteSize] = function(p2)
					-- upvalues: getFFlagContactsListEntryUpdatedTruncationFixModule (copy), var6 (ref)
					if getFFlagContactsListEntryUpdatedTruncationFixModule() then
						var6(0 - (p2.AbsoluteSize.X + 10))
					end
				end
			}) else roact.createElement(button, {
				buttonType = buttonType.Secondary,
				position = UDim2.new(1, -1, 0.5, 0),
				anchorPoint = Vector2.new(1, 0.5),
				standardSize = standardButtonSize.XSmall,
				isDisabled = true,
				text = var2.invite,
				onActivated = dash.noop,
				[react.Change.AbsoluteSize] = function(p2)
					-- upvalues: getFFlagContactsListEntryUpdatedTruncationFixModule (copy), var6 (ref)
					if getFFlagContactsListEntryUpdatedTruncationFixModule() then
						var6(0 - (p2.AbsoluteSize.X + 10))
					end
				end
			})
		}),
		divider = if var1.hasDivider then roact.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = var3.Theme.Divider.Color,
			BackgroundTransparency = var3.Theme.Divider.Transparency
		}) else nil
	})
end

return ContactsListInviteEntry
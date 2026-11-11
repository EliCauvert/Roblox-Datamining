local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local React = DependenciesModule.React
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local StandardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local SMSProtocol = DependenciesModule.SMSProtocol
local Dash = DependenciesModule.Dash
local UseStyleFunction = DependenciesModule.useStyle
local UseLocalizationFunction = DependenciesModule.useLocalization
local GetFFlagContactsListEntryUpdatedTruncationFixModule = require(ContactImporter.Flags.getFFlagContactsListEntryUpdatedTruncationFix)
local SendInviteLinkModule = require(script.Parent.sendInviteLink)
local config = { smsProtocol = SMSProtocol.default }

function ContactsListInviteEntry(p1)
	-- upvalues: Dash (copy), config (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), SendInviteLinkModule (copy), SMSProtocol (copy), React (copy), Roact (copy), GetFFlagContactsListEntryUpdatedTruncationFixModule (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local JoinResult = Dash.join(config, p1)
	local UseLocalizationResult = UseLocalizationFunction({ invite = TextKeysModule.INVITE_BUTTON_TEXT })
	local UseStyleResult = UseStyleFunction()
	local SendInviteLinkModuleResult = SendInviteLinkModule({
		address = JoinResult.phoneNumber,
		deviceContactId = JoinResult.deviceContactId,
		smsProtocol = SMSProtocol.default
	})
	local UseStateResult, UseStateResult2 = React.useState(0)
	
	return Roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Name = JoinResult.deviceContactId,
		Size = UDim2.new(1, 0, 0, 72)
	}, {
		entryContent = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			padding = Roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 26),
				PaddingBottom = UDim.new(0, 26)
			}),
			contactNameLabel = if GetFFlagContactsListEntryUpdatedTruncationFixModule() then Roact.createElement(StyledTextLabel, {
				lineHeight = 1,
				fluidSizing = false,
				richText = false,
				textWrapped = false,
				size = UDim2.new(1, UseStateResult, 0, 20),
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				fontStyle = UseStyleResult.Font.Header2,
				text = JoinResult.contactName,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Bottom,
				textTruncate = Enum.TextTruncate.AtEnd
			}) else Roact.createElement(StyledTextLabel, {
				lineHeight = 1,
				automaticSize = Enum.AutomaticSize.Y,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				fontStyle = UseStyleResult.Font.Header2,
				text = JoinResult.contactName,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Bottom
			}),
			sendInviteButton = if JoinResult.hasSentRequest then Roact.createElement(Button, {
				buttonType = ButtonType.Secondary,
				position = UDim2.new(1, -1, 0.5, 0),
				anchorPoint = Vector2.new(1, 0.5),
				standardSize = StandardButtonSize.XSmall,
				isDisabled = true,
				text = UseLocalizationResult.invite,
				onActivated = Dash.noop,
				[React.Change.AbsoluteSize] = function(Frame)
					-- upvalues: GetFFlagContactsListEntryUpdatedTruncationFixModule (upval), UseStateResult2 (copy)
					if GetFFlagContactsListEntryUpdatedTruncationFixModule() then
						UseStateResult2(0 - (Frame.AbsoluteSize.X + 10))
					end
				end
			}) else Roact.createElement(Button, {
				buttonType = ButtonType.PrimarySystem,
				position = UDim2.new(1, -1, 0.5, 0),
				anchorPoint = Vector2.new(1, 0.5),
				standardSize = StandardButtonSize.XSmall,
				fitContent = true,
				text = UseLocalizationResult.invite,
				isDisabled = SendInviteLinkModuleResult.isLoading,
				onActivated = SendInviteLinkModuleResult.sendInvite,
				[React.Change.AbsoluteSize] = function(Frame)
					-- upvalues: GetFFlagContactsListEntryUpdatedTruncationFixModule (upval), UseStateResult2 (copy)
					if GetFFlagContactsListEntryUpdatedTruncationFixModule() then
						UseStateResult2(0 - (Frame.AbsoluteSize.X + 10))
					end
				end
			})
		}),
		divider = if JoinResult.hasDivider then Roact.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
			BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency
		}) else nil
	})
end

return ContactsListInviteEntry
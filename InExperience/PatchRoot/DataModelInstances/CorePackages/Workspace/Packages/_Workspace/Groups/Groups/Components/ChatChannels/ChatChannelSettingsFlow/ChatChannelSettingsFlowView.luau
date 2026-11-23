local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChatChannelSettingsModule = require(script.Parent.Parent.ChatChannelSettings)
local ChatChannelMembersModule = require(script.Parent.Parent.ChatChannelMembers)
local SettingsTextInputEditorModule = require(script.Parent.Parent.SettingsFields.SettingsTextInputField.SettingsTextInputEditor)
local _ = require(script.Parent.ChatChannelSettingsFlowLayout)

return function(p1)
	-- upvalues: ReactModule (copy), ChatChannelSettingsModule (copy), ChatChannelMembersModule (copy), SettingsTextInputEditorModule (copy), FoundationModule (copy)
	local IsSettings: boolean = p1.screen == "Settings" or p1.screen == "Members"
	local Tabs = {
		{ id = "Settings", text = p1.settingsTabText },
		{ id = "Members", text = p1.membersTabText }
	}
	local Element = nil
	local Element1 = nil
	
	if p1.screen == "Settings" then
		Element1 = ReactModule.createElement(ChatChannelSettingsModule, p1.settings)
	elseif p1.screen == "Members" then
		Element1 = ReactModule.createElement(ChatChannelMembersModule, { testId = `{p1.testId}--members` })
	elseif p1.screen == "EditName" then
		Element1 = ReactModule.createElement(SettingsTextInputEditorModule.Content, p1.editor)
		Element = ReactModule.createElement(SettingsTextInputEditorModule.Actions, p1.editor)
	else
		Element1 = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.confirmation.message
		})
		Element = ReactModule.createElement(FoundationModule.ButtonGroup, {
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			buttons = {
				{
					text = p1.confirmation.cancelText,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onBack,
					ref = p1.confirmation.cancelRef,
					testId = `{p1.testId}--confirmation--cancel`
				},
				{
					text = p1.confirmation.confirmText,
					variant = if p1.screen == "ConfirmDelete" then FoundationModule.Enums.ButtonVariant.Alert else FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.confirmation.onConfirm,
					testId = `{p1.testId}--confirmation--confirm`
				}
			}
		})
	end
	return ReactModule.createElement(p1.Layout, {
		containerRef = p1.containerRef,
		onClose = p1.onClose,
		hideCloseButton = p1.hideCloseButton,
		contentKey = p1.screen,
		sizeToContent = not IsSettings,
		testId = p1.testId,
		header = ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			Back = if IsSettings then nil else ReactModule.createElement(FoundationModule.IconButton, {
				LayoutOrder = 1,
				icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
				size = FoundationModule.Enums.InputSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				onActivated = p1.onBack,
				testId = `{p1.testId}--back`
			}),
			Icon = if IsSettings and p1.iconAssetId then ReactModule.createElement(FoundationModule.Image, {
				tag = "size-800 radius-small",
				LayoutOrder = 1,
				Image = `rbxassetid://{p1.iconAssetId}`
			}) else nil,
			Title = ReactModule.createElement(FoundationModule.Text, {
				tag = "fill size-0-0 auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
				TextWrapped = false,
				LayoutOrder = 2,
				Text = p1.title
			})
		}),
		body = ReactModule.createElement(FoundationModule.View, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Tabs = if IsSettings then ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y padding-x-xlarge",
				LayoutOrder = 1
			}, {
				Tabs = ReactModule.createElement(FoundationModule.Tabs, {
					activeTabId = p1.screen,
					onActivated = p1.onTabChanged,
					size = FoundationModule.Enums.InputSize.Small,
					fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
					tabs = Tabs,
					testId = `{p1.testId}--tabs`
				})
			}) else nil,
			Screen = ReactModule.createElement(FoundationModule.View, {
				tag = "col size-full-0 auto-y padding-x-xlarge padding-y-large",
				LayoutOrder = 2
			}, { Content = Element1 })
		}),
		actions = Element
	})
end
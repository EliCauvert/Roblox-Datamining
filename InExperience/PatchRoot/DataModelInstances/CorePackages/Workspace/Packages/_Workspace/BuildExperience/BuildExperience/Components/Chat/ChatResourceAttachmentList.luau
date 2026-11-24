local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FFlagBuildExperienceInertResourceAttachmentChipModule = require(BuildExperience.Flags.FFlagBuildExperienceInertResourceAttachmentChip)
local FFlagBuildChatPasteAsAttachmentModule = require(BuildExperience.Flags.FFlagBuildChatPasteAsAttachment)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PastedTextAttachmentModule = require(BuildExperience.Chat.pastedTextAttachment)
local PastedTextTileModule = require(script.Parent.ChatAttachmentTile.PastedTextTile)
local ChatTextAttachmentPreviewSheetModule = require(script.Parent.ChatTextAttachmentPreviewSheet)
local Chip = FoundationModule.Chip
local View = FoundationModule.View
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagBuildChatPasteAsAttachmentModule (copy), ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceInertResourceAttachmentChipModule (copy), FFlagBuildExperienceLibrary (copy), PastedTextAttachmentModule (copy), PastedTextTileModule (copy), Chip (copy), ChipSize (copy), FoundationModule (copy), ChipVariant (copy), ChatTextAttachmentPreviewSheetModule (copy), View (copy)
	local Elements = {}
	local TestId = Frame.testId or "ChatResourceAttachmentList"
	local Text = nil
	local Callback = nil
	
	if FFlagBuildChatPasteAsAttachmentModule then
		Text, Callback = ReactModule.useState(nil)
	end
	local UseLocalizationResult = if FFlagBuildChatPasteAsAttachmentModule then UseLocalizationFunction({
		pastedTextTitle = LocalizationStringsModule.CHAT_PASTED_TEXT_TITLE
	}) else nil
	local NoOnActivateAttachment: boolean = if FFlagBuildExperienceInertResourceAttachmentChipModule then Frame.onActivateAttachment == nil else FFlagBuildExperienceLibrary and (Frame.onRemove == nil and Frame.onActivateAttachment == nil)
	for LayoutOrder, attachment in Frame.attachments do
		local OnRemoveFunction = Frame.onRemove
		local OnActivateAttachmentFunction = Frame.onActivateAttachment
		local PastedText = if FFlagBuildChatPasteAsAttachmentModule then PastedTextAttachmentModule.getPastedText(attachment) else nil
		Elements[`Attachment-{LayoutOrder}`] = if FFlagBuildChatPasteAsAttachmentModule and PastedText ~= nil then ReactModule.createElement(PastedTextTileModule, {
			LayoutOrder = LayoutOrder,
			text = PastedText,
			onActivated = function()
				-- upvalues: Callback (ref), PastedText (copy)
				Callback(PastedText)
			end,
			onRemove = if OnRemoveFunction == nil then nil else function()
				-- upvalues: OnRemoveFunction (copy), LayoutOrder (copy)
				OnRemoveFunction(LayoutOrder)
			end,
			testId = `{TestId}.Attachment.{LayoutOrder}`
		}) else ReactModule.createElement(Chip, {
			LayoutOrder = LayoutOrder,
			onActivated = if NoOnActivateAttachment then nil else function()
				-- upvalues: OnActivateAttachmentFunction (copy), LayoutOrder (copy), OnRemoveFunction (copy)
				if OnActivateAttachmentFunction ~= nil then
					OnActivateAttachmentFunction(LayoutOrder)
					
					return
				end
				if OnRemoveFunction ~= nil then
					OnRemoveFunction(LayoutOrder)
				end
			end,
			Selectable = not NoOnActivateAttachment and nil,
			size = ChipSize.Small,
			text = if attachment.type == "resource_link" then attachment.name else attachment.resource.uri,
			trailing = if OnRemoveFunction == nil then nil elseif NoOnActivateAttachment or OnActivateAttachmentFunction ~= nil then {
				iconName = FoundationModule.Enums.IconName.X,
				onActivated = function()
					-- upvalues: OnRemoveFunction (copy), LayoutOrder (copy)
					OnRemoveFunction(LayoutOrder)
				end
			} else FoundationModule.Enums.IconName.X,
			variant = ChipVariant.Standard,
			testId = `{TestId}.Attachment.{LayoutOrder}`
		})
	end
	Elements.PastedTextPreview = if FFlagBuildChatPasteAsAttachmentModule and Text ~= nil then ReactModule.createElement(ChatTextAttachmentPreviewSheetModule, {
		text = Text,
		title = UseLocalizationResult.pastedTextTitle,
		onClose = function()
			-- upvalues: Callback (ref)
			Callback(nil)
		end,
		testId = `{TestId}.PastedTextPreview`
	}) else nil
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row wrap gap-small size-full-0 auto-y"] = true,
			["align-x-right"] = Frame.alignRight == true
		},
		testId = TestId
	}, Elements)
end)
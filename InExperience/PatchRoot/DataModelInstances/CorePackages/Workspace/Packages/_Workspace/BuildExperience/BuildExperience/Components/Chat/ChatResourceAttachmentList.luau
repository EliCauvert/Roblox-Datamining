local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FFlagBuildExperienceInertResourceAttachmentChipModule = require(BuildExperience.Flags.FFlagBuildExperienceInertResourceAttachmentChip)
local Chip = FoundationModule.Chip
local View = FoundationModule.View
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagBuildExperienceInertResourceAttachmentChipModule (copy), FFlagBuildExperienceLibrary (copy), ReactModule (copy), Chip (copy), ChipSize (copy), FoundationModule (copy), ChipVariant (copy), View (copy)
	local Elements = {}
	local TestId = Frame.testId or "ChatResourceAttachmentList"
	local NoOnActivateAttachment: boolean = if FFlagBuildExperienceInertResourceAttachmentChipModule then Frame.onActivateAttachment == nil else FFlagBuildExperienceLibrary and (Frame.onRemove == nil and Frame.onActivateAttachment == nil)
	for LayoutOrder, attachment in Frame.attachments do
		local OnRemoveFunction = Frame.onRemove
		local OnActivateAttachmentFunction = Frame.onActivateAttachment
		Elements[`Attachment-{LayoutOrder}`] = ReactModule.createElement(Chip, {
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
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row wrap gap-small size-full-0 auto-y"] = true,
			["align-x-right"] = Frame.alignRight == true
		},
		testId = TestId
	}, Elements)
end)
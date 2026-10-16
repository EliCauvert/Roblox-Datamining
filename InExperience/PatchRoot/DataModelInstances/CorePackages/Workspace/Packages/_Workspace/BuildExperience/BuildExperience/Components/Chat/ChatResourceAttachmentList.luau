local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local Chip = FoundationModule.Chip
local View = FoundationModule.View
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant

return ReactModule.memo(function(Frame) --[[ Line: 27 | Named "ChatResourceAttachmentList" ]]
	-- upvalues: FFlagBuildExperienceLibrary (copy), ReactModule (copy), Chip (copy), ChipSize (copy), FoundationModule (copy), ChipVariant (copy), View (copy)
	local Elements = {}
	local TestId = Frame.testId or "ChatResourceAttachmentList"
	local NoOnRemove: boolean = FFlagBuildExperienceLibrary and (Frame.onActivateAttachment == nil and Frame.onRemove == nil)
	for LayoutOrder, attachment in Frame.attachments do
		local OnRemoveFunction = Frame.onRemove
		local OnActivateAttachmentFunction = Frame.onActivateAttachment
		Elements[`Attachment-{LayoutOrder}`] = ReactModule.createElement(Chip, {
			LayoutOrder = LayoutOrder,
			onActivated = if NoOnRemove then nil else function() --[[ Line: 41 ]]
				-- upvalues: OnActivateAttachmentFunction (copy), LayoutOrder (copy), OnRemoveFunction (copy)
				if OnActivateAttachmentFunction ~= nil then
					OnActivateAttachmentFunction(LayoutOrder)
					
					return
				end
				if OnRemoveFunction ~= nil then
					OnRemoveFunction(LayoutOrder)
				end
			end,
			Selectable = not NoOnRemove and nil,
			size = ChipSize.Small,
			text = if attachment.type == "resource_link" then attachment.name else attachment.resource.uri,
			trailing = if OnRemoveFunction == nil then nil elseif OnActivateAttachmentFunction == nil then FoundationModule.Enums.IconName.X else {
				iconName = FoundationModule.Enums.IconName.X,
				onActivated = function() --[[ Line: 55 ]]
					-- upvalues: OnRemoveFunction (copy), LayoutOrder (copy)
					OnRemoveFunction(LayoutOrder)
				end
			},
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
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local chip = foundationModule.Chip
local view = foundationModule.View
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), chip (ref), chipSize (ref), foundationModule (ref), chipVariant (ref), view (ref)
	local t = {}
	local testId = p1.testId or "ChatResourceAttachmentList"
	
	for i, v in p1.attachments do
		local onRemove = p1.onRemove
		t[`Attachment-{i}`] = reactModule.createElement(chip, {
			LayoutOrder = i,
			onActivated = function()
				-- upvalues: onRemove (ref), i (ref)
				if onRemove ~= nil then
					onRemove(i)
				end
			end,
			size = chipSize.Small,
			text = if v.type == "resource_link" then v.name else v.resource.uri,
			trailing = if onRemove ~= nil then nil else foundationModule.Enums.IconName.X,
			variant = chipVariant.Standard,
			testId = `{testId}.Attachment.{i}`
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = {
			["row wrap gap-small size-full-0 auto-y"] = true,
			["align-x-right"] = p1.alignRight == true
		},
		testId = testId
	}, t)
end)
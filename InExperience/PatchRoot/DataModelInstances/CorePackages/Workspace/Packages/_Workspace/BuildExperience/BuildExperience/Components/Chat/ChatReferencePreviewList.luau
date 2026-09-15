local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local chip = foundationModule.Chip
local view = foundationModule.View
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local iconName = foundationModule.Enums.IconName

local function _(p1)
	local charCount = utf8.len(p1)
	
	return if charCount == nil or charCount <= 32 then p1 else string.sub(p1, 1, (utf8.offset(p1, 30) or 1) - 1) .. "..."
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), chip (ref), iconName (ref), chipSize (ref), chipVariant (ref), view (ref)
	local t = {}
	local testId = p1.testId or "ChatReferencePreviewList"
	
	for i, v in p1.references do
		local onRemove = p1.onRemove
		local var1 = `Reference-{i}`
		local createElement = reactModule.createElement
		local var2 = chip
		local t_1 = {
			LayoutOrder = i,
			leading = iconName.CircleLineTargetCursor,
			onActivated = function()
				-- upvalues: onRemove (ref), i (ref)
				if onRemove ~= nil then
					onRemove(i)
				end
			end,
			size = chipSize.Large
		}
		local displayName = v.displayName
		local charCount = utf8.len(displayName)
		t_1.text = if charCount == nil or charCount <= 32 then displayName else string.sub(displayName, 1, (utf8.offset(displayName, 30) or 1) - 1) .. "..."
		t_1.trailing = if p1.onRemove ~= nil then nil else iconName.X
		t_1.variant = chipVariant.Standard
		t_1.testId = `{testId}.Reference.{i}`
		t[var1] = createElement(var2, t_1)
	end
	return reactModule.createElement(view, {
		tag = "row wrap gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		testId = testId
	}, t)
end)
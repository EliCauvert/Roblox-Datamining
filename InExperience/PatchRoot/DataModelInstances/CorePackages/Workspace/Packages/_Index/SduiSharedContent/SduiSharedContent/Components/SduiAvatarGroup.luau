local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)

local function normalizeAvatars(Avatars) --[[ Line: 26 ]]
	if typeof(Avatars) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, avatar in Avatars do
		if typeof(avatar) == "table" then
			local Number: number? = tonumber(avatar.userId)
			
			if Number then
				table.insert(List, { userId = Number, userPresence = avatar.userPresence })
			end
		else
			local Number1: number? = tonumber(avatar)
			
			if Number1 then
				table.insert(List, { userId = Number1 })
			end
		end
	end
	return List
end

return ReactModule.memo(function(p1) --[[ Line: 52 | Named "SduiAvatarGroup" ]]
	-- upvalues: normalizeAvatars (copy), ReactModule (copy), FoundationModule (copy)
	local NormalizeAvatarsResult = normalizeAvatars(p1.avatars)
	
	return if NormalizeAvatarsResult then ReactModule.createElement(FoundationModule.AvatarGroup, {
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		avatars = NormalizeAvatarsResult,
		backplateStyle = p1.backplateStyle,
		max = p1.max,
		size = p1.size,
		testId = p1.testId,
		type = p1.type
	}) else nil
end)
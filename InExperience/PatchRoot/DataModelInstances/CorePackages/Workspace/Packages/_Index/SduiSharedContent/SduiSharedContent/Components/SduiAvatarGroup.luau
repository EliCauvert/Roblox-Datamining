local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

local function normalizeAvatars(p0) --[[ line: 26 ]]
	if typeof(p0) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		if typeof(v) == "table" then
			local var4 = tonumber(v.userId)
			
			if var4 then
				table.insert(t, { userId = var4, userPresence = v.userPresence })
			end
		else
			local var5 = tonumber(v)
			
			if var5 then
				table.insert(t, { userId = var5 })
			end
		end
	end
	return t
end

return reactModule.memo(function(p1) --[[ line: 52 | named "SduiAvatarGroup" ]]
	-- upvalues: normalizeAvatars (ref), reactModule (ref), foundationModule (ref)
	local var6 = normalizeAvatars(p1.avatars)
	
	return if var6 then reactModule.createElement(foundationModule.AvatarGroup, {
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		avatars = var6,
		backplateStyle = p1.backplateStyle,
		max = p1.max,
		size = p1.size,
		testId = p1.testId,
		type = p1.type
	}) else nil
end)
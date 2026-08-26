local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

local function normalizeAvatars(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		if typeof(v) == "table" then
			local var1 = tonumber(v.userId)
			
			if var1 then
				table.insert(t, { userId = var1, userPresence = v.userPresence })
			end
		else
			local var2 = tonumber(v)
			
			if var2 then
				table.insert(t, { userId = var2 })
			end
		end
	end
	return t
end

return reactModule.memo(function(p2)
	-- upvalues: normalizeAvatars (ref), reactModule (ref), foundationModule (ref)
	local var3 = normalizeAvatars(p2.avatars)
	
	return if var3 then reactModule.createElement(foundationModule.AvatarGroup, {
		LayoutOrder = p2.layoutOrder,
		Visible = p2.visible,
		ZIndex = p2.zIndex,
		avatars = var3,
		backplateStyle = p2.backplateStyle,
		max = p2.max,
		size = p2.size,
		testId = p2.testId,
		type = p2.type
	}) else nil
end)
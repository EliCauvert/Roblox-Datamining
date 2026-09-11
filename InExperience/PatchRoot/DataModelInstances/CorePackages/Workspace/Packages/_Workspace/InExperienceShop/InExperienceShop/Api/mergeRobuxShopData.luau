local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Types)
local ROBUX_CATEGORY_NAME = require(inExperienceShop.Constants).ROBUX_CATEGORY_NAME

local function _(p1)
	-- upvalues: ROBUX_CATEGORY_NAME (ref)
	return p1.name == ROBUX_CATEGORY_NAME
end

local _ = function(p1)
	-- upvalues: ROBUX_CATEGORY_NAME (ref)
	for i, v in ipairs(p1) do
		if v.name == ROBUX_CATEGORY_NAME then
			return v
		end
	end
	return nil
end

local function replaceOrRemoveRobux(p2, p3)
	-- upvalues: ROBUX_CATEGORY_NAME (ref)
	local list = table.create(#p2)
	local var1 = false
	
	for i, v in ipairs(p2) do
		if v.name == ROBUX_CATEGORY_NAME then
			if p3 ~= nil then
				table.insert(list, p3)
			end
			var1 = true
		else
			table.insert(list, v)
		end
	end
	if not var1 and p3 ~= nil then
		table.insert(list, p3)
	end
	return list
end

return function(p4, p5, p6)
	-- upvalues: ROBUX_CATEGORY_NAME (ref), replaceOrRemoveRobux (ref)
	local var2
	for i, v in ipairs(p6.sections) do
		if v.name == ROBUX_CATEGORY_NAME then
			var2 = v
			local var3
			if var2 == nil then
				var3 = nil
			else
				for v, v_1 in ipairs(p6.categories) do
					if v_1.name == ROBUX_CATEGORY_NAME then
						var3 = v_1
					end
				end
				var3 = nil
			end
			return replaceOrRemoveRobux(p4, var3), replaceOrRemoveRobux(p5, var2)
		end
	end
	var2 = nil
end
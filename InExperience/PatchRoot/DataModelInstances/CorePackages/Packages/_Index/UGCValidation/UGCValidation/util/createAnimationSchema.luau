local constantsModule = require(script.Parent.Parent.Constants)

local function createAnimationEntry(p0, p1) --[[ line: 4 ]]
	local t = { ClassName = "Animation" }
	
	if p0 then
		t._optional = true
	end
	if p1 then
		t._children = {
			{
				Name = "Weight",
				ClassName = "NumberValue",
				_optional = true
			}
		}
	end
	return t
end

local function createStringValueWithAnimations(p2, p3, p4) --[[ line: 23 ]]
	-- upvalues: createAnimationEntry (ref)
	local t = {}
	table.insert(t, createAnimationEntry(false, p4))
	
	if p3 > 1 then
		table.insert(t, createAnimationEntry(true, p4))
	end
	return { ClassName = "StringValue", Name = p2, _children = t }
end

return function(p5) --[[ line: 42 | named "createAnimationSchema" ]]
	-- upvalues: constantsModule (ref), createStringValueWithAnimations (ref)
	local var5 = constantsModule.ANIMATION_ASSET_INFO[p5]
	assert(var5, `No ANIMATION_ASSET_INFO for {p5}`)
	local t = {}
	
	if p5 == Enum.AssetType.IdleAnimation then
		table.insert(t, createStringValueWithAnimations("idle", 2, true))
	else
		for i, v in var5.stringValueNames do
			local t_1 = {}
			table.insert(t_1, { ClassName = "Animation" })
			table.insert(t, { ClassName = "StringValue", Name = v, _children = t_1 })
		end
	end
	return {
		ClassName = "Model",
		Name = var5.modelName,
		_children = {
			{ Name = "R15Anim", ClassName = "Folder", _children = t }
		}
	}
end
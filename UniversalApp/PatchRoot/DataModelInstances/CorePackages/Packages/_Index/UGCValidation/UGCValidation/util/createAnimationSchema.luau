local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)

local function createAnimationEntry(p1, p2)
	local t = { ClassName = "Animation" }
	
	if p1 then
		t._optional = true
	end
	if p2 then
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

local function createStringValueWithAnimations(p1, p2, p3)
	-- upvalues: createAnimationEntry (ref)
	local t = {}
	table.insert(t, createAnimationEntry(false, p3))
	
	if p2 > 1 then
		table.insert(t, createAnimationEntry(true, p3))
	end
	return { ClassName = "StringValue", Name = p1, _children = t }
end

return function(p1, p2)
	-- upvalues: constantsModule (ref), createStringValueWithAnimations (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref)
	local var1 = constantsModule.ANIMATION_ASSET_INFO[p1]
	assert(var1, `No ANIMATION_ASSET_INFO for {p1}`)
	local t = {}
	
	if p1 == Enum.AssetType.IdleAnimation then
		table.insert(t, createStringValueWithAnimations("idle", 2, true))
	else
		for i, v in var1.stringValueNames do
			local t_1 = {}
			table.insert(t_1, { ClassName = "Animation" })
			table.insert(t, { ClassName = "StringValue", Name = v, _children = t_1 })
		end
	end
	local t_1 = { Name = "R15Anim", ClassName = "Folder", _children = t }
	
	return if getFFlagUGCValidationAnimationPackFolderStructureModule() and p2 and p2.Name == "R15Anim" then t_1 else {
		ClassName = "Model",
		Name = var1.modelName,
		_children = { t_1 }
	}
end
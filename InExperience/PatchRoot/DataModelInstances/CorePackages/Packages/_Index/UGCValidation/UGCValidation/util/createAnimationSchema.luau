local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local getFFlagUGCValidationAnimationAssetDisableModelStructureModule = require(parent.flags.getFFlagUGCValidationAnimationAssetDisableModelStructure)

local function createAnimationEntry(p0, p1) --[[ line: 8 ]]
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

local function createStringValueWithAnimations(p2, p3, p4) --[[ line: 27 ]]
	-- upvalues: createAnimationEntry (ref)
	local t = {}
	table.insert(t, createAnimationEntry(false, p4))
	
	if p3 > 1 then
		table.insert(t, createAnimationEntry(true, p4))
	end
	return { ClassName = "StringValue", Name = p2, _children = t }
end

return function(p5, p6) --[[ line: 46 | named "createAnimationSchema" ]]
	-- upvalues: constantsModule (ref), createStringValueWithAnimations (ref), getFFlagUGCValidationAnimationAssetDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref)
	local var7 = constantsModule.ANIMATION_ASSET_INFO[p5]
	assert(var7, `No ANIMATION_ASSET_INFO for {p5}`)
	local t = {}
	
	if p5 == Enum.AssetType.IdleAnimation then
		table.insert(t, createStringValueWithAnimations("idle", 2, true))
	else
		for i, v in var7.stringValueNames do
			local t_1 = {}
			table.insert(t_1, { ClassName = "Animation" })
			table.insert(t, { ClassName = "StringValue", Name = v, _children = t_1 })
		end
	end
	local t_1 = { Name = "R15Anim", ClassName = "Folder", _children = t }
	
	return if getFFlagUGCValidationAnimationAssetDisableModelStructureModule() or getFFlagUGCValidationAnimationPackFolderStructureModule() and p6 and p6.Name == "R15Anim" then t_1 else {
		ClassName = "Model",
		Name = var7.modelName,
		_children = { t_1 }
	}
end
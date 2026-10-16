local ConstantsModule = require(script.Parent.Parent.Constants)

local function createAnimationEntry(p1, p2) --[[ Line: 4 ]]
	local config = { ClassName = "Animation" }
	
	if p1 then
		config._optional = true
	end
	if p2 then
		config._children = {
			{
				Name = "Weight",
				ClassName = "NumberValue",
				_optional = true
			}
		}
	end
	return config
end

local function createStringValueWithAnimations(Name, p1: number, p2) --[[ Line: 23 ]]
	-- upvalues: createAnimationEntry (copy)
	local List = {}
	table.insert(List, (createAnimationEntry(false, p2)))
	
	if p1 > 1 then
		table.insert(List, (createAnimationEntry(true, p2)))
	end
	return { ClassName = "StringValue", Name = Name, _children = List }
end

return function(AssetType) --[[ Line: 42 | Named "createAnimationSchema" ]]
	-- upvalues: ConstantsModule (copy), createStringValueWithAnimations (copy)
	local ANIMATIONASSET = ConstantsModule.ANIMATION_ASSET_INFO[AssetType]
	assert(ANIMATIONASSET, `No ANIMATION_ASSET_INFO for {AssetType}`)
	local List = {}
	
	if AssetType == Enum.AssetType.IdleAnimation then
		table.insert(List, (createStringValueWithAnimations("idle", 2, true)))
	else
		for _, stringValueName in ANIMATIONASSET.stringValueNames do
			local _children = {}
			table.insert(_children, { ClassName = "Animation" })
			table.insert(List, {
				ClassName = "StringValue",
				Name = stringValueName,
				_children = _children
			})
		end
	end
	return { Name = "R15Anim", ClassName = "Folder", _children = List }
end
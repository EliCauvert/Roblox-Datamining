local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local DashModule = require(Parent.Dash)
local HeadShapePropertiesModule = require(script.Parent.HeadShapeProperties)

return if require(Parent.AvatarExperienceFlags).FFlagDynamicHeadsMigration then (function()
	-- upvalues: HeadShapePropertiesModule (copy)
	local t = {}
	
	for _, value in HeadShapePropertiesModule do
		if type(value) == "table" and value.assetId then
			t[tostring(value.assetId)] = value
		end
	end
	return t
end)() else DashModule.keyBy(HeadShapePropertiesModule, function(p1, _): string
	return (tostring(p1.assetId))
end)
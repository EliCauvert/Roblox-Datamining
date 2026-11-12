local SPAWNEFFECTASSETTYPEIDSTRING = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).SPAWN_EFFECT_ASSET_TYPE_ID_STRING

return function(Parent, p1)
	-- upvalues: SPAWNEFFECTASSETTYPEIDSTRING (copy)
	for _, AvatarEffectDescription in Parent:GetChildren() do
		if AvatarEffectDescription:IsA("AvatarEffectDescription") then
			AvatarEffectDescription:Destroy()
		end
	end
	local v1 = p1[SPAWNEFFECTASSETTYPEIDSTRING] or {}
	for i in v1 do
		local AvatarEffectDescription1 = Instance.new("AvatarEffectDescription")
		AvatarEffectDescription1.AssetId = tonumber(i)
		AvatarEffectDescription1.EffectType = Enum.AvatarEffectType.Spawn
		AvatarEffectDescription1.Parent = Parent
	end
end
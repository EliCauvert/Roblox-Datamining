local BodyAssetTypes = require(script.Parent.Parent.Constants).BodyAssetTypes

return function(p1, p2) --[[ Line: 18 | Named "buildBodySlotViewportProps" ]]
	-- upvalues: BodyAssetTypes (copy)
	local LookAssetInfos = {}
	local Hex = p1:ToHex()
	
	for _, bodyAssetType in BodyAssetTypes do
		local Text = tostring(bodyAssetType.Value)
		local v1 = p2[Text]
		
		if v1 then
			for Id, _ in v1 do
				LookAssetInfos[Id] = { quantityOwned = 1, id = Id, assetType = tonumber(Text) }
			end
		end
	end
	return {
		lookDetails = {
			lookAssetInfos = LookAssetInfos,
			lookBundleInfos = {},
			avatarProperties = {
				playerAvatarType = "R15",
				bodyColor3s = {
					headColor3 = Hex,
					leftArmColor3 = Hex,
					leftLegColor3 = Hex,
					rightArmColor3 = Hex,
					rightLegColor3 = Hex,
					torsoColor3 = Hex
				}
			}
		}
	}
end
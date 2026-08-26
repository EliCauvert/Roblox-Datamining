local bodyAssetTypes = require(script.Parent.Parent.Constants).BodyAssetTypes

return function(p1, p2)
	-- upvalues: bodyAssetTypes (ref)
	local t = {}
	local var1 = p1:ToHex()
	
	for i, v in bodyAssetTypes do
		local var2 = tostring(v.Value)
		local var3 = p2[var2]
		
		if var3 then
			for i_1, v_1 in var3 do
				t[i_1] = { quantityOwned = 1, id = i_1, assetType = tonumber(var2) }
			end
		end
	end
	return {
		lookDetails = {
			lookAssetInfos = t,
			lookBundleInfos = {},
			avatarProperties = {
				playerAvatarType = "R15",
				bodyColor3s = {
					headColor3 = var1,
					leftArmColor3 = var1,
					leftLegColor3 = var1,
					rightArmColor3 = var1,
					rightLegColor3 = var1,
					torsoColor3 = var1
				}
			}
		}
	}
end
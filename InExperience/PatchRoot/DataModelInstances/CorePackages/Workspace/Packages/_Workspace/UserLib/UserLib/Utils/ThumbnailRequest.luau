local constantsModule = require(script:FindFirstAncestor("UserLib").Utils.Constants)
local t = {
	new = function()
		-- upvalues: constantsModule (ref)
		return {
			thumbnailType = constantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot,
			thumbnailSize = constantsModule.RbxThumbnailSizes.Size150x150
		}
	end
}

function t.fromData(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.thumbnailType = p1
	var1.thumbnailSize = p2
	
	return var1
end

return t
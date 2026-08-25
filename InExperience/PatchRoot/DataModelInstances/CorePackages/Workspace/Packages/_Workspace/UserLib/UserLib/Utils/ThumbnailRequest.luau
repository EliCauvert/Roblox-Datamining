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

function t.fromData(p0, p1)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.thumbnailType = p0
	var2.thumbnailSize = p1
	
	return var2
end

return t
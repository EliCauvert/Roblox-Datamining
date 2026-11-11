local ConstantsModule = require(script:FindFirstAncestor("UserLib").Utils.Constants)
local ThumbnailRequestModule = {
	new = function()
		-- upvalues: ConstantsModule (copy)
		return {
			thumbnailType = ConstantsModule.RbxAvatarThumbnailTypesFromEnum.HeadShot,
			thumbnailSize = ConstantsModule.RbxThumbnailSizes.Size150x150
		}
	end
}

function ThumbnailRequestModule.fromData(ThumbnailType, ThumbnailSize)
	-- upvalues: ThumbnailRequestModule (copy)
	local NewThumbnailRequest = ThumbnailRequestModule.new()
	NewThumbnailRequest.thumbnailType = ThumbnailType
	NewThumbnailRequest.thumbnailSize = ThumbnailSize
	
	return NewThumbnailRequest
end

return ThumbnailRequestModule
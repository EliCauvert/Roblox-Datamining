local ThumbnailModule = {
	new = function()
		return {}
	end
}

function ThumbnailModule.fromThumbnailData(p1, Size)
	-- upvalues: ThumbnailModule (copy)
	local NewThumbnail = ThumbnailModule.new()
	NewThumbnail.universeId = tostring(p1.targetId)
	NewThumbnail.state = p1.state
	NewThumbnail.url = p1.imageUrl
	NewThumbnail.size = Size
	
	return NewThumbnail
end

function ThumbnailModule.isCompleteThumbnailData(p1): boolean
	return type(p1) == "table" and (type(p1.targetId) == "number" and type(p1.state) == "string") and (type(p1.imageUrl) == "string" or p1.imageUrl == nil)
end

function ThumbnailModule.checkStateIsFinal(p1): boolean
	return p1 ~= "Pending"
end

return ThumbnailModule
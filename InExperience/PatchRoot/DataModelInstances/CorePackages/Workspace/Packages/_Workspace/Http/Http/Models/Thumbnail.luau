local t = {
	new = function()
		return {}
	end
}

function t.fromThumbnailData(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = tostring(p1.targetId)
	var1.state = p1.state
	var1.url = p1.imageUrl
	var1.size = p2
	
	return var1
end

function t.isCompleteThumbnailData(p1)
	return type(p1) == "table" and (type(p1.targetId) == "number" and (type(p1.state) == "string" and (if type(p1.imageUrl) ~= "string" then p1.imageUrl == nil else true)))
end

function t.checkStateIsFinal(p1)
	return p1 ~= "Pending"
end

return t
local t = {
	new = function() --[[ line: 12 ]]
		return {}
	end
}

function t.fromThumbnailData(p0, p1) --[[ line: 18 ]]
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = tostring(p0.targetId)
	var1.state = p0.state
	var1.url = p0.imageUrl
	var1.size = p1
	
	return var1
end

function t.isCompleteThumbnailData(p2) --[[ line: 29 ]]
	return type(p2) == "table" and (type(p2.targetId) == "number" and (type(p2.state) == "string" and (if type(p2.imageUrl) ~= "string" then p2.imageUrl == nil else true)))
end

function t.checkStateIsFinal(p3) --[[ line: 36 ]]
	return p3 ~= "Pending"
end

return t
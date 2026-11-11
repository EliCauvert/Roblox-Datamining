local Count = 0

local function _(): string
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end

return {
	mock = function(p1)
		-- upvalues: Count (ref)
		local t = {}
		local Text = tostring(p1)
		
		if not Text then
			Count += 1
			Text = tostring(Count)
		end
		t.id = Text
		t.assetType = "0"
		t.name = ""
		
		return t
	end,
	fromAsset = function(p1)
		return {
			id = tostring(p1.id),
			assetType = tostring(p1.assetType),
			name = p1.name,
			price = p1.price,
			lowestResalePrice = p1.lowestResalePrice,
			isOffSale = p1.isOffSale,
			favoriteCount = p1.favoriteCount
		}
	end
}
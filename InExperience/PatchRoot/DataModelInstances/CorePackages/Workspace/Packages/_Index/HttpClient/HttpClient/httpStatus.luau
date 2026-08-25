return {
	isSuccess = function(p0)
		return p0 == 304 or (p0 >= 200 and p0 < 300)
	end
}
return {
	isSuccess = function(p1: number): boolean
		return p1 == 304 or p1 >= 200 and p1 < 300
	end
}
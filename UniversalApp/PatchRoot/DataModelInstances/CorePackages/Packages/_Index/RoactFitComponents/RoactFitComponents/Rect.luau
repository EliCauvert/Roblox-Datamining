return {
	rectangle = function(vectorA, vectorB)
		return {
			top = vectorB,
			bottom = vectorB,
			left = vectorA,
			right = vectorA
		}
	end,
	square = function(p1)
		return { top = p1, bottom = p1, left = p1, right = p1 }
	end,
	quad = function(p1, p2, p3, p4)
		return { top = p1, bottom = p3, left = p4, right = p2 }
	end
}
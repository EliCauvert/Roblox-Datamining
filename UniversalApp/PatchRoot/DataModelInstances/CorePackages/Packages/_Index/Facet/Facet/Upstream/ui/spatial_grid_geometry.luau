local _ = require("./spatial_grid_types")

return {
	integer = function(p1: number): boolean
		return p1 > 0 and p1 < 1e999 and p1 % 1 == 0
	end,
	inside = function(p1, p2, p3): boolean
		local Column: number = p1.column
		local IsColumnMatch: boolean = Column > 0 and (Column < 1e999 and Column % 1 == 0)
		
		if IsColumnMatch then
			local Row: number = p1.row
			IsColumnMatch = Row > 0 and (Row < 1e999 and Row % 1 == 0)
			
			if IsColumnMatch then
				local Width: number = p1.width
				IsColumnMatch = Width > 0 and (Width < 1e999 and Width % 1 == 0)
				
				if IsColumnMatch then
					local Height: number = p1.height
					IsColumnMatch = Height > 0 and (Height < 1e999 and Height % 1 == 0 and (p1.column + p1.width - 1 <= p2 and p1.row + p1.height - 1 <= p3))
				end
			end
		end
		return IsColumnMatch
	end,
	overlaps = function(p1, p2): boolean
		return p1.column < p2.column + p2.width and (p2.column < p1.column + p1.width and p1.row < p2.row + p2.height) and p2.row < p1.row + p1.height
	end
}
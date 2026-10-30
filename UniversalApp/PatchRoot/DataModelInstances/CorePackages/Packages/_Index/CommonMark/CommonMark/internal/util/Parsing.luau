return {
	CODE_BLOCK_INDENT = 4,
	columnsToNextTabStop = function(p1: number): number
		return 4 - p1 % 4
	end
}
return {
	identity = function(p1): string
		return `{if p1.rank > 0 then `rank:{p1.rank}` else `cell:{p1.cell}`}/{p1.universeId}/{p1.adFlag}/{p1.adId}`
	end
}
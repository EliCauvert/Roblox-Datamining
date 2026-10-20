return function(Value: number): string
	local Largest = math.max(0, (math.floor(Value)))
	
	return string.format("%d:%02d", math.floor(Largest / 60), Largest % 60)
end
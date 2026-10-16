return function(Value: number): string --[[ Line: 30 | Named "formatNumberWithShortUnits" ]]
	local Magnitude = math.abs(Value)
	local Text: string = if Magnitude >= 1000000000 then ("%.0fB"):format((math.floor(Value / 1000000000))) elseif Magnitude >= 1000000 then if Magnitude >= 100000000 then ("%.0fM"):format((math.floor(Value / 1000000))) else ("%.1fM"):format(Value / 1000000) elseif Magnitude >= 1000 then if Magnitude >= 100000 then ("%.0fK"):format((math.floor(Value / 1000))) else ("%.1fK"):format(Value / 1000) else tostring(Value)
	local D0W, D0W2 = Text:match("(%d+)%.0(%w+)")
	
	if D0W and D0W2 then
		Text = D0W .. D0W2
	end
	return Text
end
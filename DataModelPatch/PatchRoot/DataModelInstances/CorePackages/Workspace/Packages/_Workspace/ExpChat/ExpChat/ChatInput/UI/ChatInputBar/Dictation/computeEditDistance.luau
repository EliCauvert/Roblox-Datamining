return function(Text: string, Text1: string)
	if Text == Text1 then
		return 0
	end
	local CountText = #Text
	local CountText1 = #Text1
	
	if CountText == 0 then
		return CountText1
	end
	if CountText1 == 0 then
		return CountText
	end
	if CountText < CountText1 then
		local Text2: string = Text1
		Text1 = Text
		Text = Text2
		local Count: number = CountText1
		CountText1 = CountText
		CountText = Count
	end
	local Buffer = table.create(CountText1 + 1)
	local Buffer1 = table.create(CountText1 + 1)
	
	for i = 0, CountText1 do
		Buffer[i + 1] = i
	end
	for i1 = 1, CountText do
		Buffer1[1] = i1
		local ByteValue = string.byte(Text, i1)
		
		for i2 = 1, CountText1 do
			local NewBufferEntry = Buffer1[i2] + 1
			local NewBufferEntry1 = Buffer[i2] + (if ByteValue == string.byte(Text1, i2) then 0 else 1)
			local NewBufferEntry2 = Buffer[i2 + 1] + 1
			
			if NewBufferEntry < NewBufferEntry2 then
				NewBufferEntry2 = NewBufferEntry
			end
			if NewBufferEntry1 < NewBufferEntry2 then
				NewBufferEntry2 = NewBufferEntry1
			end
			Buffer1[i2 + 1] = NewBufferEntry2
		end
		local Buffer2 = Buffer1
		Buffer1 = Buffer
		Buffer = Buffer2
	end
	return Buffer[CountText1 + 1]
end
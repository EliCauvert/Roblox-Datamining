return function(Name) --[[ Line: 2 | Named "transparentFrame" ]]
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	
	return Frame
end
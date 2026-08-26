return function(p1, p2)
	if p1.SliceCenter then
		p1.SliceCenter = Rect.new(p1.SliceCenter.Min * p2, p1.SliceCenter.Max * p2)
		p1.SliceScale = (p1.SliceScale or 1) / p2
	end
	return p1
end
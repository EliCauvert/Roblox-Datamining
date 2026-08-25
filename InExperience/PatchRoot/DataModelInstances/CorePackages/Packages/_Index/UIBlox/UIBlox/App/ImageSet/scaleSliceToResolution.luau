return function(p0, p1)
	if p0.SliceCenter then
		p0.SliceCenter = Rect.new(p0.SliceCenter.Min * p1, p0.SliceCenter.Max * p1)
		p0.SliceScale = (p0.SliceScale or 1) / p1
	end
	return p0
end
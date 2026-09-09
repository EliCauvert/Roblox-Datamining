return function(p1)
	return if utf8.len(p1) == nil then nil else utf8.len(utf8.nfcnormalize(p1))
end
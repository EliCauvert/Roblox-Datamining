return function(Text)
	return if utf8.len(Text) == nil then nil else utf8.len(utf8.nfcnormalize(Text))
end
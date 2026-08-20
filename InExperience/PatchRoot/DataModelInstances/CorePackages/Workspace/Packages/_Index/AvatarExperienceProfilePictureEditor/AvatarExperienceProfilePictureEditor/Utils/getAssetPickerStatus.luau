return function(value, p0) --[[ line: 3 | named "getAssetPickerStatus" ]]
	return if value then "loading" elseif p0 then "error" else "ready"
end
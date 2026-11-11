local _ = require(script:FindFirstAncestor("NotApprovedPage").Common.Types)

return function(List): boolean
	if not List then
		return false
	end
	for _, value in List do
		if value == true then
			return true
		end
	end
	return false
end
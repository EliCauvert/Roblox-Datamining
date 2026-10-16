local Text = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text

return function(p1, p2, p3) --[[ Line: 5 ]]
	-- upvalues: Text (copy)
	return Text.GetTextHeight(p1, p2, p3)
end
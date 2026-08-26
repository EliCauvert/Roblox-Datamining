local stylePackage = require(script:FindFirstAncestor("Style").Parent.Lumberyak).Logger.new(nil, "StylePackage")
stylePackage:addSink({
	maxLevel = stylePackage.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return stylePackage
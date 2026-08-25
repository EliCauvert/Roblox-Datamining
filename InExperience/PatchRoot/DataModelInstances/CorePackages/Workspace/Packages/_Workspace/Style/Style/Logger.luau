local stylePackage = require(script:FindFirstAncestor("Style").Parent.Lumberyak).Logger.new(nil, "StylePackage")
stylePackage:addSink({
	maxLevel = stylePackage.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return stylePackage
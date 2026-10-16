local StylePackage = require(script:FindFirstAncestor("Style").Parent.Lumberyak).Logger.new(nil, "StylePackage")
StylePackage:addSink({
	maxLevel = StylePackage.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 10 ]]
		print(p1)
	end
})

return StylePackage
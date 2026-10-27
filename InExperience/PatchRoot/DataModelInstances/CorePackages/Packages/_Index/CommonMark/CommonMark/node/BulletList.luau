local ListBlockModule = require(script:FindFirstAncestor("CommonMark").node.ListBlock)

return function()
	-- upvalues: ListBlockModule (copy)
	local BulletList = ListBlockModule.new("BulletList")
	BulletList.marker = nil
	
	return BulletList
end
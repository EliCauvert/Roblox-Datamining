local Parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ProductInfo) --[[ Line: 7 ]]
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(ProductInfo, "table", "SetGameProductInfo action expects productInfo to be a table")
	
	return { productInfo = ProductInfo }
end)
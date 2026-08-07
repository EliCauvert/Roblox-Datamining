local foundation = script:FindFirstAncestor("Foundation")
local builderIconsModule = require(foundation.Parent.BuilderIcons)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)

return function(p0) --[[ line: 8 | named "getBuilderIconVariant" ]]
	-- upvalues: isBuilderIconModule (ref), builderIconsModule (ref)
	return if pcall(function() --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		return p0.Text
	end) then if isBuilderIconModule(p0.Text) then if p0.FontFace.Weight == Enum.FontWeight.Bold then builderIconsModule.IconVariant.Filled else builderIconsModule.IconVariant.Regular else nil else nil
end
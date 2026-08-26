local foundation = script:FindFirstAncestor("Foundation")
local builderIconsModule = require(foundation.Parent.BuilderIcons)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)

return function(p1)
	-- upvalues: isBuilderIconModule (ref), builderIconsModule (ref)
	return if pcall(function()
		-- upvalues: p1 (ref)
		return p1.Text
	end) then if isBuilderIconModule(p1.Text) then if p1.FontFace.Weight == Enum.FontWeight.Bold then builderIconsModule.IconVariant.Filled else builderIconsModule.IconVariant.Regular else nil else nil
end
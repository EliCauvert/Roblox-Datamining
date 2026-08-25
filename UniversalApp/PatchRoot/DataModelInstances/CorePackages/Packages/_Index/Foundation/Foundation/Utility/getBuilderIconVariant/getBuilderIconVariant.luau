local foundation = script:FindFirstAncestor("Foundation")
local builderIconsModule = require(foundation.Parent.BuilderIcons)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)

return function(p0)
	-- upvalues: isBuilderIconModule (ref), builderIconsModule (ref)
	return if pcall(function()
		-- upvalues: p0 (ref)
		return p0.Text
	end) then if isBuilderIconModule(p0.Text) then if p0.FontFace.Weight == Enum.FontWeight.Bold then builderIconsModule.IconVariant.Filled else builderIconsModule.IconVariant.Regular else nil else nil
end
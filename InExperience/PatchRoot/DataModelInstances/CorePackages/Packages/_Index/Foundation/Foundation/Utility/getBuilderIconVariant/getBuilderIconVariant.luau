local Foundation = script:FindFirstAncestor("Foundation")
local BuilderIconsModule = require(Foundation.Parent.BuilderIcons)
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)

return function(Label) --[[ Line: 8 | Named "getBuilderIconVariant" ]]
	-- upvalues: IsBuilderIconModule (copy), BuilderIconsModule (copy)
	return if pcall(function() --[[ Line: 9 ]]
		-- upvalues: Label (copy)
		return Label.Text
	end) and IsBuilderIconModule(Label.Text) then if Label.FontFace.Weight == Enum.FontWeight.Bold then BuilderIconsModule.IconVariant.Filled else BuilderIconsModule.IconVariant.Regular else nil
end
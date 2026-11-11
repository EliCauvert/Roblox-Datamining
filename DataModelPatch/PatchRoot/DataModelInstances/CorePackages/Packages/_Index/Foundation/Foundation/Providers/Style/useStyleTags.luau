local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TagsContextModule = require(script.Parent.TagsContext)
local GetFormattedTagsModule = require(Foundation.Utility.getFormattedTags)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: GetFormattedTagsModule (copy), ReactModule (copy), TagsContextModule (copy), FlagsModule (copy)
	local FormattedTagsModule = GetFormattedTagsModule(p1)
	local UseContextResult = ReactModule.useContext(TagsContextModule)
	ReactModule.useLayoutEffect(function()
		-- upvalues: FormattedTagsModule (copy), FlagsModule (upval), UseContextResult (copy)
		if FormattedTagsModule ~= nil then
			if FlagsModule.FoundationUseStyleSheetRegistry then
				UseContextResult(string.split(FormattedTagsModule, " "))
				
				return
			end
			UseContextResult(FormattedTagsModule)
		end
	end, {
		FormattedTagsModule,
		if FlagsModule.FoundationUseStyleSheetRegistry then UseContextResult else nil
	})
	
	return FormattedTagsModule
end
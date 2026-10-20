local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TagsContextModule = require(script.Parent.TagsContext)
local GetFormattedTagsModule = require(Foundation.Utility.getFormattedTags)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: GetFormattedTagsModule (copy), ReactModule (copy), TagsContextModule (copy)
	local FormattedTagsModule = GetFormattedTagsModule(p1)
	local UseContextResult = ReactModule.useContext(TagsContextModule)
	ReactModule.useLayoutEffect(function()
		-- upvalues: FormattedTagsModule (copy), UseContextResult (copy)
		if FormattedTagsModule ~= nil then
			UseContextResult(string.split(FormattedTagsModule, " "))
		end
	end, { FormattedTagsModule, UseContextResult })
	
	return FormattedTagsModule
end
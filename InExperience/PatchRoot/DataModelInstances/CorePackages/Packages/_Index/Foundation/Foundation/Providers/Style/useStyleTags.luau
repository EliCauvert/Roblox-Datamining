local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local tagsContextModule = require(parent.TagsContext)
local getFormattedTagsModule = require(foundation.Utility.getFormattedTags)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Components.Types)

return function(p0) --[[ line: 14 | named "useStyleTags" ]]
	-- upvalues: getFormattedTagsModule (ref), reactModule (ref), tagsContextModule (ref), flagsModule (ref)
	local var5 = getFormattedTagsModule(p0)
	local var6 = reactModule.useContext(tagsContextModule)
	reactModule.useLayoutEffect(function() --[[ line: 18 ]]
		-- upvalues: var5 (ref), flagsModule (copy), var6 (ref)
		if var5 ~= nil then
			if flagsModule.FoundationUseStyleSheetRegistry then
				var6(string.split(var5, " "))
				
				return
			end
			var6(var5)
		end
	end, {
		var5,
		if flagsModule.FoundationUseStyleSheetRegistry then var6 else nil
	})
	
	return var5
end
local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local tagsContextModule = require(parent.TagsContext)
local getFormattedTagsModule = require(foundation.Utility.getFormattedTags)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: getFormattedTagsModule (ref), reactModule (ref), tagsContextModule (ref)
	local var1 = getFormattedTagsModule(p1)
	local var2 = reactModule.useContext(tagsContextModule)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var2 (ref)
		if var1 ~= nil then
			var2(string.split(var1, " "))
		end
	end, { var1, var2 })
	
	return var1
end
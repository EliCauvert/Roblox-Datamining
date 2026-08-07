-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local tagsContextModule = require(parent.TagsContext)
local getFormattedTagsModule = require(foundation.Utility.getFormattedTags)
local _ = require(foundation.Components.Types)

return function(p0) --[[ line: 12 | named "useStyleTags" ]]
	-- upvalues: getFormattedTagsModule (ref), reactModule (ref), tagsContextModule (ref)
	local var4 = getFormattedTagsModule(p0)
	local var5 = reactModule.useContext(tagsContextModule)
	reactModule.useLayoutEffect(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), var5 (ref)
		if var4 ~= nil then
			var5(string.split(var4, " "))
		end
	end, { var4, var5 })
	
	return var4
end
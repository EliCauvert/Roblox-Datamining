local ContentProvider = game:GetService("ContentProvider")
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local PromiseModule = require(Parent.Promise)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1, p2, p3)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), PromiseModule (copy), ContentProvider (copy), MutedErrorFunction (copy)
	return function(_)
		-- upvalues: p1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), p2 (copy), p3 (copy), PromiseModule (upval), ContentProvider (upval), MutedErrorFunction (upval)
		local List = {}
		
		for _, value in ipairs(p1) do
			table.insert(List, (GetRbxthumbWithTypeSizeAndOptionsFunction(value, p2, p3)))
		end
		return PromiseModule.new(function(Callback, _)
			-- upvalues: ContentProvider (upval), List (copy), MutedErrorFunction (upval)
			task.spawn(function()
				-- upvalues: ContentProvider (upval), List (upval), MutedErrorFunction (upval), Callback (copy)
				if not pcall(function()
					-- upvalues: ContentProvider (upval), List (upval)
					ContentProvider:PreloadAsync(List)
				end) then
					MutedErrorFunction("Could not preload content provider thumbnails")
				end
				Callback()
			end)
		end)
	end
end
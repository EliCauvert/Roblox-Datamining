local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local RemoveDuplicatesPlaceMediaAssets = game:DefineFastFlag("RemoveDuplicatesPlaceMediaAssets", false)

return function(Callback, p1) --[[ Line: 9 ]]
	-- upvalues: Url (copy), RemoveDuplicatesPlaceMediaAssets (copy), PromiseModule (copy)
	local List = {}
	local t = {}
	
	return Callback(string.format("%sv2/games/%s/media", Url.GAME_URL, p1), "GET"):andThen(function(Result) --[[ Line: 16 ]]
		-- upvalues: RemoveDuplicatesPlaceMediaAssets (upval), t (copy), List (copy)
		if Result and Result.responseBody and Result.responseBody.data then
			for _, entry in ipairs(Result.responseBody.data) do
				if entry.imageId then
					if RemoveDuplicatesPlaceMediaAssets then
						local Text = tostring(entry.imageId)
						
						if not t[Text] then
							t[Text] = true
							table.insert(List, Text)
						end
					else
						table.insert(List, (tostring(entry.imageId)))
					end
				end
			end
		end
	end):finally(function() --[[ Line: 33 ]]
		-- upvalues: PromiseModule (upval), List (copy)
		return PromiseModule.resolve(List)
	end)
end
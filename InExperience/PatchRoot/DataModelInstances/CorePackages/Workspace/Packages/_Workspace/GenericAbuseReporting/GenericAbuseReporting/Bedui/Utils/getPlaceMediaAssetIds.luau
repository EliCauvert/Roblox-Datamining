local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local removeDuplicatesPlaceMediaAssets = game:DefineFastFlag("RemoveDuplicatesPlaceMediaAssets", false)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: url (ref), removeDuplicatesPlaceMediaAssets (ref), promiseModule (ref)
	local formattedText = string.format("%sv2/games/%s/media", url.GAME_URL, p1)
	local t = {}
	local t_1 = {}
	
	return p0(formattedText, "GET"):andThen(function(p2) --[[ line: 16 ]]
		-- upvalues: removeDuplicatesPlaceMediaAssets (copy), t_1 (ref), t (ref)
		if p2 and p2.responseBody and p2.responseBody.data then
			for i, v in ipairs(p2.responseBody.data) do
				if v.imageId then
					if removeDuplicatesPlaceMediaAssets then
						local var5 = tostring(v.imageId)
						
						if not t_1[var5] then
							t_1[var5] = true
							table.insert(t, var5)
						end
					else
						table.insert(t, tostring(v.imageId))
					end
				end
			end
		end
	end):finally(function() --[[ line: 33 ]]
		-- upvalues: promiseModule (copy), t (ref)
		return promiseModule.resolve(t)
	end)
end
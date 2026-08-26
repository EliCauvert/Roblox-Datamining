local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local removeDuplicatesPlaceMediaAssets = game:DefineFastFlag("RemoveDuplicatesPlaceMediaAssets", false)

return function(p1, p2)
	-- upvalues: url (ref), removeDuplicatesPlaceMediaAssets (ref), promiseModule (ref)
	local formattedText = string.format("%sv2/games/%s/media", url.GAME_URL, p2)
	local t = {}
	local t_1 = {}
	
	return p1(formattedText, "GET"):andThen(function(p3)
		-- upvalues: removeDuplicatesPlaceMediaAssets (copy), t_1 (ref), t (ref)
		if p3 and p3.responseBody and p3.responseBody.data then
			for i, v in ipairs(p3.responseBody.data) do
				if v.imageId then
					if removeDuplicatesPlaceMediaAssets then
						local var1 = tostring(v.imageId)
						
						if not t_1[var1] then
							t_1[var1] = true
							table.insert(t, var1)
						end
					else
						table.insert(t, tostring(v.imageId))
					end
				end
			end
		end
	end):finally(function()
		-- upvalues: promiseModule (copy), t (ref)
		return promiseModule.resolve(t)
	end)
end
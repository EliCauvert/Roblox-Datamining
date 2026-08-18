local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local promiseModule = require(avatarExperienceProfilePictureEditor.Parent.Promise)
local parseUserAvatarConfigurationsV4 = require(avatarExperienceProfilePictureEditor.Shared.parseUserAvatarConfigurationsV4).parseUserAvatarConfigurationsV4
local _ = require(avatarExperienceProfilePictureEditor.Shared.parseCloseupCameraConfig)
local userAvatarConfigurationsApiModule = require(script.Parent.userAvatarConfigurationsApi)
local t = {}
local t_1 = {}

local function _(p0) --[[ line: 25 | named "normalizeSelectionTypes" ]]
	if typeof(p0) == "string" then
		return { p0 }
	end
	local cloned = table.clone(p0)
	table.sort(cloned)
	
	return cloned
end

local _ = function(p1) --[[ line: 39 | named "clearCacheEntry" ]]
	-- upvalues: t (ref), t_1 (ref)
	t[p1] = nil
	t_1[p1] = nil
end

return {
	buildCacheKey = function(p2, p3) --[[ line: 35 ]]
		local list
		local var6 = "%*:%*"
		local concat = table.concat
		
		if typeof(p3) == "string" then
			list = { p3 }
		else
			local cloned = table.clone(p3)
			table.sort(cloned)
			list = cloned
		end
		return var6:format(p2, concat(list, ","))
	end,
	fetchCached = function(p4, p5, p6) --[[ line: 53 ]]
		-- upvalues: userAvatarConfigurationsApiModule (ref), t (ref), promiseModule (ref), t_1 (ref), parseUserAvatarConfigurationsV4 (ref)
		local list
		p6 = p6 or userAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
		local var10 = "%*:%*"
		local var11 = p5
		local concat = table.concat
		
		if typeof(p6) == "string" then
			list = { p6 }
		else
			local cloned = table.clone(p6)
			table.sort(cloned)
			list = cloned
		end
		var10 = var10:format(var11, concat(list, ","))
		var10 = t[var10]
		
		if var10 then
			return promiseModule.resolve(var10)
		end
		local var14 = t_1[var10]
		
		if var14 then
			return var14
		end
		local var15 = userAvatarConfigurationsApiModule.fetchUserAvatarConfigurations(p4, p5, p6):andThen(function(p8) --[[ line: 69 ]]
			-- upvalues: parseUserAvatarConfigurationsV4 (copy), t (copy), var10 (ref), t_1 (copy)
			local t_2 = {
				response = p8,
				parsed = parseUserAvatarConfigurationsV4(p8.responseBody)
			}
			t[var10] = t_2
			t_1[var10] = nil
			
			return t_2
		end):catch(function(p7) --[[ line: 78 ]]
			-- upvalues: t_1 (copy), var10 (ref), promiseModule (copy)
			t_1[var10] = nil
			
			return promiseModule.reject(p7)
		end)
		t_1[var10] = var15
		
		return var15
	end,
	invalidate = function(p9) --[[ line: 44 ]]
		-- upvalues: t (ref), t_1 (ref)
		local var17 = `{p9}:`
		
		for i in t do
			if string.sub(i, 1, #var17) == var17 then
				t[i] = nil
				t_1[i] = nil
			end
		end
	end,
	clearCacheForTests = function() --[[ line: 87 ]]
		-- upvalues: t (ref), t_1 (ref)
		table.clear(t)
		table.clear(t_1)
	end
}
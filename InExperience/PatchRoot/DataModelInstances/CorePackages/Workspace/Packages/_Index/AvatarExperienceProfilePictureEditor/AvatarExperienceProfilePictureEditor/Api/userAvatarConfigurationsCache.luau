local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local promiseModule = require(avatarExperienceProfilePictureEditor.Parent.Promise)
local parseUserAvatarConfigurationsV4 = require(avatarExperienceProfilePictureEditor.Shared.parseUserAvatarConfigurationsV4).parseUserAvatarConfigurationsV4
local _ = require(avatarExperienceProfilePictureEditor.Shared.parseCloseupCameraConfig)
local userAvatarConfigurationsApiModule = require(script.Parent.userAvatarConfigurationsApi)
local t = {}
local t_1 = {}

local function _(p1)
	if typeof(p1) == "string" then
		return { p1 }
	end
	local cloned = table.clone(p1)
	table.sort(cloned)
	
	return cloned
end

local _ = function(p1)
	-- upvalues: t (ref), t_1 (ref)
	t[p1] = nil
	t_1[p1] = nil
end

return {
	buildCacheKey = function(p1, p2)
		local list
		local var1 = "%*:%*"
		local concat = table.concat
		
		if typeof(p2) == "string" then
			list = { p2 }
		else
			local cloned = table.clone(p2)
			table.sort(cloned)
			list = cloned
		end
		return var1:format(p1, concat(list, ","))
	end,
	fetchCached = function(p1, p2, p3)
		-- upvalues: userAvatarConfigurationsApiModule (ref), t (ref), promiseModule (ref), t_1 (ref), parseUserAvatarConfigurationsV4 (ref)
		local list
		p3 = p3 or userAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
		local var1 = "%*:%*"
		local concat = table.concat
		
		if typeof(p3) == "string" then
			list = { p3 }
		else
			local cloned = table.clone(p3)
			table.sort(cloned)
			list = cloned
		end
		var1 = var1:format(p2, concat(list, ","))
		local var2 = t[var1]
		
		if var2 then
			return promiseModule.resolve(var2)
		end
		local var3 = t_1[var1]
		
		if var3 then
			return var3
		end
		local var4 = userAvatarConfigurationsApiModule.fetchUserAvatarConfigurations(p1, p2, p3):andThen(function(p4)
			-- upvalues: parseUserAvatarConfigurationsV4 (copy), t (copy), var1 (ref), t_1 (copy)
			local t_2 = {
				response = p4,
				parsed = parseUserAvatarConfigurationsV4(p4.responseBody)
			}
			t[var1] = t_2
			t_1[var1] = nil
			
			return t_2
		end):catch(function(p4)
			-- upvalues: t_1 (copy), var1 (ref), promiseModule (copy)
			t_1[var1] = nil
			
			return promiseModule.reject(p4)
		end)
		t_1[var1] = var4
		
		return var4
	end,
	invalidate = function(p1)
		-- upvalues: t (ref), t_1 (ref)
		local var1 = `{p1}:`
		
		for i in t do
			if string.sub(i, 1, #var1) == var1 then
				t[i] = nil
				t_1[i] = nil
			end
		end
	end,
	clearCacheForTests = function()
		-- upvalues: t (ref), t_1 (ref)
		table.clear(t)
		table.clear(t_1)
	end
}
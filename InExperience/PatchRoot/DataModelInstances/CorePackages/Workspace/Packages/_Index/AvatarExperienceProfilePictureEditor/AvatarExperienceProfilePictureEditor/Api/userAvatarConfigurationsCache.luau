local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local PromiseModule = require(AvatarExperienceProfilePictureEditor.Parent.Promise)
local ParseUserAvatarConfigurationsV4Function = require(AvatarExperienceProfilePictureEditor.Shared.parseUserAvatarConfigurationsV4).parseUserAvatarConfigurationsV4
local _ = require(AvatarExperienceProfilePictureEditor.Shared.parseCloseupCameraConfig)
local UserAvatarConfigurationsApiModule = require(script.Parent.userAvatarConfigurationsApi)
local Tbl = {}
local Tbl1 = {}

local function _(Tbl) --[[ Line: 25 | Named "normalizeSelectionTypes" ]]
	if typeof(Tbl) == "string" then
		return { Tbl }
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		
		return Copy
	end
end

local _ = function(Key) --[[ Line: 39 | Named "clearCacheEntry" ]]
	-- upvalues: Tbl (copy), Tbl1 (copy)
	Tbl[Key] = nil
	Tbl1[Key] = nil
end

return {
	buildCacheKey = function(p1, Tbl): string --[[ Line: 35 ]]
		local v1 = "%*:%*"
		local ConcatFunction = table.concat
		local list = nil
		
		if typeof(Tbl) == "string" then
			list = { Tbl }
		else
			local Copy = table.clone(Tbl)
			table.sort(Copy)
			list = Copy
		end
		return (v1:format(p1, (ConcatFunction(list, ","))))
	end,
	fetchCached = function(p1, p2, p3) --[[ Line: 53 ]]
		-- upvalues: UserAvatarConfigurationsApiModule (copy), Tbl (copy), PromiseModule (copy), Tbl1 (copy), ParseUserAvatarConfigurationsV4Function (copy)
		local Tbl2 = p3 or UserAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
		local v1 = "%*:%*"
		local ConcatFunction = table.concat
		local list = nil
		
		if typeof(Tbl2) == "string" then
			list = { Tbl2 }
		else
			local Copy = table.clone(Tbl2)
			table.sort(Copy)
			list = Copy
		end
		local FormatResult: string = v1:format(p2, (ConcatFunction(list, ",")))
		local Entry = Tbl[FormatResult]
		
		if Entry then
			return PromiseModule.resolve(Entry)
		end
		local Entry1 = Tbl1[FormatResult]
		
		if Entry1 then
			return Entry1
		else
			local v2 = UserAvatarConfigurationsApiModule.fetchUserAvatarConfigurations(p1, p2, Tbl2):andThen(function(Result) --[[ Line: 69 ]]
				-- upvalues: ParseUserAvatarConfigurationsV4Function (upval), Tbl (upval), FormatResult (copy), Tbl1 (upval)
				local config = {
					response = Result,
					parsed = ParseUserAvatarConfigurationsV4Function(Result.responseBody)
				}
				Tbl[FormatResult] = config
				Tbl1[FormatResult] = nil
				
				return config
			end):catch(function(Err) --[[ Line: 78 ]]
				-- upvalues: Tbl1 (upval), FormatResult (copy), PromiseModule (upval)
				Tbl1[FormatResult] = nil
				
				return PromiseModule.reject(Err)
			end)
			Tbl1[FormatResult] = v2
			
			return v2
		end
	end,
	invalidate = function(p1) --[[ Line: 44 ]]
		-- upvalues: Tbl (copy), Tbl1 (copy)
		local Text: string = `{p1}:`
		
		for i in Tbl do
			if string.sub(i, 1, #Text) == Text then
				Tbl[i] = nil
				Tbl1[i] = nil
			end
		end
	end,
	clearCacheForTests = function() --[[ Line: 87 ]]
		-- upvalues: Tbl (copy), Tbl1 (copy)
		table.clear(Tbl)
		table.clear(Tbl1)
	end
}
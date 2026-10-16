local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local LocalizationModule = require(Parent.Localization)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local SocialCountsConfigModule = require(script.Parent.Parent.config.SocialCountsConfig)

return function(_, p1, p2, MutualFriendIds) --[[ Line: 25 | Named "useSocialCountsData" ]]
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), CryoModule (copy), SocialCountsConfigModule (copy), UseLocalizationFunction (copy), AbbreviateCountFunction (copy)
	local Counts = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader).counts
	local UseLocalizationResult = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 33 ]]
		-- upvalues: CryoModule (upval), SocialCountsConfigModule (upval)
		return CryoModule.Dictionary.map(SocialCountsConfigModule.RowConfig, function(p3) --[[ Line: 34 ]]
			return p3.textKey
		end)
	end, {})))
	local UseLocalizationResult1 = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: CryoModule (upval), SocialCountsConfigModule (upval)
		return CryoModule.Dictionary.map(SocialCountsConfigModule.RowConfig, function(p3) --[[ Line: 42 ]]
			return p3.singleTextKey
		end)
	end, {})))
	
	return ReactModule.useMemo(function() --[[ Line: 49 ]]
		-- upvalues: Counts (copy), SocialCountsConfigModule (upval), UseLocalizationResult (copy), UseLocalizationResult1 (copy), MutualFriendIds (copy), AbbreviateCountFunction (upval), p2 (copy), p1 (copy)
		local List = {}
		
		for FieldName, count in Counts do
			local RowConfigEntry = SocialCountsConfigModule.RowConfig[FieldName]
			
			if RowConfigEntry then
				local Count = Counts[RowConfigEntry.enabledKey]
				
				if Count == nil then
					Count = true
				end
				table.insert(List, {
					fieldName = FieldName,
					count = AbbreviateCountFunction(count),
					text = if count == 1 and UseLocalizationResult1[FieldName] then UseLocalizationResult1[FieldName] else UseLocalizationResult[FieldName],
					layoutOrder = RowConfigEntry.layoutOrder,
					leading = if RowConfigEntry.getLeading and MutualFriendIds then RowConfigEntry.getLeading({ mutualFriendIds = MutualFriendIds }) else nil,
					isDisabled = RowConfigEntry.getIsDisabled(p2, p1, Count)
				})
			end
		end
		table.sort(List, function(A, B): boolean --[[ Line: 89 ]]
			return A.layoutOrder < B.layoutOrder
		end)
		
		return List
	end, {
		Counts, UseLocalizationResult, UseLocalizationResult1, p2, p1, MutualFriendIds
	})
end
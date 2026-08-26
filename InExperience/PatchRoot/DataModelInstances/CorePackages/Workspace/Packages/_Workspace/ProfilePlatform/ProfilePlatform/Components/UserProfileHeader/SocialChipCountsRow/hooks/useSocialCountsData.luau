local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local localizationModule = require(parent.Localization)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useLocalization = localizationModule.Hooks.useLocalization
local abbreviateCount = localizationModule.abbreviateCount
local socialCountsConfigModule = require(script.Parent.Parent.config.SocialCountsConfig)

return function(_, p1, p2, p3)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), cryoModule (ref), socialCountsConfigModule (ref), useLocalization (ref), abbreviateCount (ref)
	local counts = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).counts
	local var1 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), socialCountsConfigModule (copy)
		return cryoModule.Dictionary.map(socialCountsConfigModule.RowConfig, function(p4)
			return p4.textKey
		end)
	end, {}))
	local var2 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), socialCountsConfigModule (copy)
		return cryoModule.Dictionary.map(socialCountsConfigModule.RowConfig, function(p4)
			return p4.singleTextKey
		end)
	end, {}))
	
	return reactModule.useMemo(function()
		-- upvalues: counts (ref), socialCountsConfigModule (copy), var1 (ref), var2 (ref), p3 (ref), abbreviateCount (copy), p2 (ref), p1 (ref)
		local t = {}
		
		for i, v in counts do
			local var3 = socialCountsConfigModule.RowConfig[i]
			
			if var3 then
				local enabledKey = counts[var3.enabledKey]
				
				if enabledKey == nil then
					enabledKey = true
				end
				table.insert(t, {
					fieldName = i,
					count = abbreviateCount(v),
					text = if v == 1 and var2[i] then var2[i] else var1[i],
					layoutOrder = var3.layoutOrder,
					leading = if var3.getLeading and p3 then var3.getLeading({ mutualFriendIds = p3 }) else nil,
					isDisabled = var3.getIsDisabled(p2, p1, enabledKey)
				})
			end
		end
		table.sort(t, function(p4, p5)
			return p4.layoutOrder < p5.layoutOrder
		end)
		
		return t
	end, {
		counts, var1, var2, p2, p1, p3
	})
end
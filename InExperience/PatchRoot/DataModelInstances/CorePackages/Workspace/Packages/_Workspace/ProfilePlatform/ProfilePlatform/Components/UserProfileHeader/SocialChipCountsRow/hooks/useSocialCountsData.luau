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

return function(_, p0, p1, p2)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), cryoModule (ref), socialCountsConfigModule (ref), useLocalization (ref), abbreviateCount (ref)
	local counts = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).counts
	local var7 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), socialCountsConfigModule (copy)
		return cryoModule.Dictionary.map(socialCountsConfigModule.RowConfig, function(p3)
			return p3.textKey
		end)
	end, {}))
	local var8 = useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), socialCountsConfigModule (copy)
		return cryoModule.Dictionary.map(socialCountsConfigModule.RowConfig, function(p4)
			return p4.singleTextKey
		end)
	end, {}))
	
	return reactModule.useMemo(function()
		-- upvalues: counts (ref), socialCountsConfigModule (copy), var7 (ref), var8 (ref), p2 (ref), abbreviateCount (copy), p1 (ref), p0 (ref)
		local t = {}
		
		for i, v in counts do
			local var10 = socialCountsConfigModule.RowConfig[i]
			
			if var10 then
				local enabledKey = counts[var10.enabledKey]
				
				if enabledKey == nil then
					enabledKey = true
				end
				table.insert(t, {
					fieldName = i,
					count = abbreviateCount(v),
					text = if v == 1 and var8[i] then var8[i] else var7[i],
					layoutOrder = var10.layoutOrder,
					leading = if var10.getLeading and p2 then var10.getLeading({ mutualFriendIds = p2 }) else nil,
					isDisabled = var10.getIsDisabled(p1, p0, enabledKey)
				})
			end
		end
		table.sort(t, function(p5, p6)
			return p5.layoutOrder < p6.layoutOrder
		end)
		
		return t
	end, {
		counts, var7, var8, p1, p0, p2
	})
end
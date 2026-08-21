local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local reactModule = require(parent.React)
local universalShareSheet = require(parent.ShareSheet).UniversalShareSheet
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local var4 = if fFlagEnableShareSheet then require(parent.DataHydration) else nil
local var5 = if fFlagEnableShareSheet then require(parent.Signals) else nil
local var6 = if fFlagEnableShareSheet then require(parent.SignalsReact) else nil

local function getGameShareUrl(p0) --[[ line: 25 ]]
	return `https://www.roblox.com/games/{p0}`
end

local function formatSuccessSnackbarText(p1) --[[ line: 29 ]]
	-- upvalues: localizationStringsModule (ref)
	local var10 = p1[1]
	
	return localizationStringsModule.formatGameSharedWithTarget(if var10 then var10.displayName else "")
end

local function sharePublishedExperience(p2, p3) --[[ line: 34 ]]
	-- upvalues: fFlagEnableShareSheet (ref), universalShareSheet (ref), formatSuccessSnackbarText (ref), localizationStringsModule (ref), isSubjectToDesktopPolicies (ref), default (ref)
	local var11 = `https://www.roblox.com/games/{p2}`
	
	if fFlagEnableShareSheet then
		universalShareSheet.show({
			context = "BuildExperienceGameShare",
			telemetryId = tostring(p2),
			formatSuccessSnackbarText = formatSuccessSnackbarText,
			messagePlaceholder = if p3 then localizationStringsModule.formatShareExperience(p3) else nil,
			url = var11
		})
		
		return nil
	elseif isSubjectToDesktopPolicies() then
		default:setClipboardText({ context = "BuildExperienceGameShare", text = var11 })
		
		return { copiedToClipboard = true, url = var11 }
	end
	default:shareUrl({ context = "BuildExperienceGameShare", url = var11 })
	
	return { copiedToClipboard = false, url = var11 }
end

return {
	getGameShareUrl = getGameShareUrl,
	sharePublishedExperience = sharePublishedExperience,
	useSharePublishedExperience = if fFlagEnableShareSheet then function(p5) --[[ line: 76 ]]
		-- upvalues: reactModule (ref), var5 (ref), var4 (ref), var6 (ref), sharePublishedExperience (ref)
		local var12 = if p5 then tostring(p5) else nil
		local var13 = var6.useSignalState(reactModule.useMemo(function() --[[ line: 78 ]]
			-- upvalues: var5 (copy), var12 (ref), var4 (copy)
			return var5.createComputed(function(p6) --[[ line: 79 ]]
				-- upvalues: var12 (copy), var4 (copy)
				return if var12 == nil then nil else var4.Game.getGameInfoStore(p6).getAndFetchGameInfo(var12).data(p6)
			end)
		end, { var12 }))
		local var14 = if var13 and not var13.isUnavailable and var13.name ~= "" then var13.name else nil
		
		return reactModule.useCallback(function(p7) --[[ line: 96 ]]
			-- upvalues: sharePublishedExperience (copy), var14 (ref)
			sharePublishedExperience(p7, var14)
		end, { var14 })
	end else function() --[[ line: 101 ]]
		-- upvalues: reactModule (ref), sharePublishedExperience (ref)
		return reactModule.useCallback(function(p4) --[[ line: 102 ]]
			-- upvalues: sharePublishedExperience (copy)
			sharePublishedExperience(p4, nil)
		end, {})
	end
}
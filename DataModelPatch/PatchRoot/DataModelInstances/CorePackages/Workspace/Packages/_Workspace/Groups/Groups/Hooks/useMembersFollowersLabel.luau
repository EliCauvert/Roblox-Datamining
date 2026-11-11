local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Groups.Common.TextKeys)

return function(p1)
	-- upvalues: ReactModule (copy), TextKeysModule (copy), UseLocalizationFunction (copy)
	local HasSocialModules = p1.hasSocialModules
	local Count = p1.count
	local TruncatedCount = p1.truncatedCount
	local Capitalize = p1.capitalize or false
	local UseLocalizationResult = UseLocalizationFunction({
		noun = ReactModule.useMemo(function()
			-- upvalues: Count (copy), HasSocialModules (copy), Capitalize (copy), TextKeysModule (upval)
			local IsCountMatch = Count == 1
			
			return if HasSocialModules then if IsCountMatch then if Capitalize then TextKeysModule.LabelMember else TextKeysModule.LabelMemberLowerCase elseif Capitalize then TextKeysModule.LabelMemberCapitalPlural else TextKeysModule.LabelMemberLowerCasePlural elseif IsCountMatch then if Capitalize then TextKeysModule.LabelFollowerCapital else TextKeysModule.LabelFollower elseif Capitalize then TextKeysModule.LabelFollowerCapitalPlural else TextKeysModule.LabelFollowerPlural
		end, { Count, Capitalize, HasSocialModules })
	})
	
	return (ReactModule.useMemo(function(): string
		-- upvalues: TruncatedCount (copy), Count (copy), UseLocalizationResult (copy)
		return `{if TruncatedCount and TruncatedCount ~= "" then TruncatedCount else tostring(Count)} {UseLocalizationResult.noun}`
	end, { TruncatedCount, Count, UseLocalizationResult.noun }))
end
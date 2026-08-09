local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCustomizeMakeupSupport = avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons

return function(_) --[[ line: 40 | named "SlotItemCardThumbnail" ]]
	-- upvalues: useTokens (ref), fFlagAXCustomizeMakeupSupport (ref), fFlagAXMigrateBuilderIcons (ref), foundationModule (ref), reactModule (ref), itemCardThumbnail (ref), fFlagRenameDeprecatedUIBloxTokens (ref), icon (ref), iconSize (ref)
-- FATAL: Failed to generate AST for `SlotItemCardThumbnail` function:
runtime : [KeyError] :11990: 1
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end
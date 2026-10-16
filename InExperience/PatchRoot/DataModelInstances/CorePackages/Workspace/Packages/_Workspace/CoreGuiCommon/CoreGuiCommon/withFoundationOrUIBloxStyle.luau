local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local FFlagCoreUiMigrateUIBloxToFoundation = require(Parent.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation

local function FoundationStyleAdapter(p1) --[[ Line: 15 ]]
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy)
	return p1.renderContent((p1.tokenMapper(UseTokensFunction(), (UsePreferencesFunction()))))
end

return function(TokenMapper, Callback) --[[ Line: 22 | Named "withFoundationOrUIBloxStyle" ]]
	-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (copy), RoactModule (copy), FoundationStyleAdapter (copy), WithStyleFunction (copy)
	return if FFlagCoreUiMigrateUIBloxToFoundation then RoactModule.createElement(FoundationStyleAdapter, { tokenMapper = TokenMapper, renderContent = Callback }) else WithStyleFunction(function(p1) --[[ Line: 29 ]]
		-- upvalues: Callback (copy)
		return Callback(p1)
	end)
end
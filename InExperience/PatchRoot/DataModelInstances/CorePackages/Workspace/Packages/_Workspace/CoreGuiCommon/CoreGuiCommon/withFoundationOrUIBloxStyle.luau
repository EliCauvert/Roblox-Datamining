local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local withStyle = require(parent.UIBlox).Style.withStyle
local fFlagCoreUiMigrateUIBloxToFoundation = require(parent.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation

local function FoundationStyleAdapter(p0) --[[ line: 15 ]]
	-- upvalues: useTokens (ref), usePreferences (ref)
	return p0.renderContent(p0.tokenMapper(useTokens(), usePreferences()))
end

return function(p1, p2) --[[ line: 22 | named "withFoundationOrUIBloxStyle" ]]
	-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (ref), roactModule (ref), FoundationStyleAdapter (ref), withStyle (ref)
	return if fFlagCoreUiMigrateUIBloxToFoundation then roactModule.createElement(FoundationStyleAdapter, { tokenMapper = p1, renderContent = p2 }) else withStyle(function(p3) --[[ line: 29 ]]
		-- upvalues: p2 (ref)
		return p2(p3)
	end)
end
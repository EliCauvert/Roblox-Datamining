local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local fFlagAvatarSwitcherUiFixes = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes

return function(_)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), fFlagAvatarSwitcherUiFixes (ref)
-- FATAL: Failed to generate AST for `MessageCard` function:
runtime : [KeyError] :11990: 3
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end
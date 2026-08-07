local parent = script.Parent.Parent
local magicMockModule = require(parent.MagicMock)
local spyModule = require(parent.Spy)
local getCallsModule = require(parent.getCalls)

return function(_, _) --[[ line: 6 ]]
	-- upvalues: magicMockModule (ref), spyModule (ref), getCallsModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 4
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end
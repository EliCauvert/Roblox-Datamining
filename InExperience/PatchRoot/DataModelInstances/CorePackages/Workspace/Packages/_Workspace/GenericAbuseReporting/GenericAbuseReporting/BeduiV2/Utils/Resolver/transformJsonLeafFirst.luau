local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Types)

local function transformJsonLeafFirst(_, _)
	-- upvalues: transformJsonLeafFirst (ref)
-- FATAL: Failed to generate AST for `transformJsonLeafFirst` function:
runtime : [AssertionError] :11990: true edge null
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1929 function normalize_cfg
	runtime : [lunaux]:1083 function restructure_bool_condition
end

return transformJsonLeafFirst
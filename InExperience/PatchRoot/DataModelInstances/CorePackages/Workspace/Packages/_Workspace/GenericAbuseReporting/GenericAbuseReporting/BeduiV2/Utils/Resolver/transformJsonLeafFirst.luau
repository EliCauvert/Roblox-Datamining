local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local _ = require(genericAbuseReporting.BeduiV2.Types)
local fFlagAbuseReportDensifyResolvedArraysModule = require(genericAbuseReporting.Flags.FFlagAbuseReportDensifyResolvedArrays)

local function transformJsonLeafFirst(_, _) --[[ line: 13 ]]
	-- upvalues: fFlagAbuseReportDensifyResolvedArraysModule (ref), transformJsonLeafFirst (ref)
-- FATAL: Failed to generate AST for `transformJsonLeafFirst` function:
runtime : [AssertionError] :11990: true edge null
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1929 function normalize_cfg
	runtime : [lunaux]:1083 function restructure_bool_condition
end

return transformJsonLeafFirst
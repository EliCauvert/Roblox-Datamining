local expChat = script:FindFirstAncestor("ExpChat")
local configModule = require(expChat.Config)
local memoizeModule = require(expChat.memoize)
local fFlagEnableInExpChatRewriteModule = require(expChat.Flags.FFlagEnableInExpChatRewrite)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local formatGlobalChatPrefixModule = require(expChat.formatGlobalChatPrefix)

local _ = function(p1)
	return if p1 ~= nil then p1 == "" else true
end

return memoizeModule(function(_, _, _)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), formatGlobalChatPrefixModule (ref), fFlagEnableInExpChatRewriteModule (ref), configModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 2
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end)
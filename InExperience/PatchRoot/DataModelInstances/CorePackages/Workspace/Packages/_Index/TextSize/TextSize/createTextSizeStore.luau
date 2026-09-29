local textService = game:GetService("TextService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("TextSize").Parent
local foundationModule = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

local _ = function(p1)
	local thread = coroutine.create(p1)
	
	return (function(p2, p3, ...)
		return if p3 then if coroutine.status(p2) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread))
end

local function _()
	-- upvalues: textService (ref)
	local thread = coroutine.create(function()
		-- upvalues: textService (copy)
		local font = Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function()
			-- upvalues: textService (copy), font (ref)
			return textService:GetTextSizeOffsetAsync(0, font)
		end)
		
		if ok then
			return status or 0
		end
		warn(status)
		
		return 0
	end)
	
	return (function(p1, p2, ...)
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread)) or 0
end

return function()
	-- upvalues: signalsModule (ref), foundationFontFaceMigration (ref), foundationModule (ref), textService (ref), userGameSettingsService (ref)
-- FATAL: Failed to generate AST for `createTextSizeStore` function:
runtime : [KeyError] :11990: 48
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end
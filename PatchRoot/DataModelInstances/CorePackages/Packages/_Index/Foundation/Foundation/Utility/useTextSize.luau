-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local textService = require(foundation.Utility.Wrappers.Services).TextService

return function(value, p0, p1) --[[ line: 14 | named "useTextSize" ]]
	-- upvalues: reactModule (ref), usePreferencesModule (ref), textService (ref)
	local var3, var4 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: value (ref), var4 (ref), textService (copy), p0 (ref), p1 (ref)
		if value == nil then
			var4(nil)
			
			return
		end
		var4(textService:GetTextSize(value, p0.FontSize, p0.Font, p1 or Vector2.new(1e999, 1e999)))
	end, { value, p0, p1, usePreferencesModule().preferredTextSize })
	
	return var3
end
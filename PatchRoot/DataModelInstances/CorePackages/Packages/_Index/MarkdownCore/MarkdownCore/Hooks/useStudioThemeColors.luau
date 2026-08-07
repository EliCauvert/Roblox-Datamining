-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Hooks").Parent
local reactModule = require(parent.Parent.React)
local themeModule = require(parent.Utils.Highlighter.Theme)
local _ = require(parent.Types)
local isCliModule = require(parent.Utils.isCli)

return function() --[[ line: 8 | named "useStudioThemeColors" ]]
	-- upvalues: reactModule (ref), themeModule (ref), isCliModule (ref)
	local var3, var4 = reactModule.useState(themeModule.defaultColors)
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: isCliModule (copy), themeModule (copy), var4 (ref)
		local function getTokens() --[[ line: 12 ]]
			-- upvalues: isCliModule (copy), themeModule (copy)
			if isCliModule() then
				return themeModule.defaultColors
			end
			local ok, status = pcall(function() --[[ line: 17 ]]
				return settings().Studio.Theme
			end)
			
			return if ok then {
				background = status:GetColor(Enum.StudioStyleGuideColor.ScriptBackground),
				iden = status:GetColor(Enum.StudioStyleGuideColor.ScriptText),
				keyword = status:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword),
				builtin = status:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
				string = status:GetColor(Enum.StudioStyleGuideColor.ScriptString),
				number = status:GetColor(Enum.StudioStyleGuideColor.ScriptNumber),
				comment = status:GetColor(Enum.StudioStyleGuideColor.ScriptComment),
				operator = status:GetColor(Enum.StudioStyleGuideColor.ScriptOperator),
				custom = status:GetColor(Enum.StudioStyleGuideColor.ScriptBool)
			} else {}
		end
		
		var4(getTokens())
		local ok, status = pcall(function() --[[ line: 40 ]]
			-- upvalues: var4 (copy), getTokens (ref)
			return settings().Studio.ThemeChanged:Connect(function() --[[ line: 41 ]]
				-- upvalues: var4 (copy), getTokens (copy)
				var4(getTokens())
			end)
		end)
		
		return function() --[[ line: 46 ]]
			-- upvalues: ok (ref), status (ref)
			if ok and status then
				status:Disconnect()
			end
		end
	end, {})
	
	return var3
end
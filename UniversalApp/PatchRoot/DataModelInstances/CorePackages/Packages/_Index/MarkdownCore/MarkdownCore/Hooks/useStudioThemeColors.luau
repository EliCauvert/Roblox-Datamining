local parent = script:FindFirstAncestor("Hooks").Parent
local reactModule = require(parent.Parent.React)
local themeModule = require(parent.Utils.Highlighter.Theme)
local _ = require(parent.Types)
local isCliModule = require(parent.Utils.isCli)

return function()
	-- upvalues: reactModule (ref), themeModule (ref), isCliModule (ref)
	local var3, var4 = reactModule.useState(themeModule.defaultColors)
	reactModule.useEffect(function()
		-- upvalues: isCliModule (copy), themeModule (copy), var4 (ref)
		local function getTokens()
			-- upvalues: isCliModule (copy), themeModule (copy)
			if isCliModule() then
				return themeModule.defaultColors
			end
			local ok, status = pcall(function()
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
		local ok, status = pcall(function()
			-- upvalues: var4 (copy), getTokens (ref)
			return settings().Studio.ThemeChanged:Connect(function()
				-- upvalues: var4 (copy), getTokens (copy)
				var4(getTokens())
			end)
		end)
		
		return function()
			-- upvalues: ok (ref), status (ref)
			if ok and status then
				status:Disconnect()
			end
		end
	end, {})
	
	return var3
end
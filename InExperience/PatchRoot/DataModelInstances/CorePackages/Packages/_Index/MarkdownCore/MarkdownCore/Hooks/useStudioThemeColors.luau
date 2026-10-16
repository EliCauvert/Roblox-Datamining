local Parent = script:FindFirstAncestor("Hooks").Parent
local ReactModule = require(Parent.Parent.React)
local ThemeModule = require(Parent.Utils.Highlighter.Theme)
local _ = require(Parent.Types)
local IsCliModule = require(Parent.Utils.isCli)

return function() --[[ Line: 8 | Named "useStudioThemeColors" ]]
	-- upvalues: ReactModule (copy), ThemeModule (copy), IsCliModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ThemeModule.defaultColors)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: IsCliModule (upval), ThemeModule (upval), UseStateResult2 (copy)
		local function getTokens() --[[ Line: 12 ]]
			-- upvalues: IsCliModule (upval), ThemeModule (upval)
			if IsCliModule() then
				return ThemeModule.defaultColors
			else
				local Success, Result = pcall(function() --[[ Line: 17 ]]
					return settings().Studio.Theme
				end)
				
				return if Success then {
					background = Result:GetColor(Enum.StudioStyleGuideColor.ScriptBackground),
					iden = Result:GetColor(Enum.StudioStyleGuideColor.ScriptText),
					keyword = Result:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword),
					builtin = Result:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
					string = Result:GetColor(Enum.StudioStyleGuideColor.ScriptString),
					number = Result:GetColor(Enum.StudioStyleGuideColor.ScriptNumber),
					comment = Result:GetColor(Enum.StudioStyleGuideColor.ScriptComment),
					operator = Result:GetColor(Enum.StudioStyleGuideColor.ScriptOperator),
					custom = Result:GetColor(Enum.StudioStyleGuideColor.ScriptBool)
				} else {}
			end
		end
		
		UseStateResult2((getTokens()))
		local Success, Result = pcall(function() --[[ Line: 40 ]]
			-- upvalues: UseStateResult2 (upval), getTokens (copy)
			return settings().Studio.ThemeChanged:Connect(function() --[[ Line: 41 ]]
				-- upvalues: UseStateResult2 (upval), getTokens (upval)
				UseStateResult2((getTokens()))
			end)
		end)
		
		return function() --[[ Line: 46 ]]
			-- upvalues: Success (copy), Result (copy)
			if Success and Result then
				Result:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end
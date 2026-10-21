local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local ReactModule = require(Parent1.React)
local LocalizationModule = require(Parent1.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local FFlagHelpPageCCLModule = require(Parent.Flags.FFlagHelpPageCCL)

local function useTranslator()
	-- upvalues: ReactModule (copy), Players (copy), LocalizationService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: Players (upval), LocalizationService (upval), UseStateResult2 (copy)
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then return end
		local Flag = false
		task.spawn(function()
			-- upvalues: LocalizationService (upval), LocalPlayer (copy), Flag (ref), UseStateResult2 (upval)
			local Success, Result = pcall(function()
				-- upvalues: LocalizationService (upval), LocalPlayer (upval)
				return LocalizationService:GetTranslatorForPlayerAsync(LocalPlayer)
			end)
			
			if Success and not Flag then
				UseStateResult2(Result)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return UseStateResult
end

local function getExperienceLocalizedLabel(Translator, p1)
	local Success, Result = pcall(function()
		-- upvalues: Translator (copy), p1 (copy)
		return Translator:FormatByKey(p1)
	end)
	
	if Success and type(Result) == "string" and Result ~= "" then
		return Result
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: Translator (copy), p1 (copy)
			return Translator:Translate(game, p1)
		end)
		
		return if Success1 and type(Result1) == "string" and Result1 ~= "" then Result1 else nil
	end
end

return function(List, p1)
	-- upvalues: FFlagHelpPageCCLModule (copy), UseLocalizationFunction (copy), ReactModule (copy), LocalizationRoactContext (copy), useTranslator (copy), getExperienceLocalizedLabel (copy)
	if not FFlagHelpPageCCLModule then
		return UseLocalizationFunction(List)
	end
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local GenericAction = UseLocalizationFunction({ genericAction = "InGame.HelpMenu.GenericAction" }).genericAction
	local UseTranslatorResult = useTranslator()
	local P3 = p1 or UseTranslatorResult
	local GenericActions = {}
	
	for i, value in List do
		if value == "" then
			GenericActions[i] = GenericAction
		else
			local Success, Result = pcall(function()
				-- upvalues: UseContextResult (copy), value (copy)
				return UseContextResult:Format(value)
			end)
			
			if Success and type(Result) == "string" and Result ~= "" then
				GenericActions[i] = Result
			else
				local NoP = P3 == nil
				local ExperienceLocalizedLabel = nil
				
				if not NoP then
					ExperienceLocalizedLabel = getExperienceLocalizedLabel(P3, value)
					NoP = ExperienceLocalizedLabel == nil
				end
				if NoP then
					GenericActions[i] = value
				else
					GenericActions[i] = ExperienceLocalizedLabel
				end
			end
		end
	end
	return GenericActions
end
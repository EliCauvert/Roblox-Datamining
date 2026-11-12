local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local RbxDesignFoundationsV1Module = require(Parent1.RbxDesignFoundationsV1)
local ConstantsModule = require(Parent.Constants)
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device

local function _(p1)
	-- upvalues: FoundationModule (copy), Device (copy)
	return function(p2)
		-- upvalues: FoundationModule (upval), p1 (copy), Device (upval)
		return FoundationModule.Utility.getTokens(p1, Device.Desktop, p2)
	end
end

return {
	GetTokenGenerators = function(Text: string)
		-- upvalues: ConstantsModule (copy), RbxDesignFoundationsV1Module (copy)
		local Lowered = Text:lower()
		
		return if Lowered == ConstantsModule.ThemeName.Dark:lower() then RbxDesignFoundationsV1Module.tokens.Common.Builder.Dark elseif Lowered == ConstantsModule.ThemeName.Light:lower() then RbxDesignFoundationsV1Module.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(Text: string)
		-- upvalues: ConstantsModule (copy), ColorMode (copy), FoundationModule (copy), Device (copy)
		local Lowered = Text:lower()
		
		if Lowered == ConstantsModule.ThemeName.Dark:lower() then
			local Dark = ColorMode.Dark
			
			return function(p1)
				-- upvalues: FoundationModule (upval), Dark (copy), Device (upval)
				return FoundationModule.Utility.getTokens(Dark, Device.Desktop, p1)
			end
		elseif Lowered == ConstantsModule.ThemeName.Light:lower() then
			local Light = ColorMode.Light
			
			return function(p1)
				-- upvalues: FoundationModule (upval), Light (copy), Device (upval)
				return FoundationModule.Utility.getTokens(Light, Device.Desktop, p1)
			end
		else
			return nil
		end
	end
}
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent.Parent
local RbxDesignFoundationsV1Module = require(Parent1.RbxDesignFoundationsV1)
local ConstantsModule = require(Parent.Constants)

return {
	GetTokenGenerators = function(Text: string) --[[ Line: 13 ]]
		-- upvalues: ConstantsModule (copy), RbxDesignFoundationsV1Module (copy)
		local Lowered = Text:lower()
		
		return if Lowered == ConstantsModule.ThemeName.Dark:lower() then RbxDesignFoundationsV1Module.tokens.Common.Builder.Dark elseif Lowered == ConstantsModule.ThemeName.Light:lower() then RbxDesignFoundationsV1Module.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(Text: string) --[[ Line: 23 ]]
		-- upvalues: Parent1 (copy), ConstantsModule (copy)
		local RbxDesignFoundationsV4Module = require(Parent1.RbxDesignFoundationsV4)
		local v1 = RbxDesignFoundationsV4Module.themes[RbxDesignFoundationsV4Module.Theme.Default]()
		local Lowered = Text:lower()
		
		return if Lowered == ConstantsModule.ThemeName.Dark:lower() then v1.Dark elseif Lowered == ConstantsModule.ThemeName.Light:lower() then v1.Light else nil
	end
}
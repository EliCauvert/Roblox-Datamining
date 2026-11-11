local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent.Parent
local TModule = require(Parent1.t)
local RbxDesignFoundationsModule = require(Parent1.RbxDesignFoundations)
local ConstantsModule = require(Parent.Constants)

local function getThemePackageIndex(p1)
	-- upvalues: ConstantsModule (copy), RbxDesignFoundationsModule (copy)
	return {
		[ConstantsModule.ThemeName.Light:lower()] = RbxDesignFoundationsModule.tokens[p1].Light,
		[ConstantsModule.ThemeName.Dark:lower()] = RbxDesignFoundationsModule.tokens[p1].Dark
	}
end

return {
	TokenPackageIndexMap = {
		[ConstantsModule.DeviceType.Console] = getThemePackageIndex("Console"),
		[ConstantsModule.DeviceType.Desktop] = getThemePackageIndex("Desktop"),
		[ConstantsModule.DeviceType.Tablet] = getThemePackageIndex("Desktop"),
		[ConstantsModule.DeviceType.Phone] = getThemePackageIndex("Desktop"),
		[ConstantsModule.DeviceType.VR] = getThemePackageIndex("Desktop"),
		[ConstantsModule.DeviceType.Unknown] = getThemePackageIndex("Desktop")
	},
	GetTokenGenerators = function(Text: string)
		-- upvalues: ConstantsModule (copy), RbxDesignFoundationsModule (copy)
		local Lowered = Text:lower()
		
		return if Lowered == ConstantsModule.ThemeName.Dark:lower() then RbxDesignFoundationsModule.tokens.Common.Builder.Dark elseif Lowered == ConstantsModule.ThemeName.Light:lower() then RbxDesignFoundationsModule.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(Text: string)
		-- upvalues: Parent1 (copy), ConstantsModule (copy)
		local Tokens = require(Parent1.RbxDesignFoundationsV2).Tokens
		local Lowered = Text:lower()
		
		return if Lowered == ConstantsModule.ThemeName.Dark:lower() then Tokens.Dark elseif Lowered == ConstantsModule.ThemeName.Light:lower() then Tokens.Light else nil
	end,
	SchemaPackage = {
		Validators = {
			Global = require(RbxDesignFoundationsModule.tokens.Schema.Validators.validateGlobal)(TModule),
			Semantic = require(RbxDesignFoundationsModule.tokens.Schema.Validators.validateSemantic)(TModule),
			Component = require(RbxDesignFoundationsModule.tokens.Schema.Validators.validateComponent)(TModule)
		},
		Types = {
			GlobalType = require(RbxDesignFoundationsModule.tokens.Schema.Types.GlobalType),
			SemanticType = require(RbxDesignFoundationsModule.tokens.Schema.Types.SemanticType),
			ComponentType = require(RbxDesignFoundationsModule.tokens.Schema.Types.ComponentType)
		}
	}
}
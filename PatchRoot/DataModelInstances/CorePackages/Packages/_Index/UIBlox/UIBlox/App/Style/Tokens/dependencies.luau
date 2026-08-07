-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent.Parent
local tModule = require(parent_1.t)
local rbxDesignFoundationsModule = require(parent_1.RbxDesignFoundations)
local constantsModule = require(parent.Constants)

local function getThemePackageIndex(p0) --[[ line: 13 ]]
	-- upvalues: constantsModule (ref), rbxDesignFoundationsModule (ref)
	return {
		[constantsModule.ThemeName.Light:lower()] = rbxDesignFoundationsModule.tokens[p0].Light,
		[constantsModule.ThemeName.Dark:lower()] = rbxDesignFoundationsModule.tokens[p0].Dark
	}
end

return {
	TokenPackageIndexMap = {
		[constantsModule.DeviceType.Console] = getThemePackageIndex("Console"),
		[constantsModule.DeviceType.Desktop] = getThemePackageIndex("Desktop"),
		[constantsModule.DeviceType.Tablet] = getThemePackageIndex("Desktop"),
		[constantsModule.DeviceType.Phone] = getThemePackageIndex("Desktop"),
		[constantsModule.DeviceType.VR] = getThemePackageIndex("Desktop"),
		[constantsModule.DeviceType.Unknown] = getThemePackageIndex("Desktop")
	},
	GetTokenGenerators = function(p1) --[[ line: 30 ]]
		-- upvalues: constantsModule (ref), rbxDesignFoundationsModule (ref)
		local var4 = p1:lower()
		
		return if var4 == constantsModule.ThemeName.Dark:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Dark elseif var4 == constantsModule.ThemeName.Light:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(p2) --[[ line: 40 ]]
		-- upvalues: parent_1 (ref), constantsModule (ref)
		local tokens = require(parent_1.RbxDesignFoundationsV2).Tokens
		local var5 = p2:lower()
		
		return if var5 == constantsModule.ThemeName.Dark:lower() then tokens.Dark elseif var5 == constantsModule.ThemeName.Light:lower() then tokens.Light else nil
	end,
	SchemaPackage = {
		Validators = {
			Global = require(rbxDesignFoundationsModule.tokens.Schema.Validators.validateGlobal)(tModule),
			Semantic = require(rbxDesignFoundationsModule.tokens.Schema.Validators.validateSemantic)(tModule),
			Component = require(rbxDesignFoundationsModule.tokens.Schema.Validators.validateComponent)(tModule)
		},
		Types = {
			GlobalType = require(rbxDesignFoundationsModule.tokens.Schema.Types.GlobalType),
			SemanticType = require(rbxDesignFoundationsModule.tokens.Schema.Types.SemanticType),
			ComponentType = require(rbxDesignFoundationsModule.tokens.Schema.Types.ComponentType)
		}
	}
}
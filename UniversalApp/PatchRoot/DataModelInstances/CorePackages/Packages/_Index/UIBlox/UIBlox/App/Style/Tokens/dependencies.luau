local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent.Parent
local rbxDesignFoundationsModule = require(parent_1.RbxDesignFoundations)
local constantsModule = require(parent.Constants)

return {
	GetTokenGenerators = function(p1)
		-- upvalues: constantsModule (ref), rbxDesignFoundationsModule (ref)
		local var1 = p1:lower()
		
		return if var1 == constantsModule.ThemeName.Dark:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Dark elseif var1 == constantsModule.ThemeName.Light:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(p1)
		-- upvalues: parent_1 (ref), constantsModule (ref)
		local rbxDesignFoundationsV4Module = require(parent_1.RbxDesignFoundationsV4)
		local var1 = rbxDesignFoundationsV4Module.themes[rbxDesignFoundationsV4Module.Theme.Default]()
		local var2 = p1:lower()
		
		return if var2 == constantsModule.ThemeName.Dark:lower() then var1.Dark elseif var2 == constantsModule.ThemeName.Light:lower() then var1.Light else nil
	end
}
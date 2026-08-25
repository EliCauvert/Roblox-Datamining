local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent.Parent
local rbxDesignFoundationsModule = require(parent_1.RbxDesignFoundations)
local constantsModule = require(parent.Constants)

return {
	GetTokenGenerators = function(p0)
		-- upvalues: constantsModule (ref), rbxDesignFoundationsModule (ref)
		local var2 = p0:lower()
		
		return if var2 == constantsModule.ThemeName.Dark:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Dark elseif var2 == constantsModule.ThemeName.Light:lower() then rbxDesignFoundationsModule.tokens.Common.Builder.Light else nil
	end,
	GetFoundationTokens = function(p1)
		-- upvalues: parent_1 (ref), constantsModule (ref)
		local rbxDesignFoundationsV4Module = require(parent_1.RbxDesignFoundationsV4)
		local var4 = rbxDesignFoundationsV4Module.themes[rbxDesignFoundationsV4Module.Theme.Default]()
		local var5 = p1:lower()
		
		return if var5 == constantsModule.ThemeName.Dark:lower() then var4.Dark elseif var5 == constantsModule.ThemeName.Light:lower() then var4.Light else nil
	end
}
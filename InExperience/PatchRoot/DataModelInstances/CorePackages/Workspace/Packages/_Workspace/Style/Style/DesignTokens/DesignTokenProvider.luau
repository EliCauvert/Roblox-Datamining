local parent = script:FindFirstAncestor("Style").Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(parent.RobloxAppEnums)
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local context = require(parent.UIBlox).Style.Context
local designTokenContextModule = require(script.Parent.DesignTokenContext)

return function(value) --[[ line: 27 | named "DesignTokenProvider" ]]
	-- upvalues: reactModule (ref), context (ref), useUiModeInfo (ref), cryoModule (ref), argCheckModule (ref), designTokenContextModule (ref)
	local var4 = reactModule.useContext(context)
	local uiModeInfo = value.uiModeInfo or useUiModeInfo()
	local tokenMappers = value.tokenMappers
	local var6 = cryoModule.Dictionary.keys(tokenMappers)
	local tokens = var4.style.Tokens
	argCheckModule.assert(tokens, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.")
	
	if not tokens.LuaApps then
		tokens = cryoModule.Dictionary.join(tokens, { LuaApps = {} })
	end
	return reactModule.createElement(designTokenContextModule.Provider, {
		value = cryoModule.List.foldLeft(var6, function(p0, p1) --[[ line: 42 ]]
			-- upvalues: tokenMappers (ref), uiModeInfo (write), tokens (write), cryoModule (copy)
			local cloned = table.clone(p0.LuaApps)
			cloned[p1] = tokenMappers[p1](uiModeInfo, tokens)
			
			return cryoModule.Dictionary.join(p0, { LuaApps = cloned })
		end, tokens)
	}, value.children)
end
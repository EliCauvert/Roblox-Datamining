local Parent = script:FindFirstAncestor("Style").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(Parent.RobloxAppEnums)
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local Context = require(Parent.UIBlox).Style.Context
local DesignTokenContextModule = require(script.Parent.DesignTokenContext)

return function(p1) --[[ Line: 27 | Named "DesignTokenProvider" ]]
	-- upvalues: ReactModule (copy), Context (copy), UseUiModeInfoFunction (copy), CryoModule (copy), ArgCheckModule (copy), DesignTokenContextModule (copy)
	local UseContextResult = ReactModule.useContext(Context)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UiModeInfo = p1.uiModeInfo or UseUiModeInfoResult
	local TokenMappers = p1.tokenMappers
	local KeysResult = CryoModule.Dictionary.keys(TokenMappers)
	local Tokens = UseContextResult.style.Tokens
	ArgCheckModule.assert(Tokens, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.")
	
	if not Tokens.LuaApps then
		Tokens = CryoModule.Dictionary.join(Tokens, { LuaApps = {} })
	end
	Tokens = CryoModule.List.foldLeft(KeysResult, function(p2, Key) --[[ Line: 42 ]]
		-- upvalues: TokenMappers (copy), UiModeInfo (ref), Tokens (ref), CryoModule (upval)
		local Copy = table.clone(p2.LuaApps)
		Copy[Key] = TokenMappers[Key](UiModeInfo, Tokens)
		
		return CryoModule.Dictionary.join(p2, { LuaApps = Copy })
	end, Tokens)
	
	return ReactModule.createElement(DesignTokenContextModule.Provider, { value = Tokens }, p1.children)
end
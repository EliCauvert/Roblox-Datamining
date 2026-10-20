local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local CursorContextModule = require(script.Parent.CursorContext)
local KeyUtilitiesModule = require(script.Parent.KeyUtilities)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext

return function(p1)
	-- upvalues: UseTokensModule (copy), UsePresentationContextFunction (copy), ColorNamespaceModule (copy), ReactModule (copy), CursorContextModule (copy), KeyUtilitiesModule (copy), DashModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local ColorNamespace = if UsePresentationContextResult.colorNamespace then UsePresentationContextResult.colorNamespace else ColorNamespaceModule.Color
	local UseContextResult = ReactModule.useContext(CursorContextModule)
	local RefCache = UseContextResult.refCache
	local SetMountedCursorsFunction = UseContextResult.setMountedCursors
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), KeyUtilitiesModule (upval), UseTokensModuleResult (copy), ColorNamespace (copy)
		return if typeof(p1) == "table" then KeyUtilitiesModule.encodeKey(UseTokensModuleResult, p1.radius, p1.offset, p1.borderWidth, ColorNamespace) elseif p1 == nil then KeyUtilitiesModule.encodeKey(UseTokensModuleResult, nil, nil, nil, ColorNamespace) else KeyUtilitiesModule.encodeCursorTypeKey(p1, ColorNamespace)
	end, { p1, UseTokensModuleResult, ColorNamespace })
	ReactModule.useEffect(function()
		-- upvalues: SetMountedCursorsFunction (copy), UseMemoResult (copy), DashModule (upval)
		SetMountedCursorsFunction(function(p2)
			-- upvalues: UseMemoResult (upval), DashModule (upval)
			return if p2[UseMemoResult] == nil then DashModule.join(p2, { [UseMemoResult] = true }) else p2
		end)
	end, { UseMemoResult })
	
	return RefCache[UseMemoResult]
end
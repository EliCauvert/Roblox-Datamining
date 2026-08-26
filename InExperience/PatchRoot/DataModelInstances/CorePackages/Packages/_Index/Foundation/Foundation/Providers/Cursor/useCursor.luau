local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local cursorContextModule = require(script.Parent.CursorContext)
local keyUtilitiesModule = require(script.Parent.KeyUtilities)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = presentationContextModule.usePresentationContext

return function(p1)
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), colorNamespaceModule (ref), reactModule (ref), cursorContextModule (ref), keyUtilitiesModule (ref), dashModule (ref)
	local var1 = useTokensModule()
	local var2 = usePresentationContext()
	local var3 = if var2.colorNamespace then var2.colorNamespace else colorNamespaceModule.Color
	local var4 = reactModule.useContext(cursorContextModule)
	local refCache = var4.refCache
	local setMountedCursors = var4.setMountedCursors
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), keyUtilitiesModule (copy), var1 (ref), var3 (ref)
		return if typeof(p1) == "table" then keyUtilitiesModule.encodeKey(var1, p1.radius, p1.offset, p1.borderWidth, var3) elseif p1 == nil then keyUtilitiesModule.encodeKey(var1, nil, nil, nil, var3) else keyUtilitiesModule.encodeCursorTypeKey(p1, var3)
	end, { p1, var1, var3 })
	reactModule.useEffect(function()
		-- upvalues: setMountedCursors (ref), var5 (ref), dashModule (copy)
		setMountedCursors(function(p2)
			-- upvalues: var5 (copy), dashModule (copy)
			return if p2[var5] == nil then dashModule.join(p2, { [var5] = true }) else p2
		end)
	end, { var5 })
	
	return refCache[var5]
end
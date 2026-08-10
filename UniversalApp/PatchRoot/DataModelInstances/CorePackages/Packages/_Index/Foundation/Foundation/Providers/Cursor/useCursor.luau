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

return function(p0) --[[ line: 17 | named "useCursor" ]]
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), colorNamespaceModule (ref), reactModule (ref), cursorContextModule (ref), keyUtilitiesModule (ref), dashModule (ref)
	local var8 = useTokensModule()
	local var9 = usePresentationContext()
	local var10 = if var9.colorNamespace then var9.colorNamespace else colorNamespaceModule.Color
	local var11 = reactModule.useContext(cursorContextModule)
	local refCache = var11.refCache
	local setMountedCursors = var11.setMountedCursors
	local var12 = reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), keyUtilitiesModule (copy), var8 (ref), var10 (ref)
		return if typeof(p0) == "table" then keyUtilitiesModule.encodeKey(var8, p0.radius, p0.offset, p0.borderWidth, var10) elseif p0 == nil then keyUtilitiesModule.encodeKey(var8, nil, nil, nil, var10) else keyUtilitiesModule.encodeCursorTypeKey(p0, var10)
	end, { p0, var8, var10 })
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: setMountedCursors (ref), var12 (ref), dashModule (copy)
		setMountedCursors(function(p1) --[[ line: 44 ]]
			-- upvalues: var12 (copy), dashModule (copy)
			return if p1[var12] == nil then dashModule.join(p1, { [var12] = true }) else p1
		end)
	end, { var12 })
	
	return refCache[var12]
end
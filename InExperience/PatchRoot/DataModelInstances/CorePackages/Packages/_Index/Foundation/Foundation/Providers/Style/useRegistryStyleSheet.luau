local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Device)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.Theme)
local _ = require(foundation.Providers.Style.Tokens)
local styleSheetRegistryModule = require(foundation.StyleSheet.StyleSheetRegistry)

return function(p0, p1, p2, p3) --[[ line: 14 | named "useRegistryStyleSheet" ]]
	-- upvalues: reactModule (ref), styleSheetRegistryModule (ref)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: styleSheetRegistryModule (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref)
		return styleSheetRegistryModule.getStyleSheet(p0, p1, p2, p3)
	end, { p0, p1, p2, p3 })
	local var5 = reactModule.useRef(var4)
	var5.current = var4
	local var6 = reactModule.useCallback(function(p4) --[[ line: 27 ]]
		-- upvalues: var3 (ref), styleSheetRegistryModule (copy), var5 (ref)
		for i, v in p4 do
			var3.current[v] = true
		end
		styleSheetRegistryModule.addStyleTags(var5.current, p4)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 34 ]]
		-- upvalues: var3 (ref), styleSheetRegistryModule (copy), var4 (ref)
		local t = {}
		
		for i in var3.current do
			table.insert(t, i)
		end
		styleSheetRegistryModule.addStyleTags(var4, t)
	end, { var4 })
	
	return var4, var6
end
local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(parent.React)
local _ = require(foundation.Enums.ThemeName)
local _ = require(foundation.Providers.Style.Tokens)
local styleSheetRegistryModule = require(foundation.StyleSheet.StyleSheetRegistry)

return function(p0, p1, p2, p3, p4) --[[ line: 17 | named "useRegistryStyleSheet" ]]
	-- upvalues: reactModule (ref), styleSheetRegistryModule (ref), flagsModule (ref)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: styleSheetRegistryModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p0 (ref)
		return styleSheetRegistryModule.resolveStyleSheet(p1, p2, p3, p4, p0)
	end, {
		p0,
		p1,
		p2,
		p3,
		p4
	})
	local var6 = reactModule.useRef(var5)
	var6.current = var5
	local var7 = reactModule.useCallback(function(p5) --[[ line: 33 ]]
		-- upvalues: var4 (ref), styleSheetRegistryModule (copy), var6 (ref)
		for i, v in p5 do
			var4.current[v] = true
		end
		styleSheetRegistryModule.addStyleTags(var6.current, p5)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 40 ]]
		-- upvalues: var4 (ref), styleSheetRegistryModule (copy), var5 (ref), flagsModule (copy)
		local t = {}
		
		for i in var4.current do
			table.insert(t, i)
		end
		styleSheetRegistryModule.addStyleTags(var5, t)
		
		if flagsModule.FoundationStyleSheetRefCounting then
			styleSheetRegistryModule.acquireStyleSheet(var5)
			
			return function() --[[ line: 53 ]]
				-- upvalues: styleSheetRegistryModule (copy), var5 (copy)
				styleSheetRegistryModule.releaseStyleSheet(var5)
			end
		end
	end, { var5 })
	
	return var5, var7
end
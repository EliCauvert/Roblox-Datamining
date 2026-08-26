local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(parent.React)
local _ = require(foundation.Enums.ThemeName)
local _ = require(foundation.Providers.Style.Tokens)
local styleSheetRegistryModule = require(foundation.StyleSheet.StyleSheetRegistry)

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), styleSheetRegistryModule (ref), flagsModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useMemo(function()
		-- upvalues: styleSheetRegistryModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p1 (ref)
		return styleSheetRegistryModule.resolveStyleSheet(p2, p3, p4, p5, p1)
	end, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
	local var3 = reactModule.useRef(var2)
	var3.current = var2
	local var4 = reactModule.useCallback(function(p6)
		-- upvalues: var1 (ref), styleSheetRegistryModule (copy), var3 (ref)
		for i, v in p6 do
			var1.current[v] = true
		end
		styleSheetRegistryModule.addStyleTags(var3.current, p6)
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), styleSheetRegistryModule (copy), var2 (ref), flagsModule (copy)
		local t = {}
		
		for i in var1.current do
			table.insert(t, i)
		end
		styleSheetRegistryModule.addStyleTags(var2, t)
		
		if flagsModule.FoundationStyleSheetRefCounting then
			styleSheetRegistryModule.acquireStyleSheet(var2)
			
			return function()
				-- upvalues: styleSheetRegistryModule (copy), var2 (copy)
				styleSheetRegistryModule.releaseStyleSheet(var2)
			end
		end
	end, { var2 })
	
	return var2, var4
end
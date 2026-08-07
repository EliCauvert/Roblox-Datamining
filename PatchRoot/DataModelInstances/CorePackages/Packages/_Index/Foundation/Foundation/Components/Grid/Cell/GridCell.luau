-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getGridSizeTagModule = require(foundation.Utility.getGridSizeTag)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { size = 1, testId = "--foundation-grid--cell" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 26 | named "GridCell" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), dashModule (ref), reactModule (ref), getGridSizeTagModule (ref), viewModule (ref)
	local var7 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, dashModule.assign(dashModule.omit(var7, { "size" }), {
		tag = table.concat({
			reactModule.useMemo(function() --[[ line: 30 ]]
				-- upvalues: getGridSizeTagModule (copy), var7 (ref)
				return getGridSizeTagModule(var7.size)
			end, { var7.size }),
			var7.tag
		}, " "),
		ref = p1
	}), var7.children)
end))
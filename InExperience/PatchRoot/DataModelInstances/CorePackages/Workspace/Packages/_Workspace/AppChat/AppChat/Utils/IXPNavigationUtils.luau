local IXPService = game:GetService("IXPService")
local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local t = {
	ExposureKind = {
		FlagLinked = "FlagLinked",
		BrowserTracker = "BrowserTracker",
		UserLayer = "UserLayer",
		Creator = "Creator"
	}
}
local t_1 = { remove = function() --[[ line: 102 ]] end }
local t_2 = {
	[t.ExposureKind.FlagLinked] = "LogFlagLinkedUserLayerExposure",
	[t.ExposureKind.BrowserTracker] = "LogBrowserTrackerLayerExposure",
	[t.ExposureKind.UserLayer] = "LogUserLayerExposure",
	[t.ExposureKind.Creator] = "LogCreatorLayerExposure"
}
local var6 = IXPService

local function _(p0) --[[ line: 119 | named "normalizeLayers" ]]
	return if type(p0) == "string" then { p0 } else p0
end

local _ = function(p1) --[[ line: 128 | named "isAnyFlagEnabled" ]]
	if p1 == nil then
		return true
	elseif type(p1) == "boolean" then
		return p1
	end
	for i, v in p1 do
		if v then
			return true
		end
	end
	return false
end

local function logExposure(p2, p3) --[[ line: 146 ]]
	-- upvalues: t (ref), t_2 (ref), var6 (write)
	p3 = p3 or t.ExposureKind.FlagLinked
	
	for i, v in p2 do
		local var9 = t_2[p3]
		local var10 = if var9 then var6[var9] else nil
		
		if var10 then
			var10(var6, v)
		end
	end
end

function t.createExposureHandler(p4, p5) --[[ line: 167 ]]
	-- upvalues: logExposure (ref)
	local var11 = if type(p4) == "string" then { p4 } else p4
	local var12 = if p5 then p5.flags else nil
	local var13 = if p5 then p5.kind else nil
	
	return function() --[[ line: 175 ]]
		-- upvalues: var12 (ref), logExposure (copy), var11 (ref), var13 (ref)
		local var15
		local var14 = var12
		
		if var14 == nil then
			var15 = true
		elseif type(var14) == "boolean" then
			var15 = var14
		else
			for i, v in var14 do
				if v then
					var15 = true
				end
			end
			var15 = false
		end
		if var15 then
			logExposure(var11, var13)
		end
	end
end

function t.useExposureOnFocus(p6, p7) --[[ line: 193 ]]
	-- upvalues: useNavigation (ref), reactModule (ref), t (ref), roactNavigationModule (ref)
	local var16 = useNavigation()
	local var17 = if p7 then p7.flags else nil
	local var18 = if p7 then p7.kind else nil
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var16 (ref), var17 (ref), t (copy), p6 (ref), var18 (ref), roactNavigationModule (copy)
		if var16 then
			local var20
			local var19 = var17
			
			if var19 == nil then
				var20 = true
			elseif type(var19) == "boolean" then
				var20 = var19
			else
				for i, v in var19 do
					if v then
						var20 = true
					end
				end
				var20 = false
			end
			if not var20 then
				return nil
			end
			local var21 = t.createExposureHandler(p6, { flags = var17, kind = var18 })
			local var22 = var16.addListener(roactNavigationModule.Events.WillFocus, var21)
			
			if var16.isFocused and var16.isFocused() then
				var21()
			end
			return function() --[[ line: 213 ]]
				-- upvalues: var22 (ref)
				var22.remove()
			end
		end
	end, { var16, p6, var17, var18 })
end

function t.registerExposureOnFocus(p8, p9, p10) --[[ line: 231 ]]
	-- upvalues: t_1 (ref), roactNavigationModule (ref), t (ref)
	if not p8 then
		return t_1
	end
	local var24
	local var23 = if p10 then p10.flags else nil
	
	if var23 == nil then
		var24 = true
	elseif type(var23) == "boolean" then
		var24 = var23
	else
		for i, v in var23 do
			if v then
				var24 = true
			end
		end
		var24 = false
	end
	return if var24 then p8.addListener(roactNavigationModule.Events.WillFocus, t.createExposureHandler(p9, p10)) else t_1
end

function t.setMocksForTesting(value) --[[ line: 251 ]]
	-- upvalues: var6 (write)
	var6 = value or var6
end

function t.restoreDefaultsAfterTesting() --[[ line: 255 ]]
	-- upvalues: var6 (write), IXPService (ref)
	var6 = IXPService
end

return t
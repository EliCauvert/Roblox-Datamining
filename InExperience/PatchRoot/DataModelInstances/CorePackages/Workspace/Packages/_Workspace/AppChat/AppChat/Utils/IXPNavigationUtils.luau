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
local t_1 = { remove = function() end }
local t_2 = {
	[t.ExposureKind.FlagLinked] = "LogFlagLinkedUserLayerExposure",
	[t.ExposureKind.BrowserTracker] = "LogBrowserTrackerLayerExposure",
	[t.ExposureKind.UserLayer] = "LogUserLayerExposure",
	[t.ExposureKind.Creator] = "LogCreatorLayerExposure"
}
local var1 = IXPService

local function _(p1)
	return if type(p1) == "string" then { p1 } else p1
end

local _ = function(p1)
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

local function logExposure(p2, p3)
	-- upvalues: t (ref), t_2 (ref), var1 (write)
	p3 = p3 or t.ExposureKind.FlagLinked
	
	for i, v in p2 do
		local var2 = t_2[p3]
		local var3 = if var2 then var1[var2] else nil
		
		if var3 then
			var3(var1, v)
		end
	end
end

function t.createExposureHandler(p4, p5)
	-- upvalues: logExposure (ref)
	local var4 = if type(p4) == "string" then { p4 } else p4
	local var5 = if p5 then p5.flags else nil
	local var6 = if p5 then p5.kind else nil
	
	return function()
		-- upvalues: var5 (ref), logExposure (copy), var4 (ref), var6 (ref)
		local var7
		local var8 = var5
		
		if var8 == nil then
			var7 = true
		elseif type(var8) == "boolean" then
			var7 = var8
		else
			for i, v in var8 do
				if v then
					var7 = true
				end
			end
			var7 = false
		end
		if var7 then
			logExposure(var4, var6)
		end
	end
end

function t.useExposureOnFocus(p6, p7)
	-- upvalues: useNavigation (ref), reactModule (ref), t (ref), roactNavigationModule (ref)
	local var7 = useNavigation()
	local var8 = if p7 then p7.flags else nil
	local var9 = if p7 then p7.kind else nil
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var8 (ref), t (copy), p6 (ref), var9 (ref), roactNavigationModule (copy)
		if var7 then
			local var10
			local var11 = var8
			
			if var11 == nil then
				var10 = true
			elseif type(var11) == "boolean" then
				var10 = var11
			else
				for i, v in var11 do
					if v then
						var10 = true
					end
				end
				var10 = false
			end
			if not var10 then
				return nil
			end
			local var12 = t.createExposureHandler(p6, { flags = var8, kind = var9 })
			local var13 = var7.addListener(roactNavigationModule.Events.WillFocus, var12)
			
			if var7.isFocused and var7.isFocused() then
				var12()
			end
			return function()
				-- upvalues: var13 (ref)
				var13.remove()
			end
		end
	end, { var7, p6, var8, var9 })
end

function t.registerExposureOnFocus(p8, p9, p10)
	-- upvalues: t_1 (ref), roactNavigationModule (ref), t (ref)
	if not p8 then
		return t_1
	end
	local var10
	local var11 = if p10 then p10.flags else nil
	
	if var11 == nil then
		var10 = true
	elseif type(var11) == "boolean" then
		var10 = var11
	else
		for i, v in var11 do
			if v then
				var10 = true
			end
		end
		var10 = false
	end
	return if var10 then p8.addListener(roactNavigationModule.Events.WillFocus, t.createExposureHandler(p9, p10)) else t_1
end

function t.setMocksForTesting(value)
	-- upvalues: var1 (write)
	var1 = value or var1
end

function t.restoreDefaultsAfterTesting()
	-- upvalues: var1 (write), IXPService (ref)
	var1 = IXPService
end

return t
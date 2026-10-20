local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local IXPNavigationUtils = {
	ExposureKind = {
		FlagLinked = "FlagLinked",
		BrowserTracker = "BrowserTracker",
		UserLayer = "UserLayer",
		Creator = "Creator"
	}
}
local config = { remove = function() end }
local config1 = {
	[IXPNavigationUtils.ExposureKind.FlagLinked] = "LogFlagLinkedUserLayerExposure",
	[IXPNavigationUtils.ExposureKind.BrowserTracker] = "LogBrowserTrackerLayerExposure",
	[IXPNavigationUtils.ExposureKind.UserLayer] = "LogUserLayerExposure",
	[IXPNavigationUtils.ExposureKind.Creator] = "LogCreatorLayerExposure"
}
local IXPService1 = IXPService

local function _(p1)
	return if type(p1) == "string" then { p1 } else p1
end

local _ = function(List)
	if List == nil then
		return true
	end
	if type(List) == "boolean" then
		return List
	end
	for _, value in List do
		if value then
			return true
		end
	end
	return false
end

local function logExposure(List, Kind)
	-- upvalues: IXPNavigationUtils (copy), config1 (copy), IXPService1 (ref)
	local Kind1 = Kind or IXPNavigationUtils.ExposureKind.FlagLinked
	for _, value in List do
		local Entry = config1[Kind1]
		local IXPServiceEntry: (any, any) -> () = if Entry then IXPService1[Entry] else nil
		
		if IXPServiceEntry then
			IXPServiceEntry(IXPService1, value)
		end
	end
end

function IXPNavigationUtils.createExposureHandler(p1, p2)
	-- upvalues: logExposure (copy)
	local List = if type(p1) == "string" then { p1 } else p1
	local Flags = if p2 then p2.flags else nil
	local Kind = if p2 then p2.kind else nil
	
	return function()
		-- upvalues: Flags (copy), logExposure (upval), List (copy), Kind (copy)
		local Flag = nil
		if Flags == nil then
			Flag = true
		elseif type(Flags) == "boolean" then
			Flag = Flags
		else
			Flag = false
			
			for _, flag in Flags do
				if flag then
					Flag = true
					break
				end
			end
		end
		if Flag then
			logExposure(List, Kind)
		end
	end
end

function IXPNavigationUtils.useExposureOnFocus(p3, p4)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), IXPNavigationUtils (copy), RoactNavigationModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Flags = if p4 then p4.flags else nil
	local Kind = if p4 then p4.kind else nil
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationResult (copy), Flags (copy), IXPNavigationUtils (upval), p3 (copy), Kind (copy), RoactNavigationModule (upval)
		if UseNavigationResult then
			local Flag = nil
			if Flags == nil then
				Flag = true
			elseif type(Flags) == "boolean" then
				Flag = Flags
			else
				Flag = false
				
				for _, flag in Flags do
					if flag then
						Flag = true
						break
					end
				end
			end
			if Flag then
				local Exposure: () -> () = IXPNavigationUtils.createExposureHandler(p3, { flags = Flags, kind = Kind })
				local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, Exposure)
				
				if UseNavigationResult.isFocused and UseNavigationResult.isFocused() then
					Exposure()
				end
				return function()
					-- upvalues: AddListenerResult (copy)
					AddListenerResult.remove()
				end
			end
		end
		return nil
	end, { UseNavigationResult, p3, Flags, Kind })
end

function IXPNavigationUtils.registerExposureOnFocus(p5, p6, p7)
	-- upvalues: config (copy), RoactNavigationModule (copy), IXPNavigationUtils (copy)
	if not p5 then
		return config
	end
	local Flags = if p7 then p7.flags else nil
	local Flag = nil
	
	if Flags == nil then
		Flag = true
	elseif type(Flags) == "boolean" then
		Flag = Flags
	else
		Flag = false
		
		for _, flag in Flags do
			if flag then
				Flag = true
				break
			end
		end
	end
	return if Flag then p5.addListener(RoactNavigationModule.Events.WillFocus, IXPNavigationUtils.createExposureHandler(p6, p7)) else config
end

function IXPNavigationUtils.setMocksForTesting(p8)
	-- upvalues: IXPService1 (ref)
	IXPService1 = p8 or IXPService1
end

function IXPNavigationUtils.restoreDefaultsAfterTesting()
	-- upvalues: IXPService1 (ref), IXPService (copy)
	IXPService1 = IXPService
end

return IXPNavigationUtils
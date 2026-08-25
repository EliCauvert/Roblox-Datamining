local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local coreGuiService = game:GetService("CoreGui")
local dashModule = require(parent.Dash)
local unifiedEventLogConstantsModule = require(script.Parent.Parent.UnifiedEventLogConstants)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local t = {
	getUnifiedLoggingFieldName = function(p0)
		-- upvalues: unifiedEventLogConstantsModule (ref)
		return p0:sub(string.len(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX) + 1, string.len(p0))
	end,
	isUnifiedLoggingAttribute = function(p1)
		-- upvalues: dashModule (ref), unifiedEventLogConstantsModule (ref)
		return dashModule.startsWith(p1, unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX)
	end,
	formatLookTypeAttribute = function(p2)
		return string.upper("LOOK_TYPE_" .. p2)
	end
}

local function getParentScrollingFrames(p3, p4)
	-- upvalues: getParentScrollingFrames (ref)
	if not p4 then
		p4 = {}
	end
	local scrollingFrame = p3:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	if scrollingFrame then
		table.insert(p4, scrollingFrame)
		
		return getParentScrollingFrames(scrollingFrame, p4)
	end
	return p4
end

if fFlagAXMISEnableMultiShoppingUnifiedEvents then
	function t.getFieldsToSendFromInstanceAttributes(a)
		-- upvalues: t (ref)
		local t_1 = {}
		
		if a then
			for i, v in a do
				if t.isUnifiedLoggingAttribute(i) then
					t_1[t.getUnifiedLoggingFieldName(i)] = v
				end
			end
		end
		return t_1
	end
end
function t.getElementSizeAndPosition(p5)
	-- upvalues: getParentScrollingFrames (ref)
	local var8
	local x = p5.AbsolutePosition.X
	local y = p5.AbsolutePosition.Y
	local _ = nil
	local _ = {}
	local scrollingFrame = p5:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	if scrollingFrame then
		table.insert(u156, scrollingFrame)
		var8 = getParentScrollingFrames(scrollingFrame, u156)
	else
		var8 = u156
	end
	if var8 then
		for i, v in var8 do
			x += v.CanvasPosition.X
			y += v.CanvasPosition.Y
		end
	end
	return {
		elementSizeWidth = math.round(p5.AbsoluteSize.X),
		elementSizeHeight = math.round(p5.AbsoluteSize.Y),
		elementCoordinatesX = math.round(p5.AbsolutePosition.X),
		elementCoordinatesY = math.round(p5.AbsolutePosition.Y),
		elementRelativePositionX = math.round(x),
		elementRelativePositionY = math.round(y)
	}
end

function t.getScreenSize(p6)
	-- upvalues: coreGuiService (ref)
	local var12
	local var9 = nil
	local screenGui = p6:FindFirstAncestorOfClass("ScreenGui")
	
	if screenGui and screenGui:IsA("ScreenGui") then
		var9 = screenGui
	else
		local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
		var12 = if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		
		if var12 and var12:IsA("SurfaceGui") then
			var9 = var12
		else
			local tenFootUiSurfaceGuiFolder = coreGuiService:FindFirstChild("TenFootUiSurfaceGuiFolder")
			local var14 = if tenFootUiSurfaceGuiFolder then tenFootUiSurfaceGuiFolder:FindFirstChild("RootViewSurface_SurfaceGui") else nil
			
			if var14 and var14:IsA("SurfaceGui") then
				var9 = var14
			end
		end
	end
	local t = {}
	var12 = if var9 and var9.AbsoluteSize then math.round(var9.AbsoluteSize.X) else nil
	t.screenSizeWidth = var12
	var12 = if var9 and var9.AbsoluteSize then math.round(var9.AbsoluteSize.Y) else nil
	t.screenSizeHeight = var12
	
	return t
end

return t
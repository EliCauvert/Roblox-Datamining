local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local coreGuiService = game:GetService("CoreGui")
local dashModule = require(parent.Dash)
local unifiedEventLogConstantsModule = require(script.Parent.Parent.UnifiedEventLogConstants)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local t = {
	getUnifiedLoggingFieldName = function(p1)
		-- upvalues: unifiedEventLogConstantsModule (ref)
		return p1:sub(string.len(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX) + 1, string.len(p1))
	end,
	isUnifiedLoggingAttribute = function(p1)
		-- upvalues: dashModule (ref), unifiedEventLogConstantsModule (ref)
		return dashModule.startsWith(p1, unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX)
	end,
	formatLookTypeAttribute = function(p1)
		return string.upper("LOOK_TYPE_" .. p2)
	end
}

local function getParentScrollingFrames(p1, p2)
	-- upvalues: getParentScrollingFrames (ref)
	if not p2 then
		p2 = {}
	end
	local scrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	if scrollingFrame then
		table.insert(p2, scrollingFrame)
		
		return getParentScrollingFrames(scrollingFrame, p2)
	end
	return p2
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
function t.getElementSizeAndPosition(p1)
	-- upvalues: getParentScrollingFrames (ref)
	local var1
	local x = p1.AbsolutePosition.X
	local y = p1.AbsolutePosition.Y
	local _ = nil
	local _ = {}
	local scrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	if scrollingFrame then
		table.insert(u156, scrollingFrame)
		var1 = getParentScrollingFrames(scrollingFrame, u156)
	else
		var1 = u156
	end
	if var1 then
		for i, v in var1 do
			x += v.CanvasPosition.X
			y += v.CanvasPosition.Y
		end
	end
	return {
		elementSizeWidth = math.round(p1.AbsoluteSize.X),
		elementSizeHeight = math.round(p1.AbsoluteSize.Y),
		elementCoordinatesX = math.round(p1.AbsolutePosition.X),
		elementCoordinatesY = math.round(p1.AbsolutePosition.Y),
		elementRelativePositionX = math.round(x),
		elementRelativePositionY = math.round(y)
	}
end

function t.getScreenSize(p2)
	-- upvalues: coreGuiService (ref)
	local var2
	local var3 = nil
	local screenGui = p2:FindFirstAncestorOfClass("ScreenGui")
	
	if screenGui and screenGui:IsA("ScreenGui") then
		var3 = screenGui
	else
		local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
		var2 = if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		
		if var2 and var2:IsA("SurfaceGui") then
			var3 = var2
		else
			local tenFootUiSurfaceGuiFolder = coreGuiService:FindFirstChild("TenFootUiSurfaceGuiFolder")
			local var4 = if tenFootUiSurfaceGuiFolder then tenFootUiSurfaceGuiFolder:FindFirstChild("RootViewSurface_SurfaceGui") else nil
			
			if var4 and var4:IsA("SurfaceGui") then
				var3 = var4
			end
		end
	end
	local t = {}
	var2 = if var3 and var3.AbsoluteSize then math.round(var3.AbsoluteSize.X) else nil
	t.screenSizeWidth = var2
	var2 = if var3 and var3.AbsoluteSize then math.round(var3.AbsoluteSize.Y) else nil
	t.screenSizeHeight = var2
	
	return t
end

return t
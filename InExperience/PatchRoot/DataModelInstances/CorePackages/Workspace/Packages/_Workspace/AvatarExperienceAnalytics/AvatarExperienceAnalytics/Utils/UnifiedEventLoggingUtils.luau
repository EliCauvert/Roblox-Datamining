local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local CoreGui = game:GetService("CoreGui")
local DashModule = require(Parent.Dash)
local UnifiedEventLogConstantsModule = require(script.Parent.Parent.UnifiedEventLogConstants)
local FFlagCleanupTenFootUiPaddingAndAnalytics = require(Parent.SharedFlags).FFlagCleanupTenFootUiPaddingAndAnalytics

local function getParentScrollingFrames(ScrollingFrame, List) --[[ Line: 15 ]]
	-- upvalues: getParentScrollingFrames (copy)
	if not List then
		List = {}
	end
	local ScrollingFrame1 = ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	if ScrollingFrame1 then
		table.insert(List, ScrollingFrame1)
		
		return getParentScrollingFrames(ScrollingFrame1, List)
	else
		return List
	end
end

local UnifiedEventLoggingUtils = {
	getUnifiedLoggingFieldName = function(Text: string) --[[ Line: 29 ]]
		-- upvalues: UnifiedEventLogConstantsModule (copy)
		return Text.sub(Text, string.len(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX) + 1, (string.len(Text)))
	end,
	isUnifiedLoggingAttribute = function(p1) --[[ Line: 34 ]]
		-- upvalues: DashModule (copy), UnifiedEventLogConstantsModule (copy)
		return DashModule.startsWith(p1, UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX)
	end,
	formatLookTypeAttribute = function(Text): string --[[ Line: 38 ]]
		return string.upper("LOOK_TYPE_" .. Text)
	end
}

if require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents then
	function UnifiedEventLoggingUtils.getFieldsToSendFromInstanceAttributes(List) --[[ Line: 43 ]]
		-- upvalues: UnifiedEventLoggingUtils (copy)
		local t = {}
		
		if List then
			for i, value in List do
				if UnifiedEventLoggingUtils.isUnifiedLoggingAttribute(i) then
					t[UnifiedEventLoggingUtils.getUnifiedLoggingFieldName(i)] = value
				end
			end
		end
		return t
	end
end
function UnifiedEventLoggingUtils.getElementSizeAndPosition(Frame: Frame) --[[ Line: 58 ]]
	-- upvalues: getParentScrollingFrames (copy)
	local X = Frame.AbsolutePosition.X
	local Y = Frame.AbsolutePosition.Y
	local List = {}
	local ScrollingFrame = Frame:FindFirstAncestorWhichIsA("ScrollingFrame")
	local ScrollFrames = nil
	
	if ScrollingFrame then
		table.insert(List, ScrollingFrame)
		ScrollFrames = getParentScrollingFrames(ScrollingFrame, List)
	else
		ScrollFrames = List
	end
	if ScrollFrames then
		for _, scrollFrame in ScrollFrames do
			X += scrollFrame.CanvasPosition.X
			Y += scrollFrame.CanvasPosition.Y
		end
	end
	return {
		elementSizeWidth = math.round(Frame.AbsoluteSize.X),
		elementSizeHeight = math.round(Frame.AbsoluteSize.Y),
		elementCoordinatesX = math.round(Frame.AbsolutePosition.X),
		elementCoordinatesY = math.round(Frame.AbsolutePosition.Y),
		elementRelativePositionX = math.round(X),
		elementRelativePositionY = math.round(Y)
	}
end

function UnifiedEventLoggingUtils.getScreenSize(p1) --[[ Line: 79 ]]
	-- upvalues: CoreGui (copy), FFlagCleanupTenFootUiPaddingAndAnalytics (copy)
	local Frame = nil
	local ScreenGui = p1:FindFirstAncestorOfClass("ScreenGui")
	
	if ScreenGui and ScreenGui:IsA("ScreenGui") then
		Frame = ScreenGui
	else
		local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
		local MainAppScreenSurfaceGui = if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		
		if MainAppScreenSurfaceGui and MainAppScreenSurfaceGui:IsA("SurfaceGui") then
			Frame = MainAppScreenSurfaceGui
		elseif not FFlagCleanupTenFootUiPaddingAndAnalytics then
			local TenFootUiSurfaceGuiFolder = CoreGui:FindFirstChild("TenFootUiSurfaceGuiFolder")
			local RootViewSurfaceSurfaceGui = if TenFootUiSurfaceGuiFolder then TenFootUiSurfaceGuiFolder:FindFirstChild("RootViewSurface_SurfaceGui") else nil
			
			if RootViewSurfaceSurfaceGui and RootViewSurfaceSurfaceGui:IsA("SurfaceGui") then
				Frame = RootViewSurfaceSurfaceGui
			end
		end
	end
	return {
		screenSizeWidth = if Frame and Frame.AbsoluteSize then math.round(Frame.AbsoluteSize.X) else nil,
		screenSizeHeight = if Frame and Frame.AbsoluteSize then math.round(Frame.AbsoluteSize.Y) else nil
	}
end

return UnifiedEventLoggingUtils
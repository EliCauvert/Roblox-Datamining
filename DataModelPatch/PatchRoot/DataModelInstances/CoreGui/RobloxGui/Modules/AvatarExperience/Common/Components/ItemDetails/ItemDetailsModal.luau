local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CenteredModalViewModule = require(Modules.AvatarExperience.Common.Components.CenteredModalView)
local UseAXAnimateScrollFrameFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.useAXAnimateScrollFrame
local GetFFlagAXItemDetailsScrollingEnabledCallbackModule = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback)
local AXMIgrateItemDetailsModalToAutofocus = game:DefineFastFlag("AXMIgrateItemDetailsModalToAutofocus", false)

local function v7()
	return nil
end

return function(p1)
	-- upvalues: v7 (copy), AXMIgrateItemDetailsModalToAutofocus (copy), ReactModule (copy), UseAXAnimateScrollFrameFunction (copy), RoactModule (copy), CenteredModalViewModule (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy)
	local RenderContentFunction = p1.renderContent
	local RenderTopBar = p1.renderTopBar or v7
	local RenderBottomBar = p1.renderBottomBar or v7
	local TopBarHeight = p1.topBarHeight or 0
	local BottomBarHeight = p1.bottomBarHeight or 0
	local UseRefResult = nil
	
	if AXMIgrateItemDetailsModalToAutofocus then
		UseRefResult = ReactModule.useRef(nil)
		UseAXAnimateScrollFrameFunction(UseRefResult)
	end
	return RoactModule.createElement(CenteredModalViewModule, {}, {
		TopBar = RenderTopBar(),
		ScrollingContent = RoactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			ref = if AXMIgrateItemDetailsModalToAutofocus then UseRefResult else nil,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.new(1, 0, 1, -(TopBarHeight + BottomBarHeight)),
			Position = UDim2.new(0, 0, 0, TopBarHeight),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p1.scrollingEnabled else nil,
			Selectable = not AXMIgrateItemDetailsModalToAutofocus and nil
		}, { Content = RenderContentFunction() }),
		BottomBar = RenderBottomBar()
	})
end
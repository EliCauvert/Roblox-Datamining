local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useStatusBarHeight = require(parent.RobloxAppHooks).useStatusBarHeight
local fFlagProfileModalViewStatusBarOffsetModule = require(profilePlatform.Flags.FFlagProfileModalViewStatusBarOffset)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local enumsModule = require(profilePlatform.Common.Enums)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagFixCommunityProfileWideCoverLayoutModule = require(profilePlatform.Flags.FFlagFixCommunityProfileWideCoverLayout)
local view = require(parent.Foundation).View

return function(p1)
	-- upvalues: useStyle (ref), fFlagEnableLeftNavOnConsole (ref), useSignalState (ref), displayModule (ref), fFlagProfileModalViewStatusBarOffsetModule (ref), useStatusBarHeight (ref), fFlagFixCommunityProfileWideCoverLayoutModule (ref), useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), inputHandlersModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), view (ref)
	local var1 = useStyle()
	local var2 = if fFlagEnableLeftNavOnConsole then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	local t = {
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.fromScale(1, 0),
		Size = if p1.fillPane then UDim2.fromScale(1, 1) else UDim2.new(0, p1.viewWidth, 1, 0),
		BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var1.Theme.BackgroundDefault.Color
	}
	local var3 = if fFlagProfileModalViewStatusBarOffsetModule then useStatusBarHeight() else nil
	local var4 = if fFlagProfileModalViewStatusBarOffsetModule then var3 else 0
	local var5 = if fFlagProfileModalViewStatusBarOffsetModule then -var3 else 0
	local var6 = if fFlagFixCommunityProfileWideCoverLayoutModule then useProfileWrapperContextModule() else nil
	local var7 = if fFlagFixCommunityProfileWideCoverLayoutModule then useProfileJsonComponentModule(enumsModule.Components.CoverPhoto) else nil
	local var8 = if fFlagFixCommunityProfileWideCoverLayoutModule and var6 ~= nil and (var6.profileType == enumsModule.ProfileTypes.Community and var7 ~= nil) and var7.coverPhotoId == nil then 56 else 0
	
	return reactModule.createElement("ImageButton", {
		Position = if fFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -var2.top) else nil,
		Size = if fFlagEnableLeftNavOnConsole then UDim2.new(1, var2.right, 1, var2.top + var2.bottom) else UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = var1.Theme.Overlay.Transparency,
		BackgroundColor3 = var1.Theme.Overlay.Color,
		Active = true,
		AutoButtonColor = false,
		[reactModule.Event.Activated] = p1.navigateBack
	}, {
		ProfileWindow = reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = t,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = reactModule.useMemo(function()
						-- upvalues: inputHandlersModule (copy), p1 (ref)
						return inputHandlersModule.onRelease(function(p2)
							-- upvalues: p1 (copy)
							p2:cancel()
							p1.navigateBack()
						end)
					end, { p1.navigateBack })
				}
			}
		}, {
			reactModule.useCallback(function(p2)
				-- upvalues: reactModule (copy)
				return reactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Selectable = false,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, { p2 })
			end)({
				ProfileTopBarContainer = reactModule.createElement(view, {
					ZIndex = 100,
					tag = {
						["anchor-top-left"] = fFlagProfileModalViewStatusBarOffsetModule,
						["position-top-left"] = not fFlagProfileModalViewStatusBarOffsetModule
					},
					Position = if fFlagProfileModalViewStatusBarOffsetModule then UDim2.new(0, 0, 0, var3) else nil,
					Size = UDim2.new(1, 0, 0, 56)
				}, { ProfileTopBar = p1.renderTopBar() }),
				PeekViewContainer = reactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.new(1, 1, 1, var5),
					Position = UDim2.new(0, 0, 0, var4),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					TopInset = if fFlagFixCommunityProfileWideCoverLayoutModule and var8 > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var8) }) else nil,
					Content = p1.renderContent()
				})
			})
		})
	})
end
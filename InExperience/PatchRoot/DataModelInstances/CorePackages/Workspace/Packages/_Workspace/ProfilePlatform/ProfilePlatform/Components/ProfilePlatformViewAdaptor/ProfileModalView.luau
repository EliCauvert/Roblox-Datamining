local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseStatusBarHeightFunction = require(Parent.RobloxAppHooks).useStatusBarHeight
local FFlagProfileModalViewStatusBarOffsetModule = require(ProfilePlatform.Flags.FFlagProfileModalViewStatusBarOffset)
local FFlagProfileModalViewBottomSafeAreaModule = require(ProfilePlatform.Flags.FFlagProfileModalViewBottomSafeArea)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagFixCommunityProfileWideCoverLayoutModule = require(ProfilePlatform.Flags.FFlagFixCommunityProfileWideCoverLayout)
local View = require(Parent.Foundation).View

return function(p1) --[[ Line: 37 ]]
	-- upvalues: UseStyleFunction (copy), UseSignalStateFunction (copy), DisplayModule (copy), FFlagProfileModalViewStatusBarOffsetModule (copy), UseStatusBarHeightFunction (copy), FFlagProfileModalViewBottomSafeAreaModule (copy), FFlagFixCommunityProfileWideCoverLayoutModule (copy), UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), InputHandlersModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), View (copy)
	local UseStyleResult = UseStyleFunction()
	local UseSignalStateResult = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	local UseStatusBarHeightResult = if FFlagProfileModalViewStatusBarOffsetModule then UseStatusBarHeightFunction() else nil
	local UseProfileWrapperContextModuleResult = if FFlagFixCommunityProfileWideCoverLayoutModule then UseProfileWrapperContextModule() else nil
	local UseProfileJsonComponentModuleResult = if FFlagFixCommunityProfileWideCoverLayoutModule then UseProfileJsonComponentModule(EnumsModule.Components.CoverPhoto) else nil
	local Offset: number = if FFlagFixCommunityProfileWideCoverLayoutModule and UseProfileWrapperContextModuleResult ~= nil and UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.Community and UseProfileJsonComponentModuleResult ~= nil and UseProfileJsonComponentModuleResult.coverPhotoId == nil then 56 else 0
	
	return ReactModule.createElement("ImageButton", {
		Position = UDim2.fromOffset(0, -UseSignalStateResult.top),
		Size = UDim2.new(1, UseSignalStateResult.right, 1, UseSignalStateResult.top + UseSignalStateResult.bottom),
		BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
		Active = true,
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = p1.navigateBack
	}, {
		ProfileWindow = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = if p1.fillPane then UDim2.fromScale(1, 1) else UDim2.new(0, p1.viewWidth, 1, 0),
				BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
			},
			customEventHandlers = {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = ReactModule.useMemo(function() --[[ Line: 82 ]]
						-- upvalues: InputHandlersModule (upval), p1 (copy)
						return InputHandlersModule.onRelease(function(p2) --[[ Line: 83 ]]
							-- upvalues: p1 (upval)
							p2:cancel()
							p1.navigateBack()
						end)
					end, { p1.navigateBack })
				}
			}
		}, {
			ReactModule.useCallback(function(p2) --[[ Line: 72 ]]
				-- upvalues: ReactModule (upval)
				return ReactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Selectable = false,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, { p2 })
			end)({
				ProfileTopBarContainer = ReactModule.createElement(View, {
					ZIndex = 100,
					tag = {
						["anchor-top-left"] = FFlagProfileModalViewStatusBarOffsetModule,
						["position-top-left"] = not FFlagProfileModalViewStatusBarOffsetModule
					},
					Position = if FFlagProfileModalViewStatusBarOffsetModule then UDim2.new(0, 0, 0, UseStatusBarHeightResult) else nil,
					Size = UDim2.new(1, 0, 0, 56)
				}, { ProfileTopBar = p1.renderTopBar() }),
				PeekViewContainer = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.new(1, 1, 1, if FFlagProfileModalViewStatusBarOffsetModule then -(UseStatusBarHeightResult + (if FFlagProfileModalViewBottomSafeAreaModule then UseSignalStateResult.bottom else 0)) else 0),
					Position = UDim2.new(0, 0, 0, if FFlagProfileModalViewStatusBarOffsetModule then UseStatusBarHeightResult else 0),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					TopInset = if FFlagFixCommunityProfileWideCoverLayoutModule and Offset > 0 then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Offset) }) else nil,
					Content = p1.renderContent()
				})
			})
		})
	})
end
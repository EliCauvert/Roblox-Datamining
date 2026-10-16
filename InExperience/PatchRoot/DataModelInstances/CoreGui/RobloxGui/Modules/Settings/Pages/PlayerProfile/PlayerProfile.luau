local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local Visibility = FoundationModule.Enums.Visibility
local IconButton = FoundationModule.IconButton
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UseDeviceOrientationFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useDeviceOrientation
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseBreakpointXOrLargerFunction = ResponsiveModule.useBreakpointXOrLarger
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local PeopleServiceModule = require(CorePackages.Workspace.Packages.PeopleService)
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local CurrentlyWearingModule = require(CorePackages.Workspace.Packages.ProfilePlatform.CurrentlyWearing)
local GetProfilePlatformModule = require(CorePackages.Workspace.Packages.ProfilePlatform.getProfilePlatform)
local UseDynamicSizeMarginModule = require(CorePackages.Workspace.Packages.ProfilePlatform.useDynamicSizeMargin)
local ProfileWrapperContextModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local AddConnectionButtonModule = require(script.Parent.AddConnectionButton)
local ProfileHeaderModule = require(script.Parent.ProfileHeader)

return ReactModule.memo(function(p1) --[[ Line: 41 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ProfileWrapperContextModule (copy), PeopleServiceModule (copy), Players (copy), SignalsReactModule (copy), UseDeviceOrientationFunction (copy), UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), RobloxAppEnumsModule (copy), UseDynamicSizeMarginModule (copy), UseDispatchFunction (copy), GetProfilePlatformModule (copy), EnumsModule (copy), View (copy), IconButton (copy), IconName (copy), Text (copy), ScrollView (copy), Visibility (copy), ProfileHeaderModule (copy), AddConnectionButtonModule (copy), CurrentlyWearingModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(ProfileWrapperContextModule)
	local ProfileId = UseContextResult.profileId
	local ProfileType = UseContextResult.profileType
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("FriendStatusStore")
	end, {}).getShouldShowFriendButton(p1.userId, (ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: p1 (copy), Players (upval)
		return if p1.userId then Players:GetPlayerByUserId(p1.userId) else nil
	end, { p1.userId }))))
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Medium)
	local NoUseBreakpointXOrLargerResult: boolean = UseDeviceOrientationResult == RobloxAppEnumsModule.DeviceOrientationMode.Portrait and not UseBreakpointXOrLargerResult
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 71 ]]
		-- upvalues: UseDispatchResult (copy), GetProfilePlatformModule (upval), ProfileId (copy), ProfileType (copy), EnumsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseDispatchResult(GetProfilePlatformModule.API({
			includeComponentOrdering = false,
			onlyEssentialComponents = true,
			profileId = ProfileId,
			profileType = ProfileType,
			components = {
				{ component = EnumsModule.Components.CurrentlyWearing },
				{ component = EnumsModule.Components.UserProfileHeader }
			}
		})):andThen(function(_) --[[ Line: 86 ]]
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
			UseStateResult2(false)
			UseStateResult2_1(false)
		end):catch(function(_) --[[ Line: 90 ]]
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
			UseStateResult2(false)
			UseStateResult2_1(true)
		end)
	end, { ProfileId, ProfileType })
	
	return if UseStateResult then nil elseif UseStateResult1 then ReactModule.createElement(View, { tag = "size-full col" }, {
		BackBar = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y row padding-xsmall",
			LayoutOrder = 1
		}, {
			BackButton = ReactModule.createElement(IconButton, {
				icon = IconName.ChevronLargeLeft,
				onActivated = p1.closePage
			})
		}),
		ErrorMessage = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y content-default text-title-medium",
			Text = "Error loading profile",
			LayoutOrder = 2
		})
	}) else ReactModule.createElement(View, {
		tag = "size-full padding-bottom-medium",
		onAbsoluteSizeChanged = UseDynamicSizeMarginModuleResult2
	}, {
		BackBar = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y row padding-xsmall",
			LayoutOrder = 1
		}, {
			BackButton = ReactModule.createElement(IconButton, {
				icon = IconName.ChevronLargeLeft,
				onActivated = p1.closePage
			})
		}),
		ScrollView = ReactModule.createElement(ScrollView, {
			tag = "size-full",
			LayoutOrder = 2,
			scroll = {
				scrollBarVisibility = Visibility.Auto,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			},
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseTokensResult.Padding.XXLarge)
			},
			padding = { top = UDim.new(0, 48) }
		}, {
			ProfileHeaderContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["size-full-0 auto-y"] = true,
					["col gap-xxlarge"] = NoUseBreakpointXOrLargerResult
				}
			}, {
				ProfileHeader = ReactModule.createElement(ProfileHeaderModule, { layoutOrder = 1, profileId = ProfileId }),
				AddConnectionButtonContainer = if UseSignalStateResult then ReactModule.createElement(View, {
					ZIndex = 2,
					LayoutOrder = 2,
					tag = {
						["size-full-0 auto-y"] = NoUseBreakpointXOrLargerResult,
						["size-2500-2200 row align-y-center"] = not NoUseBreakpointXOrLargerResult and not UseBreakpointXOrLargerResult,
						["size-3000-2200 row align-y-center"] = not NoUseBreakpointXOrLargerResult and UseBreakpointXOrLargerResult
					},
					padding = if NoUseBreakpointXOrLargerResult then {
						left = UDim.new(0, UseDynamicSizeMarginModuleResult),
						right = UDim.new(0, UseDynamicSizeMarginModuleResult)
					} else nil,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -UseDynamicSizeMarginModuleResult, 0, 0)
				}, {
					AddConnectionButton = ReactModule.createElement(AddConnectionButtonModule, { userId = p1.userId })
				}) else nil
			}),
			CurrentlyWearingCarousel = ReactModule.createElement(CurrentlyWearingModule, { layoutOrder = 3 })
		})
	})
end)
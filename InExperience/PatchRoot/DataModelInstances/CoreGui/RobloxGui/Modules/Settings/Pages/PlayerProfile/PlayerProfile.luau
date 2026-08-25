local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local foundationModule = require(corePackagesService.Packages.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local visibility = foundationModule.Enums.Visibility
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local robloxAppEnumsModule = require(corePackagesService.Workspace.Packages.RobloxAppEnums)
local useDeviceOrientation = require(corePackagesService.Workspace.Packages.RobloxAppHooks).useDeviceOrientation
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useBreakpointXOrLarger = responsiveModule.useBreakpointXOrLarger
local useDispatch = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local peopleServiceModule = require(corePackagesService.Workspace.Packages.PeopleService)
local enumsModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.Enums)
local currentlyWearingModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.CurrentlyWearing)
local getProfilePlatformModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.getProfilePlatform)
local useDynamicSizeMarginModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.useDynamicSizeMargin)
local profileWrapperContextModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local addConnectionButtonModule = require(script.Parent.AddConnectionButton)
local profileHeaderModule = require(script.Parent.ProfileHeader)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), profileWrapperContextModule (ref), peopleServiceModule (ref), playersService (ref), signalsReactModule (ref), useDeviceOrientation (ref), useBreakpointXOrLarger (ref), responsiveModule (ref), robloxAppEnumsModule (ref), useDynamicSizeMarginModule (ref), useDispatch (ref), getProfilePlatformModule (ref), enumsModule (ref), view (ref), iconButton (ref), iconName (ref), text (ref), scrollView (ref), visibility (ref), profileHeaderModule (ref), addConnectionButtonModule (ref), currentlyWearingModule (ref)
	local var15 = useTokens()
	local var16 = reactModule.useContext(profileWrapperContextModule)
	local profileId = var16.profileId
	local profileType = var16.profileType
	local var17 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("FriendStatusStore")
	end, {}).getShouldShowFriendButton(p0.userId, reactModule.useMemo(function()
		-- upvalues: p0 (ref), playersService (copy)
		return if p0.userId then playersService:GetPlayerByUserId(p0.userId) else nil
	end, { p0.userId })))
	local var18 = useBreakpointXOrLarger(responsiveModule.Keys.Medium)
	local var19 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait and not var18
	local var20, var21 = useDynamicSizeMarginModule()
	local var22, var23 = reactModule.useState(true)
	local var24, var25 = reactModule.useState(false)
	local var26 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), getProfilePlatformModule (copy), profileId (ref), profileType (ref), enumsModule (copy), var23 (ref), var25 (ref)
		var26(getProfilePlatformModule.API({
			includeComponentOrdering = false,
			onlyEssentialComponents = true,
			profileId = profileId,
			profileType = profileType,
			components = {
				{ component = enumsModule.Components.CurrentlyWearing },
				{ component = enumsModule.Components.UserProfileHeader }
			}
		})):andThen(function(_)
			-- upvalues: var23 (copy), var25 (copy)
			var23(false)
			var25(false)
		end):catch(function(_)
			-- upvalues: var23 (copy), var25 (copy)
			var23(false)
			var25(true)
		end)
	end, { profileId, profileType })
	
	return if var22 then nil elseif var24 then reactModule.createElement(view, { tag = "size-full col" }, {
		BackBar = reactModule.createElement(view, {
			tag = "size-full-0 auto-y row padding-xsmall",
			LayoutOrder = 1
		}, {
			BackButton = reactModule.createElement(iconButton, {
				icon = iconName.ChevronLargeLeft,
				onActivated = p0.closePage
			})
		}),
		ErrorMessage = reactModule.createElement(text, {
			tag = "size-full-0 auto-y content-default text-title-medium",
			Text = "Error loading profile",
			LayoutOrder = 2
		})
	}) else reactModule.createElement(view, {
		tag = "size-full padding-bottom-medium",
		onAbsoluteSizeChanged = var21
	}, {
		BackBar = reactModule.createElement(view, {
			tag = "size-full-0 auto-y row padding-xsmall",
			LayoutOrder = 1
		}, {
			BackButton = reactModule.createElement(iconButton, {
				icon = iconName.ChevronLargeLeft,
				onActivated = p0.closePage
			})
		}),
		ScrollView = reactModule.createElement(scrollView, {
			tag = "size-full",
			LayoutOrder = 2,
			scroll = {
				scrollBarVisibility = visibility.Auto,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			},
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var15.Padding.XXLarge)
			},
			padding = { top = UDim.new(0, 48) }
		}, {
			ProfileHeaderContainer = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["size-full-0 auto-y"] = true,
					["col gap-xxlarge"] = var19
				}
			}, {
				ProfileHeader = reactModule.createElement(profileHeaderModule, { layoutOrder = 1, profileId = profileId }),
				AddConnectionButtonContainer = if var17 then reactModule.createElement(view, {
					ZIndex = 2,
					LayoutOrder = 2,
					tag = {
						["size-full-0 auto-y"] = var19,
						["size-2500-2200 row align-y-center"] = not var19 and not var18,
						["size-3000-2200 row align-y-center"] = not var19 and var18
					},
					padding = if var19 then { left = UDim.new(0, var20), right = UDim.new(0, var20) } else nil,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -var20, 0, 0)
				}, {
					AddConnectionButton = reactModule.createElement(addConnectionButtonModule, { userId = p0.userId })
				}) else nil
			}),
			CurrentlyWearingCarousel = reactModule.createElement(currentlyWearingModule, { layoutOrder = 3 })
		})
	})
end)
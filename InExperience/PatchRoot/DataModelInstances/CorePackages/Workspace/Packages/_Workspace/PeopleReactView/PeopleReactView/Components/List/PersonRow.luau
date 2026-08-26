local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local fFlagPeopleTabUseProfileFrameThumbnailModule = require(peopleReactView.Flags.FFlagPeopleTabUseProfileFrameThumbnail)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local signalsReactModule = require(parent.SignalsReact)
local userProfilesModule = require(parent.UserProfiles)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local avatar = foundationModule.Avatar
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useIsRobloxSubscriber = userProfilesModule.Hooks.useIsRobloxSubscriber
local useInExperienceCombinedNameModule = require(peopleReactView.Hooks.useInExperienceCombinedName)
local platformNameModule = require(peopleReactView.Components.Buttons.PlatformName)
local personButtonRowModule = require(peopleReactView.Components.List.PersonButtonRow)
local formatUsername = userProfilesModule.Formatters.formatUsername
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local playerListRefactorUsernameFormatting = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local getFFlagAddPeoplePageCardLayout = peopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

return function(p1)
	-- upvalues: useTokens (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), reactModule (ref), peopleServiceModule (ref), getFFlagAddPeoplePageCardLayout (ref), useInExperienceCombinedNameModule (ref), useSignalBinding (ref), avatar (ref), inputSize (ref), fFlagPeopleTabUseProfileFrameThumbnailModule (ref), text (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), playerListRefactorUsernameFormatting (ref), formatUsername (ref), personButtonRowModule (ref), platformNameModule (ref)
	local var1
	local var2 = useTokens()
	local var3 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var4 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(tostring(p1.person.UserId)) else nil
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: peopleServiceModule (copy), p1 (ref), var5 (ref)
		peopleServiceModule.getService("FocusNavigationService").registerFrame(p2, p1.person.UserId)
		var5.current = p2
	end, { p1.person.UserId })
	local _ = nil
	
	if getFFlagAddPeoplePageCardLayout() then
		var1 = useInExperienceCombinedNameModule(p1.person.UserId, p1.person.DisplayName)
	else
		local var7 = reactModule.useMemo(function()
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleListStore")
		end, {})
		var1 = useSignalBinding(reactModule.useMemo(function()
			-- upvalues: var7 (ref), p1 (ref)
			return var7.getProfile(p1.person.UserId)
		end, { p1.person.UserId })):map(function(p2)
			-- upvalues: p1 (ref)
			return if p2 and string.len(p2) > 0 then p2 else p1.person.DisplayName
		end)
	end
	local var8 = reactModule.createElement(avatar, {
		LayoutOrder = 1,
		userId = p1.person.UserId,
		size = inputSize.Large,
		backgroundStyle = {
			Color3 = var2.Color.Shift.Shift_300.Color3,
			Transparency = var2.Color.Shift.Shift_300.Transparency
		},
		includeProfileFrame = fFlagPeopleTabUseProfileFrameThumbnailModule
	})
	local var9 = reactModule.createElement(text, {
		tag = "text-label-medium auto-xy text-align-x-left text-truncate-end",
		LayoutOrder = 1,
		Text = var1,
		textStyle = { Color3 = var2.Color.Content.Default.Color3 }
	})
	
	return reactModule.createElement(view, {
		tag = {
			["padding-small row bg-surface-200 radius-medium"] = true,
			["size-full-2600 gap-medium"] = var3,
			["size-full-1500"] = not var3
		},
		LayoutOrder = p1.layoutOrder,
		ref = var6
	}, {
		PortraitAvatar = if var3 then var8 else nil,
		RowContent = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["gap-medium size-full align-y-center text-no-wrap"] = true,
				["flex-between row"] = not var3,
				col = var3
			}
		}, {
			LeftContent = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["row gap-medium align-y-center text-no-wrap"] = true,
					["size-full-0 auto-y"] = var3,
					["size-0-full auto-x"] = not var3
				}
			}, {
				Avatar = if not var3 then var8 else nil,
				NameContainer = reactModule.createElement(view, {
					tag = "col gap-small auto-xy flex-evenly",
					LayoutOrder = 2
				}, {
					DisplayName = if fFlagEnableBlackbirdCheck and var4 then reactModule.createElement(view, {
						tag = "row gap-xsmall auto-xy align-y-center",
						LayoutOrder = 1
					}, {
						Name = var9,
						SubscriptionBadge = reactModule.createElement(icon, {
							LayoutOrder = 2,
							name = iconName.RobloxPlus,
							size = iconSize.Small,
							style = { Color3 = var2.Color.Content.Default.Color3 }
						})
					}) else var9,
					UserName = reactModule.createElement(text, {
						tag = "text-caption-small auto-xy text-align-x-left content-muted text-truncate-end",
						LayoutOrder = 2,
						Text = if playerListRefactorUsernameFormatting then formatUsername(p1.person.Name) else "@" .. p0.person.Name
					})
				})
			}),
			RightContent = reactModule.createElement(view, {
				tag = "row auto-x size-0-1000 gap-medium",
				LayoutOrder = 2
			}, {
				PersonButtonRow = reactModule.createElement(personButtonRowModule, {
					userId = p1.person.UserId,
					index = p1.layoutOrder,
					personRowRef = var5
				}),
				PlatformNameSection = reactModule.createElement(platformNameModule, { UserId = p1.person.UserId })
			})
		})
	})
end
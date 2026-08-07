local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
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

return function(p0) --[[ line: 47 | named "PersonRow" ]]
	-- upvalues: useTokens (ref), useDeviceOrientation (ref), robloxAppEnumsModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), reactModule (ref), peopleServiceModule (ref), getFFlagAddPeoplePageCardLayout (ref), useInExperienceCombinedNameModule (ref), useSignalBinding (ref), avatar (ref), inputSize (ref), text (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), playerListRefactorUsernameFormatting (ref), formatUsername (ref), personButtonRowModule (ref), platformNameModule (ref)
	local var18
	local var12 = useTokens()
	local var13 = useDeviceOrientation() == robloxAppEnumsModule.DeviceOrientationMode.Portrait
	local var14 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(tostring(p0.person.UserId)) else nil
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useCallback(function(p1) --[[ line: 58 ]]
		-- upvalues: peopleServiceModule (copy), p0 (ref), var15 (ref)
		peopleServiceModule.getService("FocusNavigationService").registerFrame(p1, p0.person.UserId)
		var15.current = p1
	end, { p0.person.UserId })
	local _ = nil
	
	if getFFlagAddPeoplePageCardLayout() then
		var18 = useInExperienceCombinedNameModule(p0.person.UserId, p0.person.DisplayName)
	else
		local var17 = reactModule.useMemo(function() --[[ line: 68 ]]
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleListStore")
		end, {})
		var18 = useSignalBinding(reactModule.useMemo(function() --[[ line: 72 ]]
			-- upvalues: var17 (ref), p0 (ref)
			return var17.getProfile(p0.person.UserId)
		end, { p0.person.UserId })):map(function(p2) --[[ line: 78 ]]
			-- upvalues: p0 (ref)
			return if p2 and string.len(p2) > 0 then p2 else p0.person.DisplayName
		end)
	end
	local var19 = reactModule.createElement(avatar, {
		LayoutOrder = 1,
		userId = p0.person.UserId,
		size = inputSize.Large,
		backgroundStyle = {
			Color3 = var12.Color.Shift.Shift_300.Color3,
			Transparency = var12.Color.Shift.Shift_300.Transparency
		}
	})
	local var20 = reactModule.createElement(text, {
		tag = "text-label-medium auto-xy text-align-x-left text-truncate-end",
		LayoutOrder = 1,
		Text = var18,
		textStyle = { Color3 = var12.Color.Content.Default.Color3 }
	})
	
	return reactModule.createElement(view, {
		tag = {
			["padding-small row bg-surface-200 radius-medium"] = true,
			["size-full-2600 gap-medium"] = var13,
			["size-full-1500"] = not var13
		},
		LayoutOrder = p0.layoutOrder,
		ref = var16
	}, {
		PortraitAvatar = if var13 then var19 else nil,
		RowContent = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["gap-medium size-full align-y-center text-no-wrap"] = true,
				["flex-between row"] = not var13,
				col = var13
			}
		}, {
			LeftContent = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["row gap-medium align-y-center text-no-wrap"] = true,
					["size-full-0 auto-y"] = var13,
					["size-0-full auto-x"] = not var13
				}
			}, {
				Avatar = if not var13 then var19 else nil,
				NameContainer = reactModule.createElement(view, {
					tag = "col gap-small auto-xy flex-evenly",
					LayoutOrder = 2
				}, {
					DisplayName = if fFlagEnableBlackbirdCheck and var14 then reactModule.createElement(view, {
						tag = "row gap-xsmall auto-xy align-y-center",
						LayoutOrder = 1
					}, {
						Name = var20,
						SubscriptionBadge = reactModule.createElement(icon, {
							LayoutOrder = 2,
							name = iconName.RobloxPlus,
							size = iconSize.Small,
							style = { Color3 = var12.Color.Content.Default.Color3 }
						})
					}) else var20,
					UserName = reactModule.createElement(text, {
						tag = "text-caption-small auto-xy text-align-x-left content-muted text-truncate-end",
						LayoutOrder = 2,
						Text = if playerListRefactorUsernameFormatting then formatUsername(p0.person.Name) else "@" .. p0.person.Name
					})
				})
			}),
			RightContent = reactModule.createElement(view, {
				tag = "row auto-x size-0-1000 gap-medium",
				LayoutOrder = 2
			}, {
				PersonButtonRow = reactModule.createElement(personButtonRowModule, {
					userId = p0.person.UserId,
					index = p0.layoutOrder,
					personRowRef = var15
				}),
				PlatformNameSection = reactModule.createElement(platformNameModule, { UserId = p0.person.UserId })
			})
		})
	})
end